unit UnitPoslechEasy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPlayer, ExtCtrls, Buttons, jpeg;

type
  TwnPoslechEasy = class(TForm)
    MediaPlayer1: TMediaPlayer;
    LblNazevPisne: TLabel;
    LblAutor: TLabel;
    ImgPrehravac: TImage;
    SpbtnPlay: TSpeedButton;
    ImgCasovac: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    BtnHodnoceni: TButton;
    LblVys1: TLabel;
    LblVys2: TLabel;
    LblVys3: TLabel;
    LblVys4: TLabel;
    LblVys5: TLabel;
    LblVys6: TLabel;
    LblVys7: TLabel;
    LblVys8: TLabel;
    LblVys9: TLabel;
    LblVys10: TLabel;
    LblHodnoceni: TLabel;
    LblHodnoceni1: TLabel;
    LblHodnoceni2: TLabel;
    Image2: TImage;
    LblHodnoceni4: TLabel;
    LblHodnoceni3: TLabel;
    LblZnamka: TLabel;
    LblProcenta: TLabel;
    LblSpatne: TLabel;
    LblSpravne: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure SpbtnPlayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DatabazeEasy;
    procedure BtnHodnoceniClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  wnPoslechEasy: TwnPoslechEasy;
  Zmacknuto:boolean;
  PocesS,spravne:integer;
  kontrola: array [1..15] of string;

implementation
 uses UnitHlavni;
{$R *.dfm}

procedure TwnPoslechEasy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 MediaPlayer1.Stop;
 wnHlavniEnglish.Show;
end;

procedure TwnPoslechEasy.FormCreate(Sender: TObject);
begin
Image2.Canvas.Brush.Color:=clWhite;
Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);
wnPoslechEasy.Color:=wnHlavniEnglish.color;
 with ImgCasovac.canvas do
  begin
    brush.Color:=rgb(134,134,134);
    Rectangle(-1,-1,ImgPrehravac.Width+1,ImgPrehravac.Height+1);
  end;
   Zmacknuto:=false;

end;

procedure TwnPoslechEasy.FormShow(Sender: TObject);
begin
Image2.Visible:=false;
 spravne:=0;
 wnPoslechEasy.Color:=wnHlavniEnglish.color;
 MediaPlayer1.FileName :=('The Juliana Theory We are ontop of the world.mp3');
 MediaPlayer1.Open;
 with ImgCasovac.canvas do
  begin
  pen.Color:=rgb(134,134,134);
  Rectangle(-1,-1,ImgCasovac.Width+1,ImgCasovac.Height+1);
  end;

 LblHodnoceni.Visible:=false;
 LblHodnoceni1.Visible:=false;
 LblHodnoceni2.Visible:=false;
 LblHodnoceni3.Visible:=false;
 LblHodnoceni4.Visible:=false;
 LblSpravne.Visible:=false;
 LblSpatne.Visible:=false;
 LblProcenta.Visible:=false;
 LblZnamka.Visible:=false;

 //FormCreate(wnPoslechEasy);
 Timer1.Enabled:=false;
 PocesS:=0;
 Zmacknuto:=true;
 SpbtnPlayClick(wnPoslechEasy);

  LblVys1.Caption:='';
 LblVys2.Caption:='';
 LblVys3.Caption:='';
 LblVys4.Caption:='';
 LblVys5.Caption:='';
 LblVys6.Caption:='';
 LblVys7.Caption:='';
 LblVys8.Caption:='';
 LblVys9.Caption:='';
 LblVys10.Caption:='';

  Edit1.Enabled:=true;
 Edit2.Enabled:=true;
 Edit3.Enabled:=true;
 Edit4.Enabled:=true;
 Edit5.Enabled:=true;
 Edit6.Enabled:=true;
 Edit7.Enabled:=true;
 Edit8.Enabled:=true;
 Edit9.Enabled:=true;
 Edit10.Enabled:=true;

end;

procedure TwnPoslechEasy.SpbtnPlayClick(Sender: TObject);
begin

//easy
 if not Zmacknuto then
  begin
    Zmacknuto:=true;
    SpbtnPlay.Glyph.LoadFromFile('BtnPause.bmp');
    MediaPlayer1.Play;
    Timer1.Enabled:=true;

  end
  else
   begin
    Timer1.Enabled:=false;
    Zmacknuto:=false;
    SpbtnPlay.Glyph.LoadFromFile('BtnPlay.bmp');
    MediaPlayer1.Pause;
   end;
end;

