unit UnitSlovickaEasy;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, math, jpeg;

type
  TwnSlovicka = class(TForm)
    Edit1: TEdit;
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
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    BtnZahajitTest: TButton;
    Timer1: TTimer;
    Label13: TLabel;
    ImgCasovac: TImage;
    LblOdpocet: TLabel;
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
    LblVys11: TLabel;
    LblVys12: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    LblNadpis: TLabel;
    LblHodnoceni: TLabel;
    LblHodnoceni1: TLabel;
    LblHodnoceni2: TLabel;
    LblHodnoceni3: TLabel;
    LblHodnoceni4: TLabel;
    LblSpravne: TLabel;
    LblSpatne: TLabel;
    LblProcenta: TLabel;
    LblZnamka: TLabel;
    BtnKonec: TButton;
    BtnZnovu: TButton;
    Image4: TImage;
    Image5: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DatabazeEasy;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnZahajitTestClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Vysledky;
    procedure BtnZnovuClick(Sender: TObject);
    procedure BtnKonecClick(Sender: TObject);
    procedure DatabazeMedium;
    procedure DatabazeHard;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  wnSlovicka: TwnSlovicka;
  rozdeleni:array [0..12] of integer;
  SlovickaDatabazeEn: array [1..30] of string;
  SlovickaDatabazeCz: array [1..30] of string;
  Casovac,Spravne:integer;

implementation
 uses UnitHlavni;
{$R *.dfm}

procedure TwnSlovicka.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  wnHlavniEnglish.Show;
end;

procedure TwnSlovicka.FormCreate(Sender: TObject);
begin
 Image1.Canvas.Rectangle(-1,-1,Image1.Width+1,Image1.Height+1);
 Image2.Canvas.Rectangle(-1,-1,Image2.Width+1,Image2.Height+1);
 Image3.Canvas.Rectangle(-1,-1,Image3.Width+1,Image3.Height+1);
 wnSlovicka.Color:=rgb(251,243,111);
 Image5.Canvas.Rectangle(0,0,Image5.Width,Image5.Height);

end;

procedure TwnSlovicka.FormShow(Sender: TObject);
var I,I2:integer;
kontrola: boolean;
begin
 // odpocet
with ImgCasovac.Canvas do
 begin
  Brush.Color:=rgb(251,243,111);
  Rectangle(-1,-1,ImgCasovac.Width+1,ImgCasovac.Height+1);
  Brush.Color:=clred;
  pen.Color:=rgb(251,243,111);
  Ellipse(20,20,120,120);
  Pen.Color:=rgb(251,243,111);
  Brush.Color:=rgb(251,243,111);
  Ellipse(30,30,110,110);
  Brush.Style:=bsClear;
  Pen.Color:=clBlack;
  Pen.Width:=2;
  Ellipse(20,20,120,120);
  Pen.Width:=1;
  ellipse(30,30,110,110);
  Casovac:=0;


 end;

 BtnZahajitTest.Caption:='Zahájit test';

 Spravne:=0;
 Timer1.Enabled:=false;
 Image5.Visible:=false;

 BtnZahajitTest.Visible:=true;
 LblHodnoceni.Visible:=false;
 LblHodnoceni1.Visible:=false;
 LblHodnoceni2.Visible:=false;
 LblHodnoceni3.Visible:=false;
 LblHodnoceni4.Visible:=false;
 LblSpravne.Visible:=false;
 LblSpatne.Visible:=false;
 LblProcenta.Visible:=false;
 LblZnamka.Visible:=false;

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
 Edit1.Text:='';
 Edit2.Text:='';
 Edit3.Text:='';
 Edit4.Text:='';
 Edit5.Text:='';
 Edit6.Text:='';
 Edit7.Text:='';
 Edit8.Text:='';
 Edit9.Text:='';
 Edit10.Text:='';
 Edit11.Text:='';
 Edit12.Text:='';

 LblOdpocet.Caption:='120';
{ with ImgCasovac.Canvas do
 begin
  Pen.Color:=clblack;
  brush.Color:=clred;
  Rectangle(0,0,ImgCasovac.Width,ImgCasovac.Height);

 end;}
 Randomize;
 for I:=1 to 12 do
  begin
   repeat
   rozdeleni[I]:=random(30)+1;
   for I2:=0 to I-1 do
    begin
      if rozdeleni[I]=rozdeleni[I2] then
       begin
         kontrola:=true;
         break;
       end
        else kontrola:=false;
    end;
   until kontrola=false;
  end;

 Label1.Caption:='????? Eng';
 Label2.Caption:='????? Eng';
 Label3.Caption:='????? Eng';
 Label4.Caption:='????? Eng';
 Label5.Caption:='????? Eng';
 Label6.Caption:='????? Eng';
 Label7.Caption:='????? Cze';
 Label8.Caption:='????? Cze';
 Label9.Caption:='????? Cze';
 Label10.Caption:='????? Cze';
 Label11.Caption:='????? Cze';
 Label12.Caption:='????? Cze';

 BtnZnovu.Visible:=false;
 BtnKonec.visible:=false;
