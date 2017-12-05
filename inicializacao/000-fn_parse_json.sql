/*
Mais informações em https://www.simple-talk.com/sql/t-sql-programming/consuming-json-strings-in-sql-server/
*/

if object_id('fn_parse_json') is not null  
  drop function dbo.fn_parse_json
go

create function dbo.fn_parse_json( @json nvarchar(max))
returns @hierarchy table
  (
   element_id int identity(1, 1) not null, /* internal surrogate primary key gives the order of parsing and the list order */
   sequence_no [int] null, /* the place in the sequence for the element */
   parent_id int,/* if the element has a parent then it is in this column. the document is the ultimate parent, so you can get the structure from recursing from the document */
   object_id int,/* each list or object has an object id. this ties all elements to a parent. lists are treated as objects here */
   name nvarchar(2000),/* the name of the object */
   string_value nvarchar(max) not null,/*the string representation of the value of the element. */
   value_type varchar(10) not null /* the declared type of the value represented as a string in string_value*/
  )
as
begin
  declare
    @first_object int, --the index of the first open bracket found in the json string
    @open_delimiter int,--the index of the next open bracket found in the json string
    @next_open_delimiter int,--the index of subsequent open bracket found in the json string
    @next_close_delimiter int,--the index of subsequent close bracket found in the json string
    @type nvarchar(10),--whether it denotes an object or an array
    @next_close_delimiter_char char(1),--either a '}' or a ']'
    @contents nvarchar(max), --the unparsed contents of the bracketed expression
    @start int, --index of the start of the token that you are parsing
    @end int,--index of the end of the token that you are parsing
    @param int,--the parameter at the end of the next object/array token
    @end_of_name int,--the index of the start of the parameter at end of object/array token
    @token nvarchar(200),--either a string or object
    @value nvarchar(max), -- the value as a string
    @sequence_no int, -- the sequence number within a list
    @name nvarchar(200), --the name as a string
    @parent_id int,--the next parent id to allocate
    @len_json int,--the current length of the json string
    @characters nchar(36),--used to convert hex to decimal
    @result bigint,--the value of the hex symbol being parsed
    @index smallint,--used for parsing the hex value
    @escape int --the index of the next escape character
   
 
  declare @strings table /* in this temporary table we keep all strings, even the names of the elements, since they are 'escaped' in a different way, and may contain, unescaped, brackets denoting objects or lists. these are replaced in the json string by tokens representing the string */
    (
     string_id int identity(1, 1),
     string_value nvarchar(max)
    )
  select--initialise the characters to convert hex to ascii
    @characters='0123456789abcdefghijklmnopqrstuvwxyz',
    @sequence_no=0, --set the sequence no. to something sensible.
  /* firstly we process all strings. this is done because [{} and ] aren't escaped in strings, which complicates an iterative parse. */
    @parent_id=0;
  while 1=1 --forever until there is nothing more to do
    begin
      select
        @start=patindex('%[^A-Za-z]["]%', @json collate sql_latin1_general_cp850_bin);--next delimited string
      if @start=0 break --no more so drop through the while loop
      if substring(@json, @start+1, 1)='"'
        begin --delimited name
          set @start=@start+1;
          set @end=patindex('%[^\]["]%', right(@json, len(@json+'|')-@start) collate sql_latin1_general_cp850_bin);
        end
      if @end=0 --no end delimiter to last string
        break --no more
      select @token=substring(@json, @start+1, @end-1)
      --now put in the escaped control characters
      select @token=replace(@token, fromstring, tostring)
      from
        (select
          '\"' as fromstring, '"' as tostring
         union all select '\\', '\'
         union all select '\/', '/'
         union all select '\b', char(08)
         union all select '\f', char(12)
         union all select '\n', char(10)
         union all select '\r', char(13)
         union all select '\t', char(09)
        ) substitutions
      select @result=0, @escape=1
  --begin to take out any hex escape codes
      while @escape>0
        begin
          select @index=0,
          --find the next hex escape sequence
          @escape=patindex('%\x[0-9a-f][0-9a-f][0-9a-f][0-9a-f]%', @token collate sql_latin1_general_cp850_bin)
          if @escape>0 --if there is one
            begin
              while @index<4 --there are always four digits to a \x sequence  
                begin
                  select --determine its value
                    @result=@result+power(16, @index)
                    *(charindex(substring(@token, @escape+2+3-@index, 1),
                                @characters)-1), @index=@index+1 ;
        
                end
                -- and replace the hex sequence by its unicode value
              select @token=stuff(@token, @escape, 6, nchar(@result))
            end
        end
      --now store the string away
      insert into @strings (string_value) select @token
      -- and replace the string with a token
      select @json=stuff(@json, @start, @end+1,
                    '@string'+convert(nvarchar(5), @@identity))
    end
  -- all strings are now removed. now we find the first leaf. 
  while 1=1  --forever until there is nothing more to do
  begin
 
  select @parent_id=@parent_id+1
  --find the first object or list by looking for the open bracket
  select @first_object=patindex('%[{[[]%', @json collate sql_latin1_general_cp850_bin)--object or array
  if @first_object = 0 break
  if (substring(@json, @first_object, 1)='{')
    select @next_close_delimiter_char='}', @type='object'
  else
    select @next_close_delimiter_char=']', @type='array'
  select @open_delimiter=@first_object
 
  while 1=1 --find the innermost object or list...
    begin
      select
        @len_json=len(@json+'|')-1
  --find the matching close-delimiter proceeding after the open-delimiter
      select
        @next_close_delimiter=charindex(@next_close_delimiter_char, @json,
                                      @open_delimiter+1)
  --is there an intervening open-delimiter of either type
      select @next_open_delimiter=patindex('%[{[[]%',
             right(@json, @len_json-@open_delimiter)collate sql_latin1_general_cp850_bin)--object
      if @next_open_delimiter=0
        break
      select @next_open_delimiter=@next_open_delimiter+@open_delimiter
      if @next_close_delimiter<@next_open_delimiter
        break
      if substring(@json, @next_open_delimiter, 1)='{'
        select @next_close_delimiter_char='}', @type='object'
      else
        select @next_close_delimiter_char=']', @type='array'
      select @open_delimiter=@next_open_delimiter
    end
  ---and parse out the list or name/value pairs
  select
    @contents=substring(@json, @open_delimiter+1,
                        @next_close_delimiter-@open_delimiter-1)
  select
    @json=stuff(@json, @open_delimiter,
                @next_close_delimiter-@open_delimiter+1,
                '@'+@type+convert(nvarchar(5), @parent_id))
  while (patindex('%[A-Za-z0-9@+.e]%', @contents collate sql_latin1_general_cp850_bin))<>0
    begin
      if @type='object' --it will be a 0-n list containing a string followed by a string, number,boolean, or null
        begin
          select
            @sequence_no=0,@end=charindex(':', ' '+@contents)--if there is anything, it will be a string-based name.
          select  @start=patindex('%[^A-Za-z@][@]%', ' '+@contents collate sql_latin1_general_cp850_bin)--aaaaaaaa
          select @token=substring(' '+@contents, @start+1, @end-@start-1),
            @end_of_name=patindex('%[0-9]%', @token collate sql_latin1_general_cp850_bin),
            @param=right(@token, len(@token)-@end_of_name+1)
          select
            @token=left(@token, @end_of_name-1),
            @contents=right(' '+@contents, len(' '+@contents+'|')-@end-1)
          select  @name=string_value from @strings
            where string_id=@param --fetch the name
        end
      else
        select @name=null,@sequence_no=@sequence_no+1
      select
        @end=charindex(',', @contents)-- a string-token, object-token, list-token, number,boolean, or null
      if @end=0
        select  @end=patindex('%[A-Za-z0-9@+.e][^A-Za-z0-9@+.e]%', @contents+' ' collate sql_latin1_general_cp850_bin)
          +1
       select
        @start=patindex('%[^A-Za-z0-9@+.e][A-Za-z0-9@+.e]%', ' '+@contents collate sql_latin1_general_cp850_bin)
      --select @start,@end, len(@contents+'|'), @contents 
      select
        @value=rtrim(substring(@contents, @start, @end-@start)),
        @contents=right(@contents+' ', len(@contents+'|')-@end)
      if substring(@value, 1, 7)='@object'
        insert into @hierarchy
          (name, sequence_no, parent_id, string_value, object_id, value_type)
          select @name, @sequence_no, @parent_id, substring(@value, 8, 5),
            substring(@value, 8, 5), 'object'
      else
        if substring(@value, 1, 6)='@array'
          insert into @hierarchy
            (name, sequence_no, parent_id, string_value, object_id, value_type)
            select @name, @sequence_no, @parent_id, substring(@value, 7, 5),
              substring(@value, 7, 5), 'array'
        else
          if substring(@value, 1, 7)='@string'
            insert into @hierarchy
              (name, sequence_no, parent_id, string_value, value_type)
              select @name, @sequence_no, @parent_id, string_value, 'string'
              from @strings
              where string_id=substring(@value, 8, 5)
          else
            if @value in ('true', 'false')
              insert into @hierarchy
                (name, sequence_no, parent_id, string_value, value_type)
                select @name, @sequence_no, @parent_id, @value, 'boolean'
            else
              if @value='null'
                insert into @hierarchy
                  (name, sequence_no, parent_id, string_value, value_type)
                  select @name, @sequence_no, @parent_id, @value, 'null'
              else
                if patindex('%[^0-9]%', @value collate sql_latin1_general_cp850_bin)>0
                  insert into @hierarchy
                    (name, sequence_no, parent_id, string_value, value_type)
                    select @name, @sequence_no, @parent_id, @value, 'real'
                else
                  insert into @hierarchy
                    (name, sequence_no, parent_id, string_value, value_type)
                    select @name, @sequence_no, @parent_id, @value, 'int'
      if @contents=' ' select @sequence_no=0
    end
  end
insert into @hierarchy (name, sequence_no, parent_id, string_value, object_id, value_type)
  select '-',1, null, '', @parent_id-1, isnull(@type, 'null')
--
   return
end
go

-- create the data type
if exists (select * from sys.types where name like 'hierarchy')
  drop type dbo.hierarchy
go
create type dbo.hierarchy as table
(
   element_id int not null, /* internal surrogate primary key gives the order of parsing and the list order */
   sequence_no [int] null, /* the place in the sequence for the element */
   parent_id int,/* if the element has a parent then it is in this column. the document is the ultimate parent, so you can get the structure from recursing from the document */
   [object_id] int,/* each list or object has an object id. this ties all elements to a parent. lists are treated as objects here */
   name nvarchar(2000),/* the name of the object, null if it hasn't got one */
   string_value nvarchar(max) not null,/*the string representation of the value of the element. */
   value_type varchar(10) not null /* the declared type of the value represented as a string in string_value*/
    primary key (element_id)
)