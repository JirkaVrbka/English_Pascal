program Project2;

uses
  Forms,
  UnitHlavni in 'UnitHlavni.pas' {wnHlavniEnglish},
  UnitSlovickaEasy in 'UnitSlovickaEasy.pas' {wnSlovicka},
  UnitPoslechEasy in 'UnitPoslechEasy.pas' {wnPoslechEasy},
  UnitPoslechMedium in 'UnitPoslechMedium.pas' {wnPoslechMedium},
  UnitPoslechHard in 'UnitPoslechHard.pas' {wnPoslechHard};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TwnHlavniEnglish, wnHlavniEnglish);
  Application.CreateForm(TwnSlovicka, wnSlovicka);
  Application.CreateForm(TwnPoslechEasy, wnPoslechEasy);
  Application.CreateForm(TwnPoslechMedium, wnPoslechMedium);
  Application.CreateForm(TwnPoslechHard, wnPoslechHard);
  Application.Run;
end.