end;

procedure TwnSlovicka.Timer1Timer(Sender: TObject);
var BodKruynice:tpoint;
I:integer;
begin
//odpocet
 LblOdpocet.Caption:=inttostr(strtoint(LblOdpocet.Caption)-1);
 if strtoint(LblOdpocet.Caption)>99 then LblOdpocet.Left:=152
  else LblOdpocet.Left:=160;
 if strtoint(LblOdpocet.Caption)<10 then LblOdpocet.Left:=168;
 with ImgCasovac.Canvas do
  begin
   Pen.Color:=rgb(251,243,111);;
   for i:=1 to 24 do
    begin
     BodKruynice.X:=round(70+50*cos(degtorad(casovac+(I/8)-90)));
     BodKruynice.Y:=round(70+50*sin(degtorad(casovac+(I/8)-90)));
     moveto(70,70);
     lineto(BodKruynice.X,BodKruynice.Y);
    end;
    Pen.Color:=clblack;
    Brush.Color:=rgb(251,243,111);
    Ellipse(30,30,110,110);
    Casovac:=casovac+3;
    Brush.Style:=bsClear;
    Pen.Width:=2;
    Ellipse(20,20,120,120);
    Pen.Width:=1;
  end;

  If strtoint(LblOdpocet.Caption)=0 then BtnZahajitTestClick(wnSlovicka);
end;

procedure TwnSlovicka.BtnKonecClick(Sender: TObject);
begin
 wnHlavniEnglish.Show;
 wnSlovicka.Close;

end;

procedure TwnSlovicka.BtnZahajitTestClick(Sender: TObject);
begin


if BtnZahajitTest.Caption='Zahájit test' then
 begin
  Label1.Caption:=SlovickaDatabazeEn[rozdeleni[1]];
  Label2.Caption:=SlovickaDatabazeEn[rozdeleni[2]];
  Label3.Caption:=SlovickaDatabazeEn[rozdeleni[3]];
  Label4.Caption:=SlovickaDatabazeEn[rozdeleni[4]];
  Label5.Caption:=SlovickaDatabazeEn[rozdeleni[5]];
  Label6.Caption:=SlovickaDatabazeEn[rozdeleni[6]];
  Label7.Caption:=SlovickaDatabazeCZ[rozdeleni[7]];
  Label8.Caption:=SlovickaDatabazeCZ[rozdeleni[8]];
  Label9.Caption:=SlovickaDatabazeCZ[rozdeleni[9]];
  Label10.Caption:=SlovickaDatabazeCZ[rozdeleni[10]];
  Label11.Caption:=SlovickaDatabazeCZ[rozdeleni[11]];
  Label12.Caption:=SlovickaDatabazeCZ[rozdeleni[12]];

  Timer1.Enabled:=true;
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
  BtnZahajitTest.Caption:='Ukonèit test';
 end
 else
