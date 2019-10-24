unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, EditBtn, MaskEdit, Spin, Grids, Menus,Unit5,vypocty;

type

  { TForm7 }

  TForm7 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    DateEdit1: TDateEdit;
    Edit1: TEdit;
    Edit4: TSpinEdit;
    Edit9: TSpinEdit;
    Edit3: TSpinEdit;
    Edit2: TEdit;
    Edit5: TSpinEdit;
    Edit6: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    MaskEdit1: TMaskEdit;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    Edit7: TSpinEdit;
    Edit8: TSpinEdit;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure oprava(n: integer);
    procedure test;
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form7: TForm7;
  ok,nespravne: boolean;
  pevne: boolean=false;
implementation

uses Unit1;

{ TForm7 }

procedure TForm7.FormShow(Sender: TObject);
var i: integer;
    cas: string;
begin
DateSeparator:='.';
if not ok then
 begin
 ComboBox1.Clear;
 for i:=1 to Form5.StringGrid1.RowCount-1 do
     ComboBox1.Items.Add(Form5.StringGrid1.Cells[0,i]);
 DateEdit1.Date:=Date;
 cas:=TimeToStr(Time);
 if Length(cas)=7 then cas:='0'+cas;
 MaskEdit1.Text:=cas;
 SpinEdit1.Value:=1;
 SpinEdit2.Value:=15;
 SpinEdit3.Value:=0;
 SpinEdit4.Value:=1;
 DateEdit1Change(Sender);
 if pevne then exit;         //spracovanie obrazka
 ComboBox1.ItemIndex:=0;
 ComboBox1Change(Sender);
 ComboBox3.ItemIndex:=Form5.ComboBox1.ItemIndex;
 ComboBox3Change(Sender);
 Edit8.Text:='0';
 Edit9.Text:='0';
 StringGrid1.RowCount:=1;
 StringGrid2.RowCount:=1;
 end
 else ok:=false;
end;

procedure TForm7.MenuItem1Click(Sender: TObject);
begin
 Button1Click(Sender);
end;

procedure TForm7.MenuItem2Click(Sender: TObject);
begin
 Button2Click(Sender);
end;


procedure TForm7.ComboBox1Change(Sender: TObject);
var metoda: string;
    i:integer;
begin
if ComboBox1.ItemIndex>=0 then
 begin
 Button3.Enabled:=false;
 Edit1.Text:=Form5.StringGrid1.Cells[1,ComboBox1.ItemIndex+1];
 Edit2.Text:=Form5.StringGrid1.Cells[2,ComboBox1.ItemIndex+1];
 Edit3.Text:=Form5.StringGrid1.Cells[3,ComboBox1.ItemIndex+1];
 Edit4.Text:=Form5.StringGrid1.Cells[4,ComboBox1.ItemIndex+1];
 Edit5.Text:=Form5.StringGrid1.Cells[5,ComboBox1.ItemIndex+1];
 Edit6.Text:=Form5.StringGrid1.Cells[6,ComboBox1.ItemIndex+1];
 if pevne then exit;  //spracovanie obrazka
 Edit7.Text:=Form5.StringGrid1.Cells[8,ComboBox1.ItemIndex+1];
 metoda:=Form5.StringGrid1.Cells[7,ComboBox1.ItemIndex+1];
 i:=ComboBox2.Items.IndexOf(metoda);
 if i<0 then
        begin
        ComboBox2.Items.Append(metoda);
        ComboBox2.ItemIndex:=ComboBox2.Items.Count-1;
        end
    else ComboBox2.ItemIndex:=i;
  end
 else
   begin
   Button3.Enabled:=true;
   Edit1.Text:='';
   Edit2.Text:='';
   Edit3.Text:='100';
   Edit4.Text:='1000';
   Edit5.Text:='20';
   Edit6.Text:='';
   if pevne then exit;  //spracovanie obrazka
   Edit7.Text:='10';
   ComboBox2.ItemIndex:=0;
   end;
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
 SpinEdit1.Value:=1;
 SpinEdit2.Value:=15;
 SpinEdit3.Value:=0;
 SpinEdit4.Value:=1;
 Edit8.Text:='0';
 StringGrid1.RowCount:=1;
 StringGrid1.RowCount:=2;
 StringGrid1.Cells[0,1]:='1';
 Edit9.Text:='0';
 StringGrid2.RowCount:=1;
 StringGrid2.RowCount:=2;
 StringGrid2.Cells[0,1]:='1';
 ok:=false;
 close;
