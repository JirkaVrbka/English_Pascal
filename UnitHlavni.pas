unit UnitHlavni;

interface
//UnitSlovickaEasy;

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, UnitSlovickaEasy,UnitPoslechEasy, UnitPoslechMedium,UnitPoslechHard,
  jpeg;

type
  TwnHlavniEnglish = class(TForm)
    LblNapis: TLabel;
    LblNadpis: TLabel;
    LblTesty: TLabel;
    BtnSlovicka: TButton;
    BtnPoslech: TButton;
    LblPodtrh1: TLabel;
    LblPodtrh2: TLabel;
    BtnEasy: TButton;
    BtnMedium: TButton;
    BtnHard: TButton;
    Timer1: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BtnSlovickaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnPoslechClick(Sender: TObject);
    procedure BtnGramatikaClick(Sender: TObject);
    Procedure Zneviditelneni;
    procedure BtnEasyClick(Sender: TObject);
    procedure BtnMediumClick(Sender: TObject);
    procedure BtnHardClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  wnHlavniEnglish: TwnHlavniEnglish;
  TimerPostup,Tlacitko:shortint;

  {const BarvaSlovicka: tcolor=rgb(251,243,111);
        BarvaPoslech: tcolor=rgb(120,123,242);
        BarvaGramatika: tcolor= RGB(252,39,43);   }

implementation



{$R *.dfm}

procedure TwnHlavniEnglish.BtnEasyClick(Sender: TObject);
begin
if wnHlavniEnglish.color=rgb(251,243,111) then
 begin
 wnSlovicka.DatabazeEasy;
 UnitSlovickaEasy.wnSlovicka.Show;
 wnHlavniEnglish.Hide;
 end;

if wnHlavniEnglish.Color=rgb(119,122,242) then
 begin
  UnitPoslechEasy.wnPoslechEasy.Show;
  wnHlavniEnglish.Hide;
 end;
end;

procedure TwnHlavniEnglish.BtnGramatikaClick(Sender: TObject);
begin
wnHlavniEnglish.Color:=RGB(252,39,43);
Zneviditelneni;
Timer1.Enabled:=true;
end;

procedure TwnHlavniEnglish.BtnHardClick(Sender: TObject);
begin
if wnHlavniEnglish.color=rgb(251,243,111) then
 begin
 wnSlovicka.DatabazeHard;
 UnitSlovickaEasy.wnSlovicka.Show;
 wnHlavniEnglish.Hide;
 end;

  if wnHlavniEnglish.Color=rgb(119,122,242) then
 begin
  UnitPoslechHard.wnPoslechHard.Show;
  wnHlavniEnglish.Hide;
 end;
end;

procedure TwnHlavniEnglish.BtnMediumClick(Sender: TObject);
begin
if wnHlavniEnglish.color=rgb(251,243,111) then
 begin
 wnSlovicka.DatabazeMedium;
 UnitSlovickaEasy.wnSlovicka.Show;
 wnHlavniEnglish.Hide;
 end;

 if wnHlavniEnglish.Color=rgb(119,122,242) then
 begin
  UnitPoslechMedium.wnPoslechMedium.Show;
  wnHlavniEnglish.Hide;
 end;
end;

procedure TwnHlavniEnglish.BtnPoslechClick(Sender: TObject);
begin
wnHlavniEnglish.Color:=rgb(119,122,242);
Zneviditelneni;
Timer1.Enabled:=true;
Tlacitko:=2;
//Image5.Picture.LoadFromFile('htc_wallpaper_03.jpg');

end;

procedure TwnHlavniEnglish.BtnSlovickaClick(Sender: TObject);
begin
wnHlavniEnglish.Color:=rgb(251,243,111);
Zneviditelneni;
Timer1.Enabled:=true;
Tlacitko:=1;
//Image5.Picture.LoadFromFile('Birds And Leaves on Yellow Background.jpg');
end;

procedure TwnHlavniEnglish.FormCreate(Sender: TObject);
begin
//wnHlavniEnglish.Color:=rgb(243,210,109);
Zneviditelneni;
wnHlavniEnglish.Show;
Image5.canvas.Brush.Color:=clWhite;
Image6.canvas.Brush.Color:=clWhite;
Image5.Canvas.Rectangle(-1,-1,Image5.Width+1,1000);
Image6.Canvas.Rectangle(-1,-1,Image6.Width+1,1000);
Image5.Height:=20;
Image6.Height:=20;
Tlacitko:=0;
end;

procedure TwnHlavniEnglish.FormShow(Sender: TObject);
begin
 Image1.Canvas.Pen.Color:=clWhite;
Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
Image3.Canvas.Pen.Color:=clWhite;
Image3.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
Image2.Canvas.Pen.Color:=clWhite;
Image2.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
Image5.canvas.Brush.Color:=clWhite;
Image6.canvas.Brush.Color:=clWhite;
{Image5.Canvas.Rectangle(-1,-1,Image5.Width+1,1000);
Image6.Canvas.Rectangle(-1,-1,Image6.Width+1,1000);
Image5.Height:=30;
Image6.Height:=30; }
end;

Procedure TwnHlavniEnglish.Zneviditelneni;
begin
LblPodtrh1.Visible:=false;
LblPodtrh2.Visible:=false;
BtnMedium.Visible:=false;
BtnEasy.Visible:=false;
BtnHard.Visible:=false;
end;

procedure TwnHlavniEnglish.Timer1Timer(Sender: TObject);
begin
TimerPostup:=TimerPostup+1;
case TimerPostup of
4:LblPodtrh1.Visible:=true;
8:LblPodtrh2.Visible:=true;
6:BtnMedium.Visible:=true;
2:BtnEasy.Visible:=true;
10:BtnHard.Visible:=true;
end;

 Image5.Visible:=true;


//300/5=60
if tlacitko=1 then
begin
Image6.Height:=30*TimerPostup;
if Image5.Height>25 then
Image5.Top:=Image5.Top+20*TimerPostup;
end;
if tlacitko=2 then
begin
Image5.Height:=30*TimerPostup;
if Image6.Height>25 then
Image6.Top:=Image6.Top+20*TimerPostup;
end;



if TimerPostup=11 then
 begin
   TimerPostup:=0;
   Timer1.Enabled:=false;
    Image5.Top:=270;
    Image6.Top:=270;
    if tlacitko=1 then
begin
Image5.Height:=30;
end;
if tlacitko=2 then
begin
Image6.Height:=3-0;
end;
 end;

end;






end.