if BtnZahajitTest.Caption='Ukonèit test' then
 begin
   Vysledky;
   
   Timer1.Enabled:=false;
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
   Image5.Visible:=true;

   LblSpravne.caption:=inttostr(Spravne);
   LblSpatne.Caption:=inttostr(12-spravne);
   LblProcenta.caption:=inttostr(round(spravne/12)*100);
   BtnZahajitTest.Visible:=false;
   if spravne>10 then LblZnamka.caption:='1';
   if (spravne=10)or(spravne=9) then LblZnamka.caption:='2';
   if (spravne=8)or(spravne=7) then LblZnamka.caption:='3';
   if (spravne=6)or(spravne=5) then LblZnamka.caption:='4';
   if (spravne<5) then LblZnamka.caption:='5';

   LblHodnoceni.Visible:=true;
   LblHodnoceni1.Visible:=true;
   LblHodnoceni2.Visible:=true;
   LblHodnoceni3.Visible:=true;
   LblHodnoceni4.Visible:=true;
   LblSpravne.Visible:=true;
   LblSpatne.Visible:=true;
   LblProcenta.Visible:=true;
   LblZnamka.Visible:=true;
   BtnZnovu.Visible:=true;
   BtnKonec.visible:=true;

 end;
end;

procedure TwnSlovicka.BtnZnovuClick(Sender: TObject);
begin
 FormShow(wnSlovicka);
end;

procedure TwnSlovicka.DatabazeEasy;
begin

SlovickaDatabazeEn[1]:= 'Pen';
SlovickaDatabazeCz[1]:='Pero';
SlovickaDatabazeEn[2]:='Rubber';
SlovickaDatabazeCz[2]:='Guma';
SlovickaDatabazeEn[3]:= 'Car';
SlovickaDatabazeCz[3]:='Auto';
SlovickaDatabazeEn[4]:= 'Computer';
SlovickaDatabazeCz[4]:='Poèítaè';
SlovickaDatabazeEn[5]:= 'Chair';
SlovickaDatabazeCz[5]:='Židle';
SlovickaDatabazeEn[6]:= 'Church';
SlovickaDatabazeCz[6]:='Kostel';
SlovickaDatabazeEn[7]:= 'Bed';
SlovickaDatabazeCz[7]:='Postel';
SlovickaDatabazeEn[8]:= 'Lorry';
SlovickaDatabazeCz[8]:='Náklaïák';
SlovickaDatabazeEn[9]:= 'Hair';
SlovickaDatabazeCz[9]:='Vlasy';
SlovickaDatabazeEn[10]:= 'Floor';
SlovickaDatabazeCz[10]:='Podlaha';
SlovickaDatabazeEn[11]:= 'Eyes';
SlovickaDatabazeCz[11]:='Oèi';
SlovickaDatabazeEn[12]:= 'Ring';
SlovickaDatabazeCz[12]:='Prsten';
SlovickaDatabazeEn[13]:= 'Paper';
SlovickaDatabazeCz[13]:='Papír';
SlovickaDatabazeEn[14]:= 'Book';
SlovickaDatabazeCz[14]:='Kniha';
SlovickaDatabazeEn[15]:= 'Fire';
SlovickaDatabazeCz[15]:='Oheò';
SlovickaDatabazeEn[16]:= 'Ball';
SlovickaDatabazeCz[16]:='Míè';
SlovickaDatabazeEn[17]:= 'Page';
SlovickaDatabazeCz[17]:='Stránka';
SlovickaDatabazeEn[18]:= 'Father';
SlovickaDatabazeCz[18]:='Otec';
SlovickaDatabazeEn[19]:= 'Mother';
SlovickaDatabazeCz[19]:='Matka';
SlovickaDatabazeEn[20]:= 'Apple';
SlovickaDatabazeCz[20]:='Jablko';
SlovickaDatabazeEn[21]:= 'Family';
SlovickaDatabazeCz[21]:='Rodina';
SlovickaDatabazeEn[22]:= 'Name';
SlovickaDatabazeCz[22]:='Jméno';
SlovickaDatabazeEn[23]:='Cup';
SlovickaDatabazeCz[23]:='Šálek';
SlovickaDatabazeEn[24]:= 'Salad';
SlovickaDatabazeCz[24]:='Salát';
SlovickaDatabazeEn[25]:= 'Boy';
SlovickaDatabazeCz[25]:='Chlapec';
SlovickaDatabazeEn[26]:= 'Joke';
SlovickaDatabazeCz[26]:='Vtip';
SlovickaDatabazeEn[27]:= 'Plate';
SlovickaDatabazeCz[27]:='Talíø';
SlovickaDatabazeEn[28]:= 'Sun';
SlovickaDatabazeCz[28]:='Slunce';
SlovickaDatabazeEn[29]:= 'Team';
SlovickaDatabazeCz[29]:='Tým';
SlovickaDatabazeEn[30]:= 'News';
SlovickaDatabazeCz[30]:='Noviny';
end;
procedure TwnSlovicka.DatabazeMedium;
begin