end;

procedure TForm7.Button3Click(Sender: TObject);
var i: integer;
begin
if MessageDlg(AnsiToUtf8('Slnečné škvrny'),AnsiToUtf8('Chcete pridať pozorovateľa ')+ComboBox1.Text+AnsiToUtf8(' zo zadanými údajmi do zoznamu pozorovateľov?'),mtConfirmation,mbYesNo,0)=mrYes then
 begin
 Form5.Button3Click(Sender);
 i:=Form5.StringGrid1.RowCount-1;
 Form5.StringGrid1.Cells[0,i]:=ComboBox1.Text;
 Form5.StringGrid1.Cells[1,i]:=Edit1.Text;
 Form5.StringGrid1.Cells[2,i]:=Edit2.Text;
 Form5.StringGrid1.Cells[3,i]:=Edit3.Text;
 Form5.StringGrid1.Cells[4,i]:=Edit4.Text;
 Form5.StringGrid1.Cells[5,i]:=Edit5.Text;
 Form5.StringGrid1.Cells[6,i]:=Edit6.Text;
 Form5.StringGrid1.Cells[8,i]:=Edit7.Text;
 Form5.StringGrid1.Cells[7,i]:=ComboBox2.Text;
 Form5.Button1Click(Sender);
 end;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
  test;
  if Edit8.Text='' then Edit8.Text:='0';
  if Edit9.Text='' then Edit9.Text:='0';
  if not nespravne then
     begin
     ok:=true;
     close;
     end;
end;

