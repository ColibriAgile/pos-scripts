update [dbo].[ticket]
  set estado='consumindo'
where estado='pago';

update [dbo].[ticket]
  set estado='expedido'
where estado='expedido e pago';

go