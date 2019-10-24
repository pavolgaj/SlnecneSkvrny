unit Unit15; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, ExtDlgs, Spin,shellapi,LCLProc,LCLType,Buttons,LCLIntf;

type

  { TForm15 }

  TForm15 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    Image1: TImage;
    Image2: TImage;
    OpenDialog1: TOpenDialog;
    SpinEdit5: TSpinEdit;
    SpinEdit6: TSpinEdit;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure maluj(x,y:integer);
    procedure RadioButton1Change(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit4Change(Sender: TObject);
    procedure HraniceChange;
    procedure test1;
    procedure test2;
  private
    { private declarations }
  public
    { public declarations }
  end;

  TStred = record
    x: integer;
    y: integer;
  end;

skupina=record
     typ,cislo,pocet,penumbry,male: string;
     x,y,plocha:real;
     end;

fakula=record
     intenzita,cislo: string;
     x,y,plocha:real;
     end;


var
  Form15: TForm15;
  set_hranice: array [1..4] of boolean;
  hranice: array [1..4] of integer;
  polomer: integer;
  stred: TStred;
  normal,zeleny: TFont;
  skvrny: array[1..50] of skupina;
  polia: array[1..90] of fakula;
  malovane: array[0..620,0..620] of byte;
  pole,skvrna: boolean;
  kresli: boolean=false;

implementation

uses Unit7;

var nespravne: boolean=false;

{ TForm15 }

procedure TForm15.BitBtn1Click(Sender: TObject);
//nacitanie obrazka
var thumbnail : TBitmap;
    thumbRect : TRect;
    jpg: TJPEGImage;
begin
if not set_hranice[1] then begin
  if OpenDialog1.Execute then
  begin
 // prisposobenie velkosti obrazka
 thumbnail := GetFormImage;
 if ExtractFileExt(OpenDialog1.FileName)='.jpg' then
    begin
    jpg := TJpegImage.Create;
    jpg.LoadFromFile(OpenDialog1.FileName);
    thumbnail.Assign(jpg);
    end;
 if ExtractFileExt(OpenDialog1.FileName)='.bmp' then
    begin
    thumbnail.LoadFromFile(OpenDialog1.FileName);
    end;
  thumbRect.Left := 0;
  thumbRect.Top := 0;
  if thumbnail.Width > thumbnail.Height then
     begin
       thumbRect.Right := Image1.Width;
       thumbRect.Bottom := (Image1.Width * thumbnail.Height) div thumbnail.Width;
     end
  else
     begin
       thumbRect.Bottom := Image1.Height;
       thumbRect.Right := (Image1.Height * thumbnail.Width) div thumbnail.Height;
     end;
  thumbnail.Canvas.StretchDraw(thumbRect, thumbnail);
  thumbnail.Width := thumbRect.Right;
  thumbnail.Height := thumbRect.Bottom;
  Image1.Picture.Assign(thumbnail);
  Image2.Picture:=Image1.Picture;
  BitBtn2.Enabled:=true;
  BitBtn4.Enabled:=true;
  BitBtn1.Font:=normal;
  BitBtn2.Font:=zeleny;
  ShowMessage('Pokračujte stlačením tlačidla "Začat spracovanie".');
  end;
end
else
  if MessageDlg('Slnečné škvrny','Naozaj chcete načítať nový obrázok? Aktuálne spracovanie sa zruší.',mtInformation,mbYesNo,0)=mrYes then
  begin
   FormShow(Sender);
   BitBtn1Click(Sender);
  end;
end;

procedure TForm15.test1;
//kontrola udajov o skupine
var bunka,chybne: string;
    existuje: boolean=false;
procedure TestTyp;
begin
 existuje:=false;
 if bunka='Axx' then begin existuje:=true; exit; end;
 if bunka='Bxo' then begin existuje:=true; exit; end;
 if bunka='Bxi' then begin existuje:=true; exit; end;
 if bunka='Hrx' then begin existuje:=true; exit; end;
 if bunka='Cro' then begin existuje:=true; exit; end;
 if bunka='Cri' then begin existuje:=true; exit; end;
 if bunka='Hax' then begin existuje:=true; exit; end;
 if bunka='Cao' then begin existuje:=true; exit; end;
 if bunka='Cai' then begin existuje:=true; exit; end;
 if bunka='Hsx' then begin existuje:=true; exit; end;
 if bunka='Cso' then begin existuje:=true; exit; end;
 if bunka='Csi' then begin existuje:=true; exit; end;
 if bunka='Dro' then begin existuje:=true; exit; end;
 if bunka='Ero' then begin existuje:=true; exit; end;
 if bunka='Fro' then begin existuje:=true; exit; end;
 if bunka='Dri' then begin existuje:=true; exit; end;
 if bunka='Eri' then begin existuje:=true; exit; end;
 if bunka='Fri' then begin existuje:=true; exit; end;
 if bunka='Dao' then begin existuje:=true; exit; end;
 if bunka='Eao' then begin existuje:=true; exit; end;
 if bunka='Fao' then begin existuje:=true; exit; end;
 if bunka='Dai' then begin existuje:=true; exit; end;
 if bunka='Eai' then begin existuje:=true; exit; end;
 if bunka='Fai' then begin existuje:=true; exit; end;
 if bunka='Dso' then begin existuje:=true; exit; end;
 if bunka='Eso' then begin existuje:=true; exit; end;
 if bunka='Fso' then begin existuje:=true; exit; end;
 if bunka='Dsi' then begin existuje:=true; exit; end;
 if bunka='Esi' then begin existuje:=true; exit; end;
 if bunka='Fsi' then begin existuje:=true; exit; end;
 if bunka='Dac' then begin existuje:=true; exit; end;
 if bunka='Eac' then begin existuje:=true; exit; end;
 if bunka='Fac' then begin existuje:=true; exit; end;
 if bunka='Dsc' then begin existuje:=true; exit; end;
 if bunka='Esc' then begin existuje:=true; exit; end;
 if bunka='Fsc' then begin existuje:=true; exit; end;
 if bunka='Hkx' then begin existuje:=true; exit; end;
 if bunka='Cko' then begin existuje:=true; exit; end;
 if bunka='Cki' then begin existuje:=true; exit; end;
 if bunka='Hhx' then begin existuje:=true; exit; end;
 if bunka='Cho' then begin existuje:=true; exit; end;
 if bunka='Chi' then begin existuje:=true; exit; end;
 if bunka='Dko' then begin existuje:=true; exit; end;
 if bunka='Eko' then begin existuje:=true; exit; end;
 if bunka='Fko' then begin existuje:=true; exit; end;
 if bunka='Dki' then begin existuje:=true; exit; end;
 if bunka='Eki' then begin existuje:=true; exit; end;
 if bunka='Fki' then begin existuje:=true; exit; end;
 if bunka='Dho' then begin existuje:=true; exit; end;
 if bunka='Eho' then begin existuje:=true; exit; end;
 if bunka='Fho' then begin existuje:=true; exit; end;
 if bunka='Dhi' then begin existuje:=true; exit; end;
 if bunka='Ehi' then begin existuje:=true; exit; end;
 if bunka='Fhi' then begin existuje:=true; exit; end;
 if bunka='Dkc' then begin existuje:=true; exit; end;
 if bunka='Ekc' then begin existuje:=true; exit; end;
 if bunka='Fkc' then begin existuje:=true; exit; end;
 if bunka='Dhc' then begin existuje:=true; exit; end;
 if bunka='Ehc' then begin existuje:=true; exit; end;
 if bunka='Fhc' then begin existuje:=true; exit; end;
end;

begin
 nespravne:=false;
 chybne:='';
 bunka:=Edit1.Text;
 TestTyp;
 if not existuje then
        begin
        chybne+=bunka+'; ';
        nespravne:=true;
        end;
 Delete(bunka,2,2);
 if existuje then
     begin
     if (bunka='A') or (bunka='B') then
            begin
            if not (Edit3.Text='') then
               if not (Edit3.Text='0') then
                  begin
                  ShowMessage('Typ "'+bunka+'.." nemože mať penumbru!');
                  nespravne:=true;
                  end;
            end
        else
          if (Edit3.Text='') or (Edit3.Text='0') then
                  begin
                  ShowMessage('Typ "'+bunka+'.." musí mať penumbru!');
                  nespravne:=true;
                  end;
     end;
 if nespravne and (not (chybne='')) then ShowMessage('Daný typ škvŕn nie je povolený: '+chybne);
end;

procedure TForm15.BitBtn10Click(Sender: TObject);
//ulozenie skupiny
var i,j: integer;
begin
  if MessageDlg('Slnečné škvrny','Naozaj chcete uložiť skupinu sl. škvŕn? Po uložení ju už nebudete môcť upraviť!',mtInformation,mbYesNo,0)=mrYes then
      begin
      test1;
      if nespravne then exit;
      SpinEdit5.Value:=SpinEdit5.Value+1;
      with skvrny[SpinEdit5.Value] do
           begin
           typ:=Edit1.Text;
           pocet:=Edit2.Text;
           penumbry:=Edit3.Text;
           male:=Edit4.Text;
           cislo:=Edit5.Text;
           for i:=0 to 620 do
               for j:=0 to 620 do plocha+=malovane[i,j];
           end;
      Image1.Picture:=Image2.Picture;
      Image1.Canvas.Brush.Color:=clLime;
      Image1.Canvas.Pen.Color:=clLime;
      Image1.Canvas.EllipseC(round(skvrny[SpinEdit5.Value].x+stred.x),round(stred.y-skvrny[SpinEdit5.Value].y),2,2);
      Image2.Picture:=Image1.Picture;
      Edit1.Text:='';
      Edit2.Text:='';
      Edit3.Text:='';
      Edit4.Text:='';
      Edit5.Text:='';
      Edit1.Enabled:=false;
      Edit2.Enabled:=false;
      Edit3.Enabled:=false;
      Edit4.Enabled:=false;
      Edit5.Enabled:=false;
      BitBtn8.Enabled:=true;
      BitBtn8.Font:=zeleny;
      BitBtn9.Enabled:=true;
      BitBtn9.Font:=zeleny;
      BitBtn10.Enabled:=false;
      BitBtn10.Font:=normal;
      RadioGroup1.Enabled:=false;
      RadioGroup2.Enabled:=false;
      skvrna:=false;
      end;
end;

procedure TForm15.test2;
//kontrola udajov o poli
begin
  nespravne:=false;
  if not (Edit7.Text='') then
    begin
    if not (round(StrToFloat(Edit7.Text))=StrToFloat(Edit7.Text)) then
        begin
        ShowMessage('Intenzita fakulového poľa može byť: 0, 1, 2, 3, 4. Hodnota '+Edit7.Text+' nie je dovolená!');
        nespravne:=true;
        exit;
        end;
    if (StrToInt(Edit7.Text)<0) or (StrToInt(Edit7.Text)>4) then
        begin
        ShowMessage('Intenzita fakulového poľa može byť: 0, 1, 2, 3, 4. Hodnota '+Edit7.Text+' nie je dovolená!');
        nespravne:=true;
        end;
    end;
end;

procedure TForm15.BitBtn11Click(Sender: TObject);
//ulozit pole
var i,j: integer;
begin
  if MessageDlg('Slnečné škvrny','Naozaj chcete uložiť fakulové pole? Po uložení ho už nebudete môcť upraviť!',mtInformation,mbYesNo,0)=mrYes then
      begin
      test2;
      if nespravne then exit;
      SpinEdit6.Value:=SpinEdit6.Value+1;
      with polia[SpinEdit6.Value] do
           begin
           intenzita:=Edit7.Text;
           cislo:=Edit6.Text;
           for i:=0 to 620 do
               for j:=0 to 620 do plocha+=malovane[i,j];
           end;
      Image1.Picture:=Image2.Picture;
      Image1.Canvas.Brush.Color:=clLime;
      Image1.Canvas.Pen.Color:=clLime;
      Image1.Canvas.Arc(round(polia[SpinEdit6.Value].x+stred.x-4),round(stred.y-polia[SpinEdit6.Value].y-4),round(polia[SpinEdit6.Value].x+stred.x+4),round(stred.y-polia[SpinEdit6.Value].y+4),0,16*360);
      Image2.Picture:=Image1.Picture;
      Edit7.Text:='';
      Edit6.Text:='';
      Edit6.Enabled:=false;
      Edit7.Enabled:=false;
      BitBtn8.Enabled:=true;
      BitBtn8.Font:=zeleny;
      BitBtn9.Enabled:=true;
      BitBtn9.Font:=zeleny;
      BitBtn11.Enabled:=false;
      BitBtn11.Font:=normal;
      RadioGroup1.Enabled:=false;
      RadioGroup2.Enabled:=false;
      pole:=false;
      end;
end;

procedure TForm15.BitBtn3Click(Sender: TObject);
// ulozenie hranic
begin
  if MessageDlg('Slnečné škvrny','Naozaj chcete ukončiť nastavovanie hraníc? Po uložení už ich nebudete môcť zmeniť!',mtInformation,mbYesNo,0)=mrYes then
      begin
      SpinEdit1.Enabled:=false;
      SpinEdit2.Enabled:=false;
      SpinEdit3.Enabled:=false;
      SpinEdit4.Enabled:=false;
      BitBtn3.Enabled:=false;
      BitBtn3.Font:=normal;
      stred.x:=round((hranice[1]+hranice[2])/2);
      stred.y:=round((hranice[3]+hranice[4])/2);
      polomer:=round((stred.x-hranice[1]+stred.y-hranice[3])/2);
      Image1.Picture:=Image2.Picture;
      Image1.Canvas.Pen.Color:=clLime;
      Image1.Canvas.Arc(stred.x-polomer,stred.y-polomer,stred.x+polomer,stred.y+polomer,0,16*360);
      Image1.Canvas.Line(stred.x-10,stred.y,stred.x+10,stred.y);
      Image1.Canvas.Line(stred.x,stred.y-10,stred.x,stred.y+10);
      Image2.Picture:=Image1.Picture;
      ShowMessage('Pokračujte pridávaním jednotlívých skupín sl. škvŕn a fakulových polí.');
      BitBtn8.Enabled:=true;
      BitBtn8.Font:=zeleny;
      BitBtn9.Enabled:=true;
      BitBtn9.Font:=zeleny;
      BitBtn7.Enabled:=true;
      BitBtn7.Font:=zeleny;
      end;
end;

procedure TForm15.BitBtn2Click(Sender: TObject);
//zacat spracovanie
begin
  Image1.Enabled:=true;
  ShowMessage('Najprv na obrázku označte hranice slnečného kotúča. Postupujte v smere ľavý, pravý, horný a dolný okraj.');
  BitBtn2.Enabled:=false;
  BitBtn2.Font:=normal;
  Image1.Canvas.Pen.Color:=clGreen;
  Image1.Canvas.Pen.Width:=5;
  Image1.Canvas.Line(0,0,0,Image1.Height);
  Image1.Canvas.Line(0,0,Image1.Width,0);
  Image1.Canvas.Line(Image1.Width,0,Image1.Width,Image1.Height);
  Image1.Canvas.Line(0,Image1.Width,Image1.Width,Image1.Height);
  skvrna:=false;
  pole:=false;
end;

procedure TForm15.BitBtn4Click(Sender: TObject);
//zobrazit obrazok
var cesta: array[0..1000000] of WideChar;
begin
  if not (OpenDialog1.FileName='') then
     begin
     cesta:=UTF8toUTF16(OpenDialog1.FileName);
     ShellExecute(Handle, 'open', cesta,nil,nil,SW_SHOWNORMAL);
     end;
end;

procedure TForm15.BitBtn7Click(Sender: TObject);
//dokoncenie spracovania
var i:integer;
begin
  if MessageDlg('Slnečné škvrny','Naozaj chcete ukončiť spracovanie? Po uložení už nebudete môcť pridávať ďalšie skupiny a polia!',mtInformation,mbYesNo,0)=mrNo then exit;
  Form7.Caption:='Nový záznam';
  Form7.Edit7.Value:=polomer;
  form7.ComboBox2.Text:='obrázok';
  Form7.ComboBox3.ItemIndex:=0;
  Form7.ComboBox3Change(Sender);
  Form7.Edit8.Value:=SpinEdit5.Value;
  Form7.Edit8Change(Sender);
  for i:=1 to SpinEdit5.Value do
      with skvrny[i] do
        with Form7.StringGrid1 do
           begin
           Cells[1,i]:=typ;
           Cells[2,i]:=pocet;
           Cells[3,i]:=penumbry;
           Cells[4,i]:=FloatToStr(x);
           Cells[5,i]:=FloatToStr(y);
           Cells[6,i]:=FloatToStr(plocha);
           Cells[7,i]:=male;
           Cells[8,i]:=cislo;
           end;
  Form7.Edit9.Value:=SpinEdit6.Value;
  Form7.Edit9Change(Sender);
  for i:=1 to SpinEdit6.Value do
      with polia[i] do
        with Form7.StringGrid2 do
           begin
           Cells[1,i]:=intenzita;
           Cells[2,i]:=FloatToStr(x);
           Cells[3,i]:=FloatToStr(y);
           Cells[4,i]:=FloatToStr(plocha);
           Cells[5,i]:=cislo;
           end;
  with Form7 do
       begin
       ComboBox1.Text:='';
       Edit1.Text:='';
       Edit2.Text:='';
       Edit3.Value:=100;
       Edit4.Value:=1000;
       Edit5.Value:=20;
       Edit6.Text:='';
       ComboBox2.Enabled:=false;
       Edit7.Enabled:=false;
       ComboBox3.Enabled:=false;
       Edit8.Enabled:=false;
       Edit9.Enabled:=false;
       StringGrid1.Enabled:=false;
       StringGrid2.Enabled:=false;
       pevne:=true;
       end;
  ShowMessage('Teraz doplňte zvyšné informácie o pozorovateľovi, použitom prístroji a čase pozorovania.');
  Form7.ShowModal;
  close;
end;

procedure TForm15.BitBtn8Click(Sender: TObject);
//pridat skupinu
var i,j: integer;
begin
 ShowMessage('Ľavým tlačidlom označte polohu skupiny a pravým vymaľujte jednotlivé škvrny. Následne zadajte zvyšné informácie o skupine.');
 BitBtn8.Enabled:=false;
 BitBtn8.Font:=normal;
 BitBtn9.Enabled:=false;
 BitBtn9.Font:=normal;
 BitBtn10.Enabled:=true;
 BitBtn10.Font:=zeleny;
 RadioGroup1.Enabled:=true;
 RadioButton1.Checked:=true;
 RadioGroup2.Enabled:=true;
 Edit1.Enabled:=true;
 Edit2.Enabled:=true;
 Edit3.Enabled:=true;
 Edit4.Enabled:=true;
 Edit5.Enabled:=true;
 for i:=0 to 620 do
     for j:=0 to 620 do malovane[i,j]:=0;
 skvrna:=true;
end;

procedure TForm15.BitBtn9Click(Sender: TObject);
//pridat pole
var i,j: integer;
begin
 ShowMessage('Ľavým tlačidlom označte polohu poľa a pravým vymaľujte jeho časti. Následne zadajte zvyšné informácie o fakulovom poli.');
 BitBtn8.Enabled:=false;
 BitBtn8.Font:=normal;
 BitBtn9.Enabled:=false;
 BitBtn9.Font:=normal;
 BitBtn11.Enabled:=true;
 BitBtn11.Font:=zeleny;
 Edit6.Enabled:=true;
 Edit7.Enabled:=true;
 RadioGroup1.Enabled:=true;
 RadioButton1.Checked:=true;
 RadioGroup2.Enabled:=true;
 for i:=0 to 620 do
     for j:=0 to 620 do malovane[i,j]:=0;
 pole:=true;
end;

procedure TForm15.FormShow(Sender: TObject);
//zobrazenie okna
var i:integer;
begin
  normal:=BitBtn5.Font;
  zeleny:=BitBtn6.Font;
  BitBtn1.Font:=zeleny;
  BitBtn2.Font:=normal;
  BitBtn3.Font:=normal;
  BitBtn4.Font:=normal;
  BitBtn7.Font:=normal;
  BitBtn8.Font:=normal;
  BitBtn9.Font:=normal;
  BitBtn10.Font:=normal;
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.FillRect(ClientRect);
  for i:=1 to 4 do set_hranice[i]:=false;
  SpinEdit1.Enabled:=false;
  SpinEdit1.Value:=0;
  SpinEdit2.Enabled:=false;
  SpinEdit2.Value:=620;
  SpinEdit3.Enabled:=false;
  SpinEdit3.Value:=0;
  SpinEdit4.Enabled:=false;
  SpinEdit4.Value:=620;
  BitBtn2.Enabled:=false;
  BitBtn3.Enabled:=false;
  BitBtn4.Enabled:=false;
  BitBtn7.Enabled:=false;
  BitBtn8.Enabled:=false;
  BitBtn9.Enabled:=false;
  BitBtn10.Enabled:=false;
  Image1.Enabled:=false;
  SpinEdit5.Value:=0;
  Edit1.Enabled:=false;
  Edit2.Enabled:=false;
  Edit3.Enabled:=false;
  Edit4.Enabled:=false;
  Edit5.Enabled:=false;
  Edit6.Enabled:=false;
  Edit7.Enabled:=false;
end;


procedure TForm15.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i,j: integer;
    r1: boolean;
begin
  //nastavenie okrajov
  if set_hranice[1]=false then
     begin
     hranice[1]:=X;
     Image1.Picture:=Image2.Picture;
     Image1.Canvas.Pen.Color:=clRed;
     Image1.Canvas.Line(X,0,X,Image1.Height);
     set_hranice[1]:=true;
     SpinEdit1.Value:=X;
     SpinEdit1.Enabled:=true;
     exit;
     end;
  if set_hranice[2]=false then
     begin
     hranice[2]:=X;
     Image1.Canvas.Pen.Color:=clRed;
     Image1.Canvas.Line(X,0,X,Image1.Height);
     set_hranice[2]:=true;
     SpinEdit2.Value:=X;
     SpinEdit2.Enabled:=true;
     exit;
     end;
  if set_hranice[3]=false then
     begin
     hranice[3]:=Y;
     Image1.Canvas.Pen.Color:=clRed;
     Image1.Canvas.Line(0,Y,Image1.Width,Y);
     set_hranice[3]:=true;
     SpinEdit3.Value:=Y;
     SpinEdit3.Enabled:=true;
     exit;
     end;
  if set_hranice[4]=false then
     begin
     hranice[4]:=Y;
     Image1.Canvas.Pen.Color:=clRed;
     Image1.Canvas.Line(0,Y,Image1.Width,Y);
     set_hranice[4]:=true;
     SpinEdit4.Value:=Y;
     SpinEdit4.Enabled:=true;
     BitBtn3.Enabled:=true;
     BitBtn3.Font:=zeleny;
     exit;
     end;
  //poloha skvrny
  if skvrna and (Button=mbLeft) then
     begin
     skvrny[SpinEdit5.Value+1].x:=x-stred.x;
     skvrny[SpinEdit5.Value+1].y:=-(y-stred.y);
     Image1.Picture:=Image2.Picture;
     r1:=RadioButton1.Checked;
     RadioButton3.Checked:=true;
     for i:=0 to 620 do
         for j:=0 to 620 do
             begin
             RadioButton1.Checked:=boolean(malovane[i,j]);
             maluj(i,j);
             end;
     RadioButton1.Checked:=r1;
     RadioButton1Change(Sender);
     Image1.Canvas.Pen.Color:=clRed;
     Image1.Canvas.Line(x-4,y,x+4,y);
     Image1.Canvas.Line(x,y-4,x,y+4);
     exit;
     end;
  //poloha pola
  if pole and (Button=mbLeft) then
     begin
     polia[SpinEdit6.Value+1].x:=x-stred.x;
     polia[SpinEdit6.Value+1].y:=-(y-stred.y);
     Image1.Picture:=Image2.Picture;
     r1:=RadioButton1.Checked;
     RadioButton3.Checked:=true;
     for i:=0 to 620 do
         for j:=0 to 620 do
             begin
             RadioButton1.Checked:=boolean(malovane[i,j]);
             maluj(i,j);
             end;
     RadioButton1.Checked:=r1;
     RadioButton1Change(Sender);
     Image1.Canvas.Pen.Color:=clRed;
     Image1.Canvas.Line(x-4,y,x+4,y);
     Image1.Canvas.Line(x,y-4,x,y+4);
     exit;
     end;
  //plocha skupiny / pola
  if (skvrna or pole) and (Button=mbRight) then
     begin
     kresli:=true;
     maluj(x,y);
     if RadioButton4.Checked then
        begin
        maluj(x-1,y-1);
        maluj(x-1,y);
        maluj(x-1,y+1);
        maluj(x,y-1);
        maluj(x,y+1);
        maluj(x+1,y-1);
        maluj(x+1,y);
        maluj(x+1,y+1);
        end;
     exit;
     end;
end;

procedure TForm15.maluj(x,y: integer);
//kreslenie plochy
var farba: longint;
    r,g,b: byte;
begin
 malovane[x,y]:=byte(RadioButton1.Checked);
 farba:=ColorToRGB(Image2.Canvas.Pixels[x,y]);
 GetRGBValues(farba,r,g,b);
 if RadioButton1.Checked then
    begin
    r+=200;
    g+=150;
    b+=150;
    end;
 Image1.Canvas.Pixels[x,y]:=RGBToColor(r,g,b);
end;

procedure TForm15.RadioButton1Change(Sender: TObject);
begin
  RadioButton2.Checked:=not RadioButton1.Checked;
end;

procedure TForm15.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
//kreslenie plochy

begin
  if kresli then
     begin
     maluj(x,y);
     if RadioButton4.Checked then
        begin
        maluj(x-1,y-1);
        maluj(x-1,y);
        maluj(x-1,y+1);
        maluj(x,y-1);
        maluj(x,y+1);
        maluj(x+1,y-1);
        maluj(x+1,y);
        maluj(x+1,y+1);
        end;
     end;
end;

procedure TForm15.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //plocha skupiny / pola
  if (skvrna or pole) and (Button=mbRight) then
     begin
     kresli:=false;
     maluj(x,y);
     if RadioButton4.Checked then
        begin
        maluj(x-1,y-1);
        maluj(x-1,y);
        maluj(x-1,y+1);
        maluj(x,y-1);
        maluj(x,y+1);
        maluj(x+1,y-1);
        maluj(x+1,y);
        maluj(x+1,y+1);
        end;
     exit;
     end;
end;

procedure TForm15.HraniceChange;
// zmena hranic
begin
 hranice[1]:=SpinEdit1.Value;
 hranice[2]:=SpinEdit2.Value;
 hranice[3]:=SpinEdit3.Value;
 hranice[4]:=SpinEdit4.Value;
 Image1.Picture:=Image2.Picture;
 Image1.Canvas.Pen.Color:=clRed;
 Image1.Canvas.Line(hranice[1],0,hranice[1],Image1.Height);
 Image1.Canvas.Line(hranice[2],0,hranice[2],Image1.Height);
 Image1.Canvas.Line(0,hranice[3],Image1.Width,hranice[3]);
 Image1.Canvas.Line(0,hranice[4],Image1.Width,hranice[4]);
end;

procedure TForm15.SpinEdit1Change(Sender: TObject);
begin
 HraniceChange;
end;

procedure TForm15.SpinEdit2Change(Sender: TObject);
begin
 HraniceChange;
end;

procedure TForm15.SpinEdit3Change(Sender: TObject);
begin
 HraniceChange;
end;

procedure TForm15.SpinEdit4Change(Sender: TObject);
begin
 HraniceChange;
end;

initialization
  {$I unit15.lrs}

end.