procedure TForm7.ComboBox3Change(Sender: TObject);
begin
 if ComboBox3.ItemIndex=0 then
    begin
    StringGrid1.Cells[4,0]:='x';
    StringGrid1.Cells[5,0]:='y';
    StringGrid2.Cells[2,0]:='x';
    StringGrid2.Cells[3,0]:='y';
    StringGrid1.Hint:=AnsiToUtf8('Informácie o jednotlivých skupinách:'+#13+'typ - podľa McIntoshovej kvalifikácie'+#13+'počet - počet škvŕn v skupine'
          +#13+'penum. - počet penumbier v skupine'+#13+'x - x-ová súradnica stredu skupiny'+#13+'y - y-ová súradnica stredu skupiny'
          +#13+'plocha - plocha škvŕn v mm2 '+#13+'mal. šk. - počet škvŕn v skupine menších ako 1 mm2'+#13+'č. skup. - číslo skupiny');
    StringGrid2.Hint:=AnsiToUtf8('Informácie o jednotlivých fakulových poliach:'+#13+'intezita - od 0 do 4 (4 -> najjasnejšie)'+#13+'x - x-ová súradnica stredu fakuly'
         +#13+'y - y-ová súradnica stredu fakuly'+#13+'plocha - plocha fakulového poľa v mm2'+#13+'č. fak. - číslo fakulového poľa');
    end;
 if ComboBox3.ItemIndex=1 then
    begin
    StringGrid1.Cells[4,0]:='uhol';
    StringGrid1.Cells[5,0]:='vzd.';
    StringGrid2.Cells[2,0]:='uhol';
    StringGrid2.Cells[3,0]:='vzd.';
    StringGrid1.Hint:=AnsiToUtf8('Informácie o jednotlivých skupinách:'+#13+'typ - podľa McIntoshovej kvalifikácie'+#13+'počet - počet škvŕn v skupine'
          +#13+'penum. - počet penumbier v skupine'+#13+'uhol - pozičný uhol stredu skupiny'+#13+'vzd. - vzdialenosť stredu skupiny od stredu sl. disku'
          +#13+'plocha - plocha škvŕn v mm2 '+#13+'mal. šk. - počet škvŕn v skupine menších ako 1 mm2'+#13+'č. skup. - číslo skupiny');
    StringGrid2.Hint:=AnsiToUtf8('Informácie o jednotlivých fakulových poliach:'+#13+'intezita - od 0 do 4 (4 -> najjasnejšie)'+#13+'uhol - pozičný uhol stredu fakuly'
         +#13+'vzd. - vzdialenosť stredu fakuly od stredu sl. disku'+#13+'plocha - plocha fakulového poľa v mm2'+#13+'č. fak. - číslo fakulového poľa');
    end;
end;

procedure TForm7.DateEdit1Change(Sender: TObject);
var datum: string;
    den,mesiac,bodka,x: integer;
begin
 DateTimeToString(datum,'d.M.yyyy',DateEdit1.Date);
 bodka:=AnsiPos('.',datum);
 den:=StrToInt(Copy(datum,1,bodka-1));
 Delete(datum,1,bodka);
 bodka:=AnsiPos('.',datum);
 Delete(datum,bodka,6);
 mesiac:=StrToInt(datum);
 if (((mesiac=3) or (mesiac=10)) and (den>24)) then
	begin
        DateTimeToString(datum,'d.M.yyyy',DateEdit1.Date);
	x:=6-(trunc(rozdel(datum,'120000',0)) mod 7);
	if x=0 then x:=7;
	if den+x>31 then mesiac:=mesiac+1;
	end;
 if (mesiac<4) or (mesiac>10) then RadioButton1.Checked:=true
    else RadioButton2.Checked:=true;
end;

procedure TForm7.Edit8Change(Sender: TObject);
var i:byte;
begin
if not (Edit8.Text='') then
  begin
  StringGrid1.RowCount:=StrToInt(Edit8.Text)+1;
  if StringGrid1.RowCount>3 then StringGrid1.Width:=396
     else StringGrid1.Width:=380;
  for i:=1 to StringGrid1.RowCount-1 do StringGrid1.Cells[0,i]:=IntToStr(i);
  end;
end;

procedure TForm7.Edit9Change(Sender: TObject);
var i:byte;
begin
if not (Edit9.Text='') then
  begin
  StringGrid2.RowCount:=StrToInt(Edit9.Text)+1;
  if StringGrid2.RowCount>3 then StringGrid2.Width:=264
     else StringGrid2.Width:=248;
  for i:=1 to StringGrid2.RowCount-1 do StringGrid2.Cells[0,i]:=IntToStr(i);
  end;
end;

procedure TForm7.oprava(n: integer);
var g,F,i,j: integer;
    t: string;
    znak: string;
    x,y:real;
    Sender: TObject;
begin
 t:=Form1.StringGrid1.Cells[1,n];
 if AnsiPos('.',t)=2 then t:='0'+t;
 if Length(t)=9 then Insert('0',t,4);
 DateSeparator:='.';
 DateEdit1.Text:=t;
 t:=Form1.StringGrid1.Cells[2,n];
 znak:=TimeSeparator;
 Insert(znak,t,3);
 Insert(znak,t,6);
 MaskEdit1.Text:=t;
 SpinEdit4.Value:=StrToInt(Form1.StringGrid1.Cells[3,n]);
 if Form1.StringGrid1.Cells[4,n]='1' then RadioButton2.Checked:=true;
 SpinEdit1.Value:=StrToInt(Form1.StringGrid1.Cells[5,n]);
 SpinEdit2.Value:=StrToInt(Form1.StringGrid1.Cells[6,n]);
 SpinEdit3.Value:=StrToInt(Form1.StringGrid1.Cells[7,n]);
 ComboBox1.Clear;
 for i:=1 to Form5.StringGrid1.RowCount-1 do
     ComboBox1.Items.Add(Form5.StringGrid1.Cells[0,i]);
 ComboBox1.Text:=Form1.StringGrid1.Cells[8,n];
 Edit1.Text:=Form1.StringGrid1.Cells[9,n];
 Edit2.Text:=Form1.StringGrid1.Cells[10,n];
 Edit3.Value:=StrToInt(Form1.StringGrid1.Cells[11,n]);
 Edit4.Value:=StrToInt(Form1.StringGrid1.Cells[12,n]);
 Edit5.Value:=StrToInt(Form1.StringGrid1.Cells[13,n]);
 Edit6.Text:=Form1.StringGrid1.Cells[14,n];
 ComboBox2.Text:=Form1.StringGrid1.Cells[15,n];
 Edit7.Value:=StrToInt(Form1.StringGrid1.Cells[16,n]);
 ComboBox3.ItemIndex:=StrToInt(Form1.StringGrid1.Cells[17,n]);
 Edit8.Value:=StrToInt(Form1.StringGrid1.Cells[22,n]);
 g:=StrToInt(Edit8.Text);
 Edit8Change(Sender);
 for i:=0 to g-1 do
     for j:=1 to 8 do StringGrid1.Cells[j,i+1]:=Form1.StringGrid1.Cells[22+i*8+j,n];
 if ComboBox3.ItemIndex=1 then
    for i:=1 to g do
        begin
        x:=StrToFloat(StringGrid1.Cells[4,i]);
        y:=StrToFloat(StringGrid1.Cells[5,i]);
        StringGrid1.Cells[4,i]:=FloatToStr(arctan(y/x)*180/pi);
        StringGrid1.Cells[5,i]:=FloatToStr(sqrt(sqr(x)+sqr(y)));
        end;
 g:=8*g+1;
 Edit9.Value:=StrToInt(Form1.StringGrid1.Cells[22+g,n]);
 Edit9Change(Sender);
 F:=StrToInt(Edit9.Text);
 for i:=0 to F-1 do
     for j:=1 to 5 do StringGrid2.Cells[j,i+1]:=Form1.StringGrid1.Cells[22+g+i*5+j,n];
 if ComboBox3.ItemIndex=1 then
    for i:=1 to F do
        begin
        x:=StrToFloat(StringGrid2.Cells[2,i]);
        y:=StrToFloat(StringGrid2.Cells[3,i]);
        StringGrid2.Cells[2,i]:=FloatToStr(arctan(y/x)*180/pi);
        StringGrid2.Cells[3,i]:=FloatToStr(sqrt(sqr(x)+sqr(y)));
        end;
end;

procedure TForm7.test;
var i,j,p: integer;
    bunka,chybne,t: string;
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
 for i:=1 to StringGrid1.RowCount-1 do
     begin
     bunka:=StringGrid1.Cells[1,i];
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
            if not (StringGrid1.Cells[3,i]='') then
               if not (StringGrid1.Cells[3,i]='0') then
                  begin
                  ShowMessage(AnsiToUtf8('Typ "'+bunka+'.." nemože mať penumbru!'));
                  nespravne:=true;
                  end;
            end
        else
          if (StringGrid1.Cells[3,i]='') xor (StringGrid1.Cells[3,i]='0') then
                  begin
                  ShowMessage(AnsiToUtf8('Typ "'+bunka+'.." musí mať penumbru!'));
                  nespravne:=true;
                  end;
     end;
     for j:=1 to StringGrid1.ColCount-1 do
         if StringGrid1.Cells[j,i]='' then StringGrid1.Cells[j,i]:='0'
            else if AnsiPos(',',StringGrid1.Cells[j,i])>0 then
                 begin
                 t:=StringGrid1.Cells[j,i];
                 p:=AnsiPos(',',t);
                 Delete(t,p,1);
                 Insert('.',t,p);
                 StringGrid1.Cells[j,i]:=t;
                 end;
      end;
 if nespravne and (not (chybne='')) then ShowMessage(AnsiToUtf8('Daný typ škvŕn nie je povolený: '+chybne));
 for i:=1 to StringGrid2.RowCount-1 do
   begin
   if not (StringGrid2.Cells[1,i]='') then
     begin
     if not (round(StrToFloat(StringGrid2.Cells[1,i]))=StrToFloat(StringGrid2.Cells[1,i])) then
        begin
        ShowMessage('Intenzita fakulového poľa može byť: 0, 1, 2, 3, 4. Hodnota '+StringGrid2.Cells[1,i]+' nie je dovolená!');
        nespravne:=true;
        exit;
        end;
     if (StrToInt(StringGrid2.Cells[1,i])<0) or (StrToInt(StringGrid2.Cells[1,i])>4) then
        begin
        ShowMessage(AnsiToUtf8('Intenzita fakulového poľa može byť: 0, 1, 2, 3, 4. Hodnota '+StringGrid2.Cells[1,i]+' nie je dovolená!'));
        nespravne:=true;
        end;
     end;
     for j:=1 to StringGrid2.ColCount-1 do if StringGrid2.Cells[j,i]='' then StringGrid2.Cells[j,i]:='0';
   end;
end;


initialization
  {$I unit7.lrs}

end.