SlovickaDatabazeEn[1]:= 'Careful';
SlovickaDatabazeCz[1]:='Opatrný';
SlovickaDatabazeEn[2]:='Gun';
SlovickaDatabazeCz[2]:='Pistole';
SlovickaDatabazeEn[3]:= 'Habit';
SlovickaDatabazeCz[3]:='Zvyk';
SlovickaDatabazeEn[4]:= 'Competition';
SlovickaDatabazeCz[4]:='Soutìž';
SlovickaDatabazeEn[5]:= 'Knee';
SlovickaDatabazeCz[5]:='Koleno';
SlovickaDatabazeEn[6]:= 'Quarrel';
SlovickaDatabazeCz[6]:='Hádka';
SlovickaDatabazeEn[7]:= 'Seat';
SlovickaDatabazeCz[7]:='Sedadlo';
SlovickaDatabazeEn[8]:= 'Support';
SlovickaDatabazeCz[8]:='Podporovat';
SlovickaDatabazeEn[9]:= 'Execute';
SlovickaDatabazeCz[9]:='Popravit';
SlovickaDatabazeEn[10]:= 'Airport';
SlovickaDatabazeCz[10]:='Letištì';
SlovickaDatabazeEn[11]:= 'Reason';
SlovickaDatabazeCz[11]:='Dùvod';
SlovickaDatabazeEn[12]:= 'Flag';
SlovickaDatabazeCz[12]:='Vlajka';
SlovickaDatabazeEn[13]:= 'Flight';
SlovickaDatabazeCz[13]:='Let';
SlovickaDatabazeEn[14]:= 'Motorbike';
SlovickaDatabazeCz[14]:='Motorka';
SlovickaDatabazeEn[15]:= 'Cut';
SlovickaDatabazeCz[15]:='Krájet';
SlovickaDatabazeEn[16]:= 'Comb';
SlovickaDatabazeCz[16]:='Høeben';
SlovickaDatabazeEn[17]:= 'Annoying';
SlovickaDatabazeCz[17]:='Otravný';
SlovickaDatabazeEn[18]:= 'Breath';
SlovickaDatabazeCz[18]:='Dech';
SlovickaDatabazeEn[19]:= 'Freedom';
SlovickaDatabazeCz[19]:='Svoboda';
SlovickaDatabazeEn[20]:= 'Deep';
SlovickaDatabazeCz[20]:='Hluboký';
SlovickaDatabazeEn[21]:= 'Pain';
SlovickaDatabazeCz[21]:='Bolest';
SlovickaDatabazeEn[22]:= 'Soldier';
SlovickaDatabazeCz[22]:='Voják';
SlovickaDatabazeEn[23]:='Food';
SlovickaDatabazeCz[23]:='Jídlo';
SlovickaDatabazeEn[24]:= 'Wood';
SlovickaDatabazeCz[24]:='Døevo';
SlovickaDatabazeEn[25]:= 'Artillery';
SlovickaDatabazeCz[25]:='Dìlostøelectvo';
SlovickaDatabazeEn[26]:= 'Infantry';
SlovickaDatabazeCz[26]:='Pìchota';
SlovickaDatabazeEn[27]:= 'Cavalry';
SlovickaDatabazeCz[27]:='Jízda';
SlovickaDatabazeEn[28]:= 'Gold';
SlovickaDatabazeCz[28]:='Zlato';
SlovickaDatabazeEn[29]:= 'Fort';
SlovickaDatabazeCz[29]:='Pevnost';
SlovickaDatabazeEn[30]:= 'Stable';
SlovickaDatabazeCz[30]:='Stáje';
end;