procedure TwnPoslechEasy.Timer1Timer(Sender: TObject);
var I:integer;
begin
 //200
 //345
 PocesS:=PocesS+1;

 with ImgCasovac.Canvas do
 begin
  pen.Color:=rgb(205,38,38);

  for I:=0 to ImgCasovac.Height do
   begin
     moveto(0,I);
     lineto(PocesS,I);

   end;
 end;

  if PocesS=ImgCasovac.Width then
  begin
    Timer1.Enabled:=false;
    MediaPlayer1.Stop;
    if Zmacknuto=true then
    SpbtnPlayClick(wnPoslechEasy);
     with ImgCasovac.canvas do
  begin
  pen.Color:=rgb(134,134,134);
  Rectangle(-1,-1,ImgCasovac.Width+1,ImgCasovac.Height+1);
  end;
  end;
end;

procedure TwnPoslechEasy.BtnHodnoceniClick(Sender: TObject);
begin
if BtnHodnoceni.Caption='Konec' then Close
 else
  begin
DatabazeEasy;
 if  AnsiUpperCase(edit1.Text)= AnsiUpperCase(kontrola[1]) then spravne:=spravne+1
  else LblVys1.Caption:=kontrola[1];
 if  AnsiUpperCase(edit2.Text)= AnsiUpperCase(kontrola[2]) then spravne:=spravne+1
  else LblVys2.Caption:=kontrola[2];
 if  AnsiUpperCase(edit3.Text)= AnsiUpperCase(kontrola[3]) then spravne:=spravne+1
  else LblVys3.Caption:=kontrola[3];
 if  AnsiUpperCase(edit4.Text)= AnsiUpperCase(kontrola[4]) then spravne:=spravne+1
  else LblVys4.Caption:=kontrola[4];
 if  AnsiUpperCase(edit5.Text)= AnsiUpperCase(kontrola[5]) then spravne:=spravne+1
  else LblVys5.Caption:=kontrola[5];
 if  AnsiUpperCase(edit6.Text)= AnsiUpperCase(kontrola[6]) then spravne:=spravne+1
  else LblVys6.Caption:=kontrola[6];
 if  AnsiUpperCase(edit7.Text)= AnsiUpperCase(kontrola[7]) then spravne:=spravne+1
  else LblVys7.Caption:=kontrola[7];
 if  AnsiUpperCase(edit8.Text)= AnsiUpperCase(kontrola[8]) then spravne:=spravne+1
  else LblVys8.Caption:=kontrola[8];
 if  AnsiUpperCase(edit9.Text)= AnsiUpperCase(kontrola[9]) then spravne:=spravne+1
  else LblVys9.Caption:=kontrola[9];
 if  AnsiUpperCase(edit10.Text)= AnsiUpperCase(kontrola[10]) then spravne:=spravne+1
  else LblVys10.Caption:=kontrola[10];
 LblSpravne.caption:=inttostr(spravne);
 LblSpatne.Caption:=inttostr(10-spravne);
 LblProcenta.Caption:=inttostr(round(spravne/10)*100)+'%';
 if spravne>8 then LblZnamka.caption:='1';
 if spravne=8 then LblZnamka.caption:='2';
 if spravne=7 then LblZnamka.caption:='3';
 if spravne=6 then LblZnamka.caption:='4';
 if spravne<6 then LblZnamka.caption:='5';
  LblHodnoceni.Visible:=true;
 LblHodnoceni1.Visible:=true;
 LblHodnoceni2.Visible:=true;
 LblHodnoceni3.Visible:=true;
 LblHodnoceni4.Visible:=true;
 LblSpravne.Visible:=true;
 LblSpatne.Visible:=true;
 LblProcenta.Visible:=true;
 LblZnamka.Visible:=true;
 Image2.Visible:=true;

 if Zmacknuto=true then
 SpbtnPlayClick(wnPoslechEasy);

  Edit1.Enabled:=false;
 Edit2.Enabled:=false;
 Edit3.Enabled:=false;
 Edit4.Enabled:=false;
 Edit5.Enabled:=false;
 Edit6.Enabled:=false;
 Edit7.Enabled:=false;
 Edit8.Enabled:=false;
 Edit9.Enabled:=false;
 Edit10.Enabled:=false;

 BtnHodnoceni.Caption:='Konec';
 end;

 end;

procedure TwnPoslechEasy.DatabazeEasy;
begin
 kontrola[1]:='I';
 kontrola[2]:='time';
 kontrola[3]:='feels';
 kontrola[4]:='pocket';
 kontrola[5]:='pulled';
 kontrola[6]:='take';
 kontrola[7]:='tonight';
 kontrola[8]:='time';
 kontrola[9]:='feels';
 kontrola[10]:='behind';
end;



end.
