unit UnitPoslechHard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, MPlayer, Buttons, jpeg;

type
  TwnPoslechHard = class(TForm)
    LblNazevPisne: TLabel;
    LblAutor: TLabel;
    ImgPrehravac: TImage;
    SpbtnPlay: TSpeedButton;
    ImgCasovac: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    LblVys1: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    LblVys2: TLabel;
    LblVys3: TLabel;
    LblVys4: TLabel;
    LblVys5: TLabel;
    LblVys6: TLabel;
    LblVys7: TLabel;
    LblVys8: TLabel;
    LblVys9: TLabel;
    LblVys10: TLabel;
    LblVys11: TLabel;
    LblVys12: TLabel;
    LblVys13: TLabel;
    LblVys14: TLabel;
    LblVys15: TLabel;
    LblVys16: TLabel;
    Label39: TLabel;
    MediaPlayer1: TMediaPlayer;
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
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Timer1: TTimer;
    LblHodnoceni1: TLabel;
    LblHodnoceni2: TLabel;
    Image2: TImage;
    LblHodnoceni4: TLabel;
    LblHodnoceni3: TLabel;
    LblZnamka: TLabel;
    LblProcenta: TLabel;
    LblSpatne: TLabel;
    LblSpravne: TLabel;
    LblHodnoceni: TLabel;
    Image1: TImage;
    procedure SpbtnPlayClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnHodnoceniClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Databaze;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  wnPoslechHard: TwnPoslechHard;
  Zmacknuto:boolean;
  PocesS,spravne:integer;
  kontrola: array [1..22] of string;

implementation
  uses UnitHlavni, UnitPoslechMedium;
{$R *.dfm}

procedure TwnPoslechHard.BtnHodnoceniClick(Sender: TObject);
begin
if BtnHodnoceni.Caption='Konec' then Close
 else
  begin
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
  if  AnsiUpperCase(edit11.Text)= AnsiUpperCase(kontrola[11]) then spravne:=spravne+1
  else LblVys11.Caption:=kontrola[11];
   if  AnsiUpperCase(edit12.Text)= AnsiUpperCase(kontrola[12]) then spravne:=spravne+1
  else LblVys12.Caption:=kontrola[12];
   if  AnsiUpperCase(edit13.Text)= AnsiUpperCase(kontrola[13]) then spravne:=spravne+1
  else LblVys13.Caption:=kontrola[13];
   if  AnsiUpperCase(edit14.Text)= AnsiUpperCase(kontrola[14]) then spravne:=spravne+1
  else LblVys14.Caption:=kontrola[14];
   if  AnsiUpperCase(edit15.Text)= AnsiUpperCase(kontrola[15]) then spravne:=spravne+1
  else LblVys15.Caption:=kontrola[15];
   if  AnsiUpperCase(edit16.Text)= AnsiUpperCase(kontrola[16]) then spravne:=spravne+1
  else LblVys16.Caption:=kontrola[16];

  Image2.Visible:=true;
   LblSpravne.caption:=inttostr(spravne);
 LblSpatne.Caption:=inttostr(16-spravne);
 LblProcenta.Caption:=inttostr(round(spravne/16)*100);//+'%';
 if strtoint(LblProcenta.Caption)>=90 then LblZnamka.caption:='1'
  else
  if strtoint(LblProcenta.Caption)>=80 then LblZnamka.caption:='2'
   else
   if strtoint(LblProcenta.Caption)>=70 then LblZnamka.caption:='3'
    else
    if strtoint(LblProcenta.Caption)>=60 then LblZnamka.caption:='4'
     else
      if strtoint(LblProcenta.Caption)<60 then LblZnamka.caption:='5';
 LblProcenta.Caption:=LblProcenta.Caption+' %';
  LblHodnoceni.Visible:=true;
 LblHodnoceni1.Visible:=true;
 LblHodnoceni2.Visible:=true;
 LblHodnoceni3.Visible:=true;
 LblHodnoceni4.Visible:=true;
 LblSpravne.Visible:=true;
 LblSpatne.Visible:=true;
 LblProcenta.Visible:=true;
 LblZnamka.Visible:=true;
 

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
 Edit11.Enabled:=false;
 Edit12.Enabled:=false;
 Edit13.Enabled:=false;
 Edit14.Enabled:=false;
 Edit15.Enabled:=false;
 Edit16.Enabled:=false;

 BtnHodnoceni.Caption:='Konec';

 if Zmacknuto=true then
 SpbtnPlayClick(wnPoslechMedium);
 end;
end;

procedure TwnPoslechHard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 wnHlavniEnglish.Show;
 MediaPlayer1.Stop;
end;

procedure TwnPoslechHard.FormCreate(Sender: TObject);
begin
databaze;
Image2.Canvas.Brush.Color:=clWhite;
Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);
end;

procedure TwnPoslechHard.FormShow(Sender: TObject);
begin
 Image2.Visible:=false;
 spravne:=0;
 wnPoslechHard.Color:=wnHlavniEnglish.color;
 MediaPlayer1.FileName :=('The Civil Wars   -Barton Hollow- SXSW 2011 Showcasing Artist.mp3');
 MediaPlayer1.Open;
 with ImgCasovac.canvas do
  begin
  brush.Color:=rgb(134,134,134);
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
 SpbtnPlayClick(wnPoslechMedium);

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
  LblVys11.Caption:='';
 LblVys12.Caption:='';
 LblVys13.Caption:='';
 LblVys14.Caption:='';
 LblVys15.Caption:='';
 LblVys16.Caption:='';

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
 Edit11.Enabled:=true;
 Edit12.Enabled:=true;
 Edit13.Enabled:=true;
 Edit14.Enabled:=true;
 Edit15.Enabled:=true;
 Edit16.Enabled:=true;


end;

procedure TwnPoslechHard.SpbtnPlayClick(Sender: TObject);
begin
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

procedure TwnPoslechHard.Timer1Timer(Sender: TObject);
var I:integer;
begin

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
    SpbtnPlayClick(wnPoslechHard);
     with ImgCasovac.canvas do
  begin
  pen.Color:=rgb(134,134,134);
  Rectangle(-1,-1,ImgCasovac.Width+1,ImgCasovac.Height+1);
  end;
  end;
end;

procedure TwnPoslechHard.Databaze;
begin
 kontrola[1]:='least';
 kontrola[2]:='fears';
 kontrola[3]:='water';
 kontrola[4]:='clay';
 kontrola[5]:='trembling';
 kontrola[6]:='forgive';
 kontrola[7]:='follow';
 kontrola[8]:='washing';
 kontrola[9]:='river';
 kontrola[10]:='preacher';
 kontrola[11]:='soul';
 kontrola[12]:='force';
 kontrola[13]:='feet';
 kontrola[14]:='sleep';
 kontrola[15]:='wake';
 kontrola[16]:='take';
end;

end.