procedure TwnSlovicka.DatabazeHard;
begin

SlovickaDatabazeEn[1]:= 'Promotion';
SlovickaDatabazeCz[1]:='Povýšení';
SlovickaDatabazeEn[2]:='Heroine';
SlovickaDatabazeCz[2]:='Hrdinka';
SlovickaDatabazeEn[3]:= 'Incapable';
SlovickaDatabazeCz[3]:='Neschopný';
SlovickaDatabazeEn[4]:= 'Chain';
SlovickaDatabazeCz[4]:='Øetìz';
SlovickaDatabazeEn[5]:= 'Slash';
SlovickaDatabazeCz[5]:='Rozøezat';
SlovickaDatabazeEn[6]:= 'Spill';
SlovickaDatabazeCz[6]:='Rozlít';
SlovickaDatabazeEn[7]:= 'Threat';
SlovickaDatabazeCz[7]:='Hrozba';
SlovickaDatabazeEn[8]:= 'Threshold';
SlovickaDatabazeCz[8]:='Práh';
SlovickaDatabazeEn[9]:= 'Undoubtedly';
SlovickaDatabazeCz[9]:='Nepochybnì';
SlovickaDatabazeEn[10]:= 'Sole';
SlovickaDatabazeCz[10]:='Podrážka';
SlovickaDatabazeEn[11]:= 'Jelly';
SlovickaDatabazeCz[11]:='Želé';
SlovickaDatabazeEn[12]:= 'Hip';
SlovickaDatabazeCz[12]:='Bok';
SlovickaDatabazeEn[13]:= 'Recommend';
SlovickaDatabazeCz[13]:='Doporuèit';
SlovickaDatabazeEn[14]:= 'Anniversary';
SlovickaDatabazeCz[14]:='Výroèí';
SlovickaDatabazeEn[15]:= 'Crow';
SlovickaDatabazeCz[15]:='Vrána';
SlovickaDatabazeEn[16]:= 'Dot';
SlovickaDatabazeCz[16]:='Teèka';
SlovickaDatabazeEn[17]:= 'Feather';
SlovickaDatabazeCz[17]:='Peøí';
SlovickaDatabazeEn[18]:= 'Contradict';
SlovickaDatabazeCz[18]:='Odporovat';
SlovickaDatabazeEn[19]:= 'Equality';
SlovickaDatabazeCz[19]:='Rovnost';
SlovickaDatabazeEn[20]:= 'Presenter';
SlovickaDatabazeCz[20]:='Konferenciér';
SlovickaDatabazeEn[21]:= 'Oversleep';
SlovickaDatabazeCz[21]:='Zaspat';
SlovickaDatabazeEn[22]:= 'Unverifiable';
SlovickaDatabazeCz[22]:='Neovìøitelný';
SlovickaDatabazeEn[23]:='Curious';
SlovickaDatabazeCz[23]:='Zvìdavý';
SlovickaDatabazeEn[24]:= 'Punishment';
SlovickaDatabazeCz[24]:='Trest';
SlovickaDatabazeEn[25]:= 'Faceless';
SlovickaDatabazeCz[25]:='Anonymní';
SlovickaDatabazeEn[26]:= 'Fraud';
SlovickaDatabazeCz[26]:='Podvod';
SlovickaDatabazeEn[27]:= 'Pray';
SlovickaDatabazeCz[27]:='Modlit se';
SlovickaDatabazeEn[28]:= 'Rule';
SlovickaDatabazeCz[28]:='Vládnout';
SlovickaDatabazeEn[29]:= 'Sweaty';
SlovickaDatabazeCz[29]:='Zpocený';
SlovickaDatabazeEn[30]:= 'Unsinkable';
SlovickaDatabazeCz[30]:='Nepotopitelný';
end;

procedure TwnSlovicka.Vysledky;
begin
 if AnsiUpperCase(Edit1.Text)=AnsiUpperCase(SlovickaDatabazeCz[rozdeleni[1]]) then Spravne:=spravne+1
  else LblVys1.Caption:=SlovickaDatabazeCZ[rozdeleni[1]];
 if AnsiUpperCase(Edit2.Text)=AnsiUpperCase(SlovickaDatabazeCz[rozdeleni[2]]) then Spravne:=spravne+1
  else LblVys2.Caption:=SlovickaDatabazeCz[rozdeleni[2]];
 if AnsiUpperCase(Edit3.Text)=AnsiUpperCase(SlovickaDatabazeCz[rozdeleni[3]]) then Spravne:=spravne+1
  else LblVys3.Caption:=SlovickaDatabazeCz[rozdeleni[3]];
 if AnsiUpperCase(Edit4.Text)=AnsiUpperCase(SlovickaDatabazeCz[rozdeleni[4]]) then Spravne:=spravne+1
  else LblVys4.Caption:=SlovickaDatabazeCz[rozdeleni[4]];
 if AnsiUpperCase(Edit5.Text)=AnsiUpperCase(SlovickaDatabazeCz[rozdeleni[5]]) then Spravne:=spravne+1
  else LblVys5.Caption:=SlovickaDatabazeCz[rozdeleni[5]];
 if AnsiUpperCase(Edit6.Text)=AnsiUpperCase(SlovickaDatabazeCz[rozdeleni[6]]) then Spravne:=spravne+1
  else LblVys6.Caption:=SlovickaDatabazeCz[rozdeleni[6]];
 if AnsiUpperCase(Edit7.Text)=AnsiUpperCase(SlovickaDatabazeEn[rozdeleni[7]]) then Spravne:=spravne+1
  else LblVys7.Caption:=SlovickaDatabazeEn[rozdeleni[7]];
 if AnsiUpperCase(Edit8.Text)=AnsiUpperCase(SlovickaDatabazeEn[rozdeleni[8]]) then Spravne:=spravne+1
  else LblVys8.Caption:=SlovickaDatabazeEn[rozdeleni[8]];
 if AnsiUpperCase(Edit9.Text)=AnsiUpperCase(SlovickaDatabazeEn[rozdeleni[9]]) then Spravne:=spravne+1
  else LblVys9.Caption:=SlovickaDatabazeEn[rozdeleni[9]];
 if AnsiUpperCase(Edit10.Text)=AnsiUpperCase(SlovickaDatabazeEn[rozdeleni[10]]) then Spravne:=spravne+1
  else LblVys10.Caption:=SlovickaDatabazeEn[rozdeleni[10]];
 if AnsiUpperCase(Edit11.Text)=AnsiUpperCase(SlovickaDatabazeEn[rozdeleni[11]]) then Spravne:=spravne+1
  else LblVys11.Caption:=SlovickaDatabazeEn[rozdeleni[11]];
 if AnsiUpperCase(Edit12.Text)=AnsiUpperCase(SlovickaDatabazeEn[rozdeleni[12]]) then Spravne:=spravne+1
  else LblVys12.Caption:=SlovickaDatabazeEn[rozdeleni[12]];
 end;

end.
