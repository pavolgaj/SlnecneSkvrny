unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, Menus, ExtCtrls, ComCtrls, StdCtrls, Grids, Unit2, Unit3, Unit4,
  Unit5, Unit6, Unit7, vypocty, XMLRead, Unit8, Unit9, Unit10, Unit11,
  Translations, Clipbrd, shellapi, LCLType, unit12, Unit13, LConvEncoding,
  LCLProc, Buttons, Unit14, Unit15;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
    SaveDialog1: TSaveDialog;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem41Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem32Click(Sender: TObject);
    procedure MenuItem33Click(Sender: TObject);
    procedure MenuItem34Click(Sender: TObject);
    procedure MenuItem36Click(Sender: TObject);
    procedure MenuItem37Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem40Click(Sender: TObject);
    procedure MenuItem42Click(Sender: TObject);
    procedure MenuItem43Click(Sender: TObject);
    procedure MenuItem44Click(Sender: TObject);
    procedure MenuItem45Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure otvaranie(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure uloz;
    procedure zobraz(dat:string; n:integer);
    procedure nacitaj(f:string);
    procedure vycisti;
    procedure no_data(stav: boolean);
    procedure exportuj(n:integer);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  test: boolean=true;
  novy: boolean=true;
  zmena: boolean=false;
  data: string;

implementation

{ TForm1 }

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
 ToolButton1Click(Sender);
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
var n,i: integer;
begin
if ListBox1.ItemIndex>=0 then
 begin
 n:=ListBox1.ItemIndex;
 Form7.oprava(n);
 ok:=true;
 Form7.Caption:='Oprava záznamu';
 Form7.ShowModal;
 if ok then
    begin
    for i:=n to StringGrid1.RowCount-2 do StringGrid1.Rows[i]:=StringGrid1.Rows[i+1];
    if StringGrid1.RowCount>1 then StringGrid1.RowCount:=StringGrid1.RowCount-1
       else for i:=0 to StringGrid1.ColCount-1 do StringGrid1.Cells[i,0]:='';
    uloz;
    end;
 ok:=false;
 end;
end;

procedure TForm1.ToolButton11Click(Sender: TObject);
begin
  Form9.Show;
end;

procedure TForm1.ToolButton13Click(Sender: TObject);
begin
  if FileExists('navod.pdf') then ShellExecute(handle, 'open', 'navod.pdf', nil,nil, sw_show)
     else MessageDlg('Slnečné škvrny','Súbor nápovedy "navod.pdf" nenájdený!',mtInformation,[mbOK],0);
end;

procedure TForm1.ToolButton14Click(Sender: TObject);
begin
  MenuItem45Click(Sender);
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
 Form7.Caption:='Nový záznam';
 Form7.ShowModal;
 if ok then uloz;
 ok:=false;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
var i,j,k:integer;
begin
  Form8.ListBox1.Items:=ListBox1.Items;
  Form8.ShowModal;
  if zmazat then
     begin
     k:=0;
     for j:=0 to Form8.ListBox1.Count-1 do
        if Form8.ListBox1.Selected[j] then
            begin
            for i:=j-k to StringGrid1.RowCount-2 do StringGrid1.Rows[i]:=StringGrid1.Rows[i+1];
            inc(k);
            if StringGrid1.RowCount>1 then StringGrid1.RowCount:=StringGrid1.RowCount-1
               else if ListBox1.Items.Count=1 then for i:=0 to StringGrid1.ColCount-1 do StringGrid1.Cells[i,0]:='';
            ListBox1.Clear;
            if (StringGrid1.RowCount>1) or (StringGrid1.Cells[0,0]<>'') then for i:=0 to StringGrid1.RowCount-1 do ListBox1.Items.Add(StringGrid1.Cells[1,i]);
            vycisti;
            Memo1.Clear;
            StringGrid2.RowCount:=1;
            StringGrid3.RowCount:=1;
            zmena:=true;
            end;
     if ListBox1.Items.Count=0 then
        begin
        ToolButton11.Enabled:=false;
        ToolButton9.Enabled:=false;
        MenuItem11.Enabled:=false;
        end
       else
        begin
        no_data(true);
        end;
     Form9.TabSheet7.Visible:=true;
     Form9.TabSheet7.TabVisible:=true;
     Form9.PageControl1.TabIndex:=0;
     Form10.TabSheet11.Visible:=true;
     Form10.TabSheet11.TabVisible:=true;
     Form10.PageControl1.TabIndex:=0;
     end;
end;

procedure TForm1.ToolButton4Click(Sender: TObject);
begin
 Form5.ShowModal;
end;

procedure TForm1.MenuItem21Click(Sender: TObject);
begin
 Form2.Show;
end;

procedure TForm1.no_data(stav: boolean);
//nie su nacitane ziadne data
begin
  ToolButton5.Enabled:=stav;
  ToolButton9.Enabled:=stav;
  ToolButton11.Enabled:=stav;
  MenuItem17.Enabled:=stav;
  MenuItem4.Enabled:=stav;
  MenuItem11.Enabled:=stav;
end;

procedure TForm1.FormCreate(Sender: TObject);
// start programu
var f: TextFile;
begin
 try
 if DirectoryIsWritable(GetCurrentDir) then
    begin
    AssignFile(f,'preklad');
    rewrite(f);
    writeln(f);
    writeln(f,'#: lclstrconsts.ifsvk_cancel');
    writeln(f,'msgctxt "lclstrconsts.ifsvk_cancel"');
    writeln(f,'msgid "Cancel"');
    writeln(f,'msgstr "Zrušiť"');
    writeln(f);
    writeln(f,'#: lclstrconsts.rsmbno');
    writeln(f,'msgid "&No"');
    writeln(f,'msgstr "Nie"');
    writeln(f);
    writeln(f,'#: lclstrconsts.rsmbyes');
    writeln(f,'msgid "&Yes"');
    writeln(f,'msgstr "Áno"');
    CloseFile(f);
    TranslateUnitResourceStrings('LCLStrConsts','preklad','sk',''); // preklad do slovenciny
    Erase(f);
    end;
 finally
  DateSeparator:='.';
  DecimalSeparator:='.';
  vycisti;
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
 vycisti;
 if not (ListBox1.ItemIndex<0) then zobraz(ListBox1.Items[ListBox1.ItemIndex],ListBox1.ItemIndex);
end;

procedure TForm1.vycisti;
//zmazanie nakresu
begin
 Image1.Width:=Form1.Width-434;
 Image1.Height:=Form1.Height-125;
 if Image1.Width>Image1.Height then Image1.Width:=Image1.Height
     else Image1.Height:=Image1.Width;
 Image1.Canvas.Brush.Color:=clWhite;
 Image1.Canvas.Pen.Color:=clBlack;
 Image1.Canvas.FillRect(ClientRect);
 Image1.Canvas.Brush.Color:=$89FBF9;
 Image1.Canvas.EllipseC(round(Image1.Width/2),round(Image1.Height/2),round(Image1.Width/2)-20,round(Image1.Height/2)-20);
 Image1.Canvas.EllipseC(round(Image1.Width/2),round(Image1.Height/2),round((Image1.Width-40)/4),round((Image1.Height-40)/4));
 Image1.Canvas.Line(20,round(Image1.Height/2),Image1.Width-20,round(Image1.Height/2));
 Image1.Canvas.Line(round(Image1.Width/2),20,round(Image1.Width/2),Image1.Height-20);
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
 if ListBox1.ItemIndex>=0 then zobraz(ListBox1.Items[ListBox1.ItemIndex],ListBox1.ItemIndex);
end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  ToolButton2Click(Sender);
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  Form10.Show;
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  ToolButton11Click(Sender);
end;

procedure TForm1.exportuj(n:integer);
//export do pdf
type skupina=record
     typ,cislo: string;
     pocet,penumbry,male: integer;
     x,y,plocha:real;
     end;
     fakula=record
     intenzita: byte;
     x,y,plocha:real;
     cislo: string;
     end;

var posun,i,j,g,f,r,fC,gC,rC,p,s,RB,SN,CV,Fp,polomer: integer;
    t,t1: string;
    skvrny: array[1..50] of skupina;
    polia: array[1..90] of fakula;
    x,y: real;

procedure typy;
begin
if skvrny[i].typ='Axx' then begin CV:=CV+1; exit; end;
if skvrny[i].typ='Bxo' then begin CV:=CV+2; exit; end;
if skvrny[i].typ='Bxi' then begin CV:=CV+3; exit; end;
if skvrny[i].typ='Hrx' then begin CV:=CV+4; exit; end;
if skvrny[i].typ='Cro' then begin CV:=CV+5; exit; end;
if skvrny[i].typ='Cri' then begin CV:=CV+6; exit; end;
if skvrny[i].typ='Hax' then begin CV:=CV+7; exit; end;
if skvrny[i].typ='Cao' then begin CV:=CV+8; exit; end;
if skvrny[i].typ='Cai' then begin CV:=CV+9; exit; end;
if skvrny[i].typ='Hsx' then begin CV:=CV+10; exit; end;
if skvrny[i].typ='Cso' then begin CV:=CV+11; exit; end;
if skvrny[i].typ='Csi' then begin CV:=CV+12; exit; end;
if skvrny[i].typ='Dro' then begin CV:=CV+13; exit; end;
if skvrny[i].typ='Ero' then begin CV:=CV+14; exit; end;
if skvrny[i].typ='Fro' then begin CV:=CV+15; exit; end;
if skvrny[i].typ='Dri' then begin CV:=CV+16; exit; end;
if skvrny[i].typ='Eri' then begin CV:=CV+17; exit; end;
if skvrny[i].typ='Fri' then begin CV:=CV+18; exit; end;
if skvrny[i].typ='Dao' then begin CV:=CV+19; exit; end;
if skvrny[i].typ='Eao' then begin CV:=CV+20; exit; end;
if skvrny[i].typ='Fao' then begin CV:=CV+21; exit; end;
if skvrny[i].typ='Dai' then begin CV:=CV+22; exit; end;
if skvrny[i].typ='Eai' then begin CV:=CV+23; exit; end;
if skvrny[i].typ='Fai' then begin CV:=CV+24; exit; end;
if skvrny[i].typ='Dso' then begin CV:=CV+25; exit; end;
if skvrny[i].typ='Eso' then begin CV:=CV+26; exit; end;
if skvrny[i].typ='Fso' then begin CV:=CV+27; exit; end;
if skvrny[i].typ='Dsi' then begin CV:=CV+28; exit; end;
if skvrny[i].typ='Esi' then begin CV:=CV+29; exit; end;
if skvrny[i].typ='Fsi' then begin CV:=CV+30; exit; end;
if skvrny[i].typ='Dac' then begin CV:=CV+31; exit; end;
if skvrny[i].typ='Eac' then begin CV:=CV+32; exit; end;
if skvrny[i].typ='Fac' then begin CV:=CV+33; exit; end;
if skvrny[i].typ='Dsc' then begin CV:=CV+34; exit; end;
if skvrny[i].typ='Esc' then begin CV:=CV+35; exit; end;
if skvrny[i].typ='Fsc' then begin CV:=CV+36; exit; end;
if skvrny[i].typ='Hkx' then begin CV:=CV+37; exit; end;
if skvrny[i].typ='Cko' then begin CV:=CV+38; exit; end;
if skvrny[i].typ='Cki' then begin CV:=CV+39; exit; end;
if skvrny[i].typ='Hhx' then begin CV:=CV+40; exit; end;
if skvrny[i].typ='Cho' then begin CV:=CV+41; exit; end;
if skvrny[i].typ='Chi' then begin CV:=CV+42; exit; end;
if skvrny[i].typ='Dko' then begin CV:=CV+43; exit; end;
if skvrny[i].typ='Eko' then begin CV:=CV+44; exit; end;
if skvrny[i].typ='Fko' then begin CV:=CV+45; exit; end;
if skvrny[i].typ='Dki' then begin CV:=CV+46; exit; end;
if skvrny[i].typ='Eki' then begin CV:=CV+47; exit; end;
if skvrny[i].typ='Fki' then begin CV:=CV+48; exit; end;
if skvrny[i].typ='Dho' then begin CV:=CV+49; exit; end;
if skvrny[i].typ='Eho' then begin CV:=CV+50; exit; end;
if skvrny[i].typ='Fho' then begin CV:=CV+51; exit; end;
if skvrny[i].typ='Dhi' then begin CV:=CV+52; exit; end;
if skvrny[i].typ='Ehi' then begin CV:=CV+53; exit; end;
if skvrny[i].typ='Fhi' then begin CV:=CV+54; exit; end;
if skvrny[i].typ='Dkc' then begin CV:=CV+55; exit; end;
if skvrny[i].typ='Ekc' then begin CV:=CV+56; exit; end;
if skvrny[i].typ='Fkc' then begin CV:=CV+57; exit; end;
if skvrny[i].typ='Dhc' then begin CV:=CV+58; exit; end;
if skvrny[i].typ='Ehc' then begin CV:=CV+59; exit; end;
if skvrny[i].typ='Fhc' then begin CV:=CV+60; exit; end;
end;

begin
  Form13.PRLabel6.Caption:=StringGrid1.Cells[1,n];
  t:=StringGrid1.Cells[2,n];
  Insert(':',t,3);
  Insert(':',t,6);
  posun:=StrToInt(StringGrid1.Cells[3,n])+StrToInt(StringGrid1.Cells[4,n]);
  t1:=IntToStr(StrToInt(Copy(t,1,2))-posun);
  t:=Copy(t,3,6);
  Form13.PRLabel10.Caption:=t1+t;
  Form13.PRLabel3.Caption:=StringGrid1.Cells[8,n];
  Form13.PRLabel4.Caption:=StringGrid1.Cells[9,n];
  Form13.PRLabel26.Caption:=StringGrid1.Cells[10,n];
  Form13.PRLabel20.Caption:=StringGrid1.Cells[11,n];
  Form13.PRLabel23.Caption:=StringGrid1.Cells[12,n];
  Form13.PRLabel29.Caption:=StringGrid1.Cells[13,n];
  Form13.PRLabel32.Caption:=StringGrid1.Cells[14,n];
  Form13.PRLabel34.Caption:=StringGrid1.Cells[15,n];
  Form13.PRLabel36.Caption:=StringGrid1.Cells[16,n];
  polomer:=StrToInt(StringGrid1.Cells[16,n]);
  Form13.PRLabel15.Caption:=StringGrid1.Cells[5,n];
  Form13.PRLabel18.Caption:=StringGrid1.Cells[6,n];
  Form13.PRLabel12.Caption:=StringGrid1.Cells[7,n];
  Form13.PRLabel63.Caption:=StringGrid1.Cells[18,n];
  Form13.PRLabel65.Caption:=StringGrid1.Cells[19,n];
  Form13.PRLabel67.Caption:=StringGrid1.Cells[20,n];
  Form13.PRLabel61.Caption:=StringGrid1.Cells[21,n];

  g:=StrToInt(StringGrid1.Cells[22,n]);
  f:=0;
  p:=0;
  s:=0;
  fC:=0;
  gC:=0;
  CV:=0;
  RB:=0;
  Form13.vycisti;

  for i:=1 to g do
     begin
     for j:=1 to 8 do
         begin
         t:=StringGrid1.Cells[22+j+(i-1)*8,n];
         case j of
              1: skvrny[i].typ:=t;
              2: skvrny[i].pocet:=StrToInt(t);
              3: skvrny[i].penumbry:=StrToInt(t);
              4: skvrny[i].x:=StrToFloat(t);
              5: skvrny[i].y:=StrToFloat(t);
              6: skvrny[i].plocha:=StrToFloat(t);
              7: skvrny[i].male:=StrToInt(t);
              8: skvrny[i].cislo:=t;
              end;
         end;
     typy;
     if sqrt(sqr(skvrny[i].x)+sqr(skvrny[i].y))<polomer/2 then
        begin
        inc(gC);
        fC:=fC+skvrny[i].pocet;
        end;
     f:=f+skvrny[i].pocet;
     p:=p+skvrny[i].penumbry;
     s:=s+skvrny[i].male;
     t:=skvrny[i].typ;
     Delete(t,2,2);
     if (t='A') or (t='B') then j:=4
        else if t='C' then j:=8
             else if t='D' then j:=18
                  else if t='E' then j:=25
                       else if t='F' then j:=36
                            else if t='H' then j:=44;
     RB:=RB+j*skvrny[i].pocet;
     end;
  SN:=10*p+s;
  r:=10*g+f;
  rC:=10*gC+fC;
  Form13.PRLabel43.Caption:=IntToStr(g);
  Form13.PRLabel41.Caption:=IntToStr(f);
  Form13.PRLabel39.Caption:=IntToStr(r);
  Form13.PRLabel45.Caption:=IntToStr(gC);
  Form13.PRLabel46.Caption:=IntToStr(fC);
  Form13.PRLabel49.Caption:=IntToStr(rC);
  Form13.PRLabel51.Caption:=IntToStr(CV);
  Form13.PRLabel52.Caption:=IntToStr(SN);
  Form13.PRLabel55.Caption:=IntToStr(RB);
  Fp:=StrToInt(StringGrid1.Cells[23+8*g,n]);
  Form13.PRLabel59.Caption:=IntToStr(Fp);

  for i:=1 to Fp do
     begin
     for j:=1 to 5 do
         begin
         t:=StringGrid1.Cells[23+8*g+j+(i-1)*5,n];
         case j of
              1: polia[i].intenzita:=StrToInt(t);
              2: polia[i].x:=StrToFloat(t);
              3: polia[i].y:=StrToFloat(t);
              4: polia[i].plocha:=StrToFloat(t);
              5: polia[i].cislo:=t;
              end;
         end;
    with Form13.Image1 do
    begin
     case polia[i].intenzita of
          0: Canvas.Brush.Color:=$CBC9F5;
          1: Canvas.Brush.Color:=$C3C0F6;
          2: Canvas.Brush.Color:=$B0ACF4;
          3: Canvas.Brush.Color:=$A29EF8;
          4: Canvas.Brush.Color:=$857FF5;
          end;
     Canvas.EllipseC(round(polia[i].x/polomer*(Width/2-15))+round(Width/2),-round(polia[i].y/polomer*(Height/2-15))+round(Height/2),round(sqrt(polia[i].plocha/pi)/polomer*(Height/2-15)),round(sqrt(polia[i].plocha/pi)/polomer*(Height/2-15)));
     end;
     end;
  for i:=1 to g do
    with Form13.Image1 do
     begin
     Canvas.Brush.Color:=clGrayText;
     Canvas.EllipseC(round(skvrny[i].x/polomer*(Width/2-15)+Width/2),round(-skvrny[i].y/polomer*(Height/2-15)+Height/2),round(sqrt(skvrny[i].plocha/pi)/polomer*(Height/2-15)),round(sqrt(skvrny[i].plocha/pi)/polomer*(Height/2-15)));
     end;
  Form13.PRImage1.Picture:=Form13.Image1.Picture;
end;

procedure TForm1.MenuItem41Click(Sender: TObject);
//export 1 zaznamu do PDF
var cesta: array[0..1000000] of WideChar;
begin
  if ListBox1.ItemIndex>0 then
     begin
     exportuj(ListBox1.ItemIndex);
     //Form13.Show;
     if Form13.SaveDialog1.Execute then
     begin
     cesta:=UTF8toUTF16(Form13.SaveDialog1.FileName);
     Form13.PReport1.FileName:=Form13.SaveDialog1.FileName;
     Form13.PReport1.BeginDoc;
     Form13.PReport1.Print(Form13.PRPage1);
     Form13.PReport1.EndDoc;
     ShellExecute(Handle, 'open', cesta,nil,nil,SW_SHOWNORMAL);
     end;
     end;
end;

procedure TForm1.MenuItem17Click(Sender: TObject);
var i: integer;
begin
 Clipboard.AsText:=ListBox1.Items.Strings[0];
 for i:=1 to ListBox1.Items.Count-1 do
     begin
     Clipboard.AsText:=Clipboard.AsText+#13+ListBox1.Items.Strings[i];
     end;
end;

procedure TForm1.MenuItem18Click(Sender: TObject);
begin
 Form11.ShowModal;
end;

procedure TForm1.FormActivate(Sender: TObject);
// spustenie programu
begin
 if not FileExists('nastavenia.config') and novy then
    begin
    MessageDlg('Slnečné škvrny','Zadajte, prosím, Vaše nastavenia!',mtError, [mbOK],0);
    no_data(false);
    test:=false;
    end;
 novy:=false;
 if test then otvaranie(Sender);
 vycisti;
 if ListBox1.ItemIndex>=0 then zobraz(ListBox1.Items[ListBox1.ItemIndex],ListBox1.ItemIndex);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form12.Show;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
//ukoncenie programu
var o: byte;
    t: string;
begin
 if zmena then
    begin
    o:=MessageDlg('Slnečné škvrny','Chcete uložiť zmeny v súbore dát '+data+'?',mtConfirmation,mbYesNoCancel,0);
    if o=mrYes then ToolButton5Click(Sender);
    if o=mrNo then CloseAction:=caFree;
    if o=mrCancel then CloseAction:=caNone;
    end;
 t:=data;
 Delete(t,Length(t)-2,3);
 DeleteFile(t+'bak1.xml');
end;

procedure TForm1.otvaranie(Sender: TObject);
//nacitanie z prednastaveneho suboru -> testovanie existencie
var Info : TSearchRec;
begin
 Form5.FormShow(Sender);
 if odp>0 then
 begin
 if Form5.ComboBox3.ItemIndex=0 then begin
       if not FileExists(Form5.Edit3.Text) then
              begin
              MessageDlg('Slnečné škvrny','Prednastavený súbor dát nenájdený!',mtError, [mbOK],0);
              no_data(false);
              end
          else nacitaj(Form5.Edit3.Text);
       end
    else if not FileExists(Form5.FileNameEdit1.FileName) then
            begin
            MessageDlg('Slnečné škvrny','Prednastavený súbor dát nenájdený!',mtError, [mbOK],0);
            no_data(false);
            end
         else nacitaj(Form5.FileNameEdit1.FileName);
 end;
 test:=false;
end;

procedure TForm1.nacitaj(f:string);
//nacitanie dat zo suboru
var s: TextFile;
    i,n:integer;
    t: string;
begin
 t:=f;
 Delete(t,Length(t)-2,3);
 CopyFile(f,t+'bak1.xml');
 AssignFile(s,f);
 Reset(s);
 for i:=1 to 6 do readln(s);
 n:=0;
 repeat
    readln(s,t);
    inc(n);
 until Pos('column="1"',t)>0;
 CloseFile(s);
 StringGrid1.RowCount:=1;
 StringGrid1.RowCount:=n-1;
 StringGrid1.LoadFromFile(f);
 data:=f;
 ListBox1.Clear;
 for i:=0 to StringGrid1.RowCount-1 do ListBox1.Items.Add(StringGrid1.Cells[1,i]);
 if ListBox1.Items.Count=0 then
        begin
        no_data(false);
        end
     else
        begin
        no_data(true);
        ListBox1.TopIndex:=ListBox1.Items.Count-1;
        end;
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
//ukladanie dat do suboru
var t: string;
begin
 Form1.Cursor:=crHourGlass;
 FileSetAttr(data,not faAnyFile);
 StringGrid1.SaveToFile(data);
 FileSetAttr(data,faReadOnly);
 if zmena then
    begin
    t:=data;
    Delete(t,Length(t)-2,3);
    CopyFile(t+'bak1.xml',t+'bak.xml');
    CopyFile(data,t+'bak1.xml');
    if Form5.CheckBox1.Checked then
       CopyFile(data,Form5.FileNameEdit2.FileName);
    end;
 zmena:=false;
 Form1.Cursor:=crDefault;
end;

procedure TForm1.ToolButton7Click(Sender: TObject);
begin
  MenuItem18Click(Sender);
end;

procedure TForm1.ToolButton9Click(Sender: TObject);
begin
  MenuItem12Click(Sender);
end;

procedure TForm1.MenuItem22Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm1.MenuItem23Click(Sender: TObject);
begin
  Form4.Show;
end;

procedure TForm1.MenuItem24Click(Sender: TObject);
begin
  ToolButton13Click(Sender);
end;

procedure TForm1.MenuItem25Click(Sender: TObject);
//odstranie 1 zaznamu
var n,i: integer;
begin
if ListBox1.ItemIndex>=0 then
begin
 if MessageDlg('Slnečné škvrny','Chcete odstrániť záznam z '+ListBox1.Items[ListBox1.ItemIndex]+'?',mtConfirmation,mbYesNo,0)=mrYes then
    begin
    n:=ListBox1.ItemIndex;
    for i:=n to StringGrid1.RowCount-2 do StringGrid1.Rows[i]:=StringGrid1.Rows[i+1];
    if StringGrid1.RowCount>1 then StringGrid1.RowCount:=StringGrid1.RowCount-1
       else if ListBox1.Items.Count=1 then for i:=0 to StringGrid1.ColCount-1 do StringGrid1.Cells[i,0]:='';
    ListBox1.Clear;
    if (StringGrid1.RowCount>1) or (StringGrid1.Cells[0,0]<>'') then for i:=0 to StringGrid1.RowCount-1 do ListBox1.Items.Add(StringGrid1.Cells[1,i]);
    vycisti;
    Memo1.Clear;
    StringGrid2.RowCount:=1;
    StringGrid3.RowCount:=1;
    if ListBox1.Items.Count=0 then
        begin
        ToolButton11.Enabled:=false;
        ToolButton9.Enabled:=false;
        MenuItem11.Enabled:=false;
        end
       else
        begin
        no_data(true);
        end;
    zmena:=true;
    Form9.TabSheet7.Visible:=true;
    Form9.TabSheet7.TabVisible:=true;
    Form9.PageControl1.TabIndex:=0;
    Form10.TabSheet11.Visible:=true;
    Form10.TabSheet11.TabVisible:=true;
    Form10.PageControl1.TabIndex:=0;
    end;
end;
end;

procedure TForm1.MenuItem26Click(Sender: TObject);
begin
  MenuItem9Click(Sender);
end;

procedure TForm1.MenuItem27Click(Sender: TObject);
//pridanie zaznamov zo suboru
var s: TextFile;
    i,n:integer;
    t,f: string;

procedure zorad;
begin
 n:=StringGrid1.RowCount-2;
 while StrToFloat(StringGrid4.Cells[0,i])<StrToFloat(StringGrid1.Cells[0,n]) do
       begin
       StringGrid1.Rows[n+1]:=StringGrid1.Rows[n];
       Dec(n);
       if n<0 then exit;
       end;
end;

begin
  OpenDialog1.Title:='Pridanie záznamov zo súboru';
  if OpenDialog1.Execute then
  if not (OpenDialog1.FileName='') then
     begin
     Form1.Cursor:=crHourGlass;
     f:=OpenDialog1.FileName;
     AssignFile(s,f);
     Reset(s);
     for i:=1 to 6 do readln(s);
     n:=0;
     repeat
        readln(s,t);
        inc(n);
     until Pos('column="1"',t)>0;
     CloseFile(s);
     StringGrid4.RowCount:=n-1;
     StringGrid4.LoadFromFile(f);
     for i:=0 to StringGrid4.RowCount-1 do
         begin
         StringGrid1.RowCount:=StringGrid1.RowCount+1;
         zorad;
         if n>=0 then n:=n+1 else n:=0;
         StringGrid1.Rows[n]:=StringGrid4.Rows[i];
         end;
     ListBox1.Clear;
     for i:=0 to StringGrid1.RowCount-1 do ListBox1.Items.Add(StringGrid1.Cells[1,i]);
     vycisti;
     Memo1.Clear;
     StringGrid2.RowCount:=1;
     StringGrid3.RowCount:=1;
     zmena:=true;
     Form9.TabSheet7.Visible:=true;
     Form9.TabSheet7.TabVisible:=true;
     Form9.PageControl1.TabIndex:=0;
     Form10.TabSheet11.Visible:=true;
     Form10.TabSheet11.TabVisible:=true;
     Form10.PageControl1.TabIndex:=0;
     no_data(true);
     Form1.Cursor:=crDefault;
     end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var i: integer;
begin
  if SaveDialog1.Execute then
  begin
  if not (SaveDialog1.FileName='') then begin
     if Pos('.xml',SaveDialog1.FileName)=0 then data:=SaveDialog1.FileName+'.xml'
        else data:=SaveDialog1.FileName;
     end;
  StringGrid1.RowCount:=1;
  StringGrid1.ColCount:=624;
  for i:=0 to 623 do StringGrid1.Cells[i,0]:='';
  StringGrid2.RowCount:=1;
  StringGrid3.RowCount:=1;
  Memo1.Clear;
  vycisti;
  ListBox1.Clear;
  ToolButton11.Enabled:=false;
  ToolButton9.Enabled:=false;
  MenuItem11.Enabled:=false;
  Form9.TabSheet7.Visible:=true;
  Form9.TabSheet7.TabVisible:=true;
  Form9.PageControl1.TabIndex:=0;
  Form10.TabSheet11.Visible:=true;
  Form10.TabSheet11.TabVisible:=true;
  Form10.PageControl1.TabIndex:=0;
  end;
end;

procedure TForm1.MenuItem32Click(Sender: TObject);
begin
  Image1.Picture.SaveToClipboardFormat(2);
end;

procedure TForm1.MenuItem33Click(Sender: TObject);
begin
 StringGrid2.CopyToClipboard;
end;

procedure TForm1.MenuItem34Click(Sender: TObject);
begin
 StringGrid3.CopyToClipboard;
end;

procedure TForm1.MenuItem36Click(Sender: TObject);
begin
  Form12.Show;
end;

procedure TForm1.MenuItem37Click(Sender: TObject);
begin
  Form12.Show;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
var i: byte;
begin
  OpenDialog1.Title:='Otvoriť existujúci súbor';
  if OpenDialog1.Execute then
  if not (OpenDialog1.FileName='') then
     begin
     Form1.Cursor:=crHourGlass;
     nacitaj(OpenDialog1.FileName);
     data:=OpenDialog1.FileName;
     vycisti;
     Memo1.Clear;
     StringGrid2.RowCount:=1;
     StringGrid3.RowCount:=1;
     Form9.TabSheet7.Visible:=true;
     Form9.TabSheet7.TabVisible:=true;
     Form9.PageControl1.TabIndex:=0;
     Form10.TabSheet11.Visible:=true;
     Form10.TabSheet11.TabVisible:=true;
     Form10.PageControl1.TabIndex:=0;
     Form1.Cursor:=crDefault;
     end;
end;

procedure TForm1.MenuItem40Click(Sender: TObject);
begin
  Form12.Show;
end;

procedure TForm1.MenuItem42Click(Sender: TObject);
//export vsetkych zaznamov do PDF
var i:integer;
    cesta: array[0..1000000] of WideChar;
begin
 if ListBox1.Count>0 then
   begin
   if Form13.SaveDialog1.Execute then
   begin
   cesta:=UTF8toUTF16(Form13.SaveDialog1.FileName);
   if MessageDlg('Slnečné škvrny','Export väčšieho množstvo záznamov môže trvať niekoľko sekúnd až minút. Chcete pokračovať?',mtInformation,mbYesNo,0)=mrYes then
      begin
      Form1.Cursor:=crHourGlass;
      Form13.PReport1.FileName:=Form13.SaveDialog1.FileName;
      Form13.PReport1.BeginDoc;
      for i:=0 to ListBox1.Count-1 do
          begin
          exportuj(i);
          Form13.PReport1.Print(Form13.PRPage1);
          end;
      Form13.PReport1.EndDoc;
      Form1.Cursor:=crDefault;
      ShowMessage('Export dokončený.');
      ShellExecute(Handle, 'open', cesta,nil,nil,SW_SHOWNORMAL);
      end;
   end;
   end;
end;

procedure TForm1.MenuItem43Click(Sender: TObject);
//export viacerych zaznamov do PDF
var i:integer;
    cesta: array[0..1000000] of WideChar;
begin
  Form14.ListBox1.Items:=ListBox1.Items;
  Form14.ShowModal;
 if vyber>0 then
   begin
   if Form13.SaveDialog1.Execute then
   begin
   cesta:=UTF8toUTF16(Form13.SaveDialog1.FileName);
   if MessageDlg('Slnečné škvrny','Export väčšieho množstvo záznamov môže trvať niekoľko sekúnd až minút. Chcete pokračovať?',mtInformation,mbYesNo,0)=mrYes then
      begin
      Form1.Cursor:=crHourGlass;
      Form13.PReport1.FileName:=Form13.SaveDialog1.FileName;
      Form13.PReport1.BeginDoc;
      for i:=0 to Form14.ListBox1.Count-1 do
        if Form14.ListBox1.Selected[i] then
          begin
          exportuj(i);
          Form13.PReport1.Print(Form13.PRPage1);
          end;
      Form13.PReport1.EndDoc;
      Form1.Cursor:=crDefault;
      ShowMessage('Export dokončený.');
      ShellExecute(Handle, 'open', cesta,nil,nil,SW_SHOWNORMAL);
      end;
   end;
   end;
end;

procedure TForm1.MenuItem44Click(Sender: TObject);
begin
  MenuItem41Click(Sender);
end;

procedure TForm1.MenuItem45Click(Sender: TObject);
//novy zaznam z obrazka
begin
 Form15.ShowModal;
 if ok then uloz;
 ok:=false;
 with Form7 do
      begin
      ComboBox2.Enabled:=true;
      Edit7.Enabled:=true;
      ComboBox3.Enabled:=true;
      Edit8.Enabled:=true;
      Edit9.Enabled:=true;
      StringGrid1.Enabled:=true;
      StringGrid2.Enabled:=true;
      pevne:=false;
      end;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  ToolButton5Click(sender);
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  Form6.ShowModal;
end;

procedure TForm1.uloz;
var i,j,n,posun,g,F:integer;
    datum,cas:string;
    PBL1: zapis;
    jd,x,y: real;
    sender: TObject;
const jd0=2398140.10155;

procedure zorad;
begin
 i:=StringGrid1.RowCount-2;
 while jd<StrToFloat(StringGrid1.Cells[0,i]) do
       begin
       StringGrid1.Rows[i+1]:=StringGrid1.Rows[i];
       Dec(i);
       if i<0 then exit;
       end;
end;

begin
 if Form7.ComboBox3.ItemIndex=1 then
    begin
    for i:=1 to StrToInt(Form7.Edit8.Text) do
        begin
        x:=StrToFloat(Form7.StringGrid1.Cells[5,i])*cos(StrToFloat(Form7.StringGrid1.Cells[4,i])*pi/180);
        y:=StrToFloat(Form7.StringGrid1.Cells[5,i])*sin(StrToFloat(Form7.StringGrid1.Cells[4,i])*pi/180);
        Form7.StringGrid1.Cells[4,i]:=FloatToStr(x);
        Form7.StringGrid1.Cells[5,i]:=FloatToStr(y);
        end;
    for i:=1 to StrToInt(Form7.Edit9.Text) do
        begin
        x:=StrToFloat(Form7.StringGrid2.Cells[3,i])*cos(StrToFloat(Form7.StringGrid2.Cells[2,i])*pi/180);
        y:=StrToFloat(Form7.StringGrid2.Cells[3,i])*sin(StrToFloat(Form7.StringGrid2.Cells[2,i])*pi/180);
        Form7.StringGrid2.Cells[2,i]:=FloatToStr(x);
        Form7.StringGrid2.Cells[3,i]:=FloatToStr(y);
        end;
    end;
 if not (StringGrid1.Cells[0,0]='') then StringGrid1.RowCount:=StringGrid1.RowCount+1;
 n:=StringGrid1.RowCount-1;
 DateTimeToString(datum,'d.M.yyyy',Form7.DateEdit1.Date);
 cas:=Form7.MaskEdit1.Text;
 posun:=StrToInt(Form7.SpinEdit4.Text);
 if Form7.RadioButton2.Checked=true then posun:=posun+1;
 jd:=rozdel(datum,cas,posun);
 if n>0 then
        begin
        zorad;
        if i>=0 then n:=i+1 else n:=0;
        end
     else n:=0;
 for i:=0 to 623 do StringGrid1.Cells[i,n]:='';
 StringGrid1.Cells[0,n]:=FloatToStr(jd);
 StringGrid1.Cells[1,n]:=datum;
 StringGrid1.Cells[2,n]:=cas;
 StringGrid1.Cells[3,n]:=Form7.SpinEdit4.Text;
 if Form7.RadioButton2.Checked=true then StringGrid1.Cells[4,n]:='1'
    else StringGrid1.Cells[4,n]:='0';
 StringGrid1.Cells[5,n]:=Form7.SpinEdit1.Text;
 StringGrid1.Cells[6,n]:=Form7.SpinEdit2.Text;
 StringGrid1.Cells[7,n]:=Form7.SpinEdit3.Text;
 StringGrid1.Cells[8,n]:=Form7.ComboBox1.Text;
 StringGrid1.Cells[9,n]:=Form7.Edit1.Text;
 StringGrid1.Cells[10,n]:=Form7.Edit2.Text;
 StringGrid1.Cells[11,n]:=Form7.Edit3.Text;
 StringGrid1.Cells[12,n]:=Form7.Edit4.Text;
 StringGrid1.Cells[13,n]:=Form7.Edit5.Text;
 StringGrid1.Cells[14,n]:=Form7.Edit6.Text;
 StringGrid1.Cells[15,n]:=Form7.ComboBox2.Text;
 StringGrid1.Cells[16,n]:=Form7.Edit7.Text;
 StringGrid1.Cells[17,n]:=IntToStr(Form7.ComboBox3.ItemIndex);
 PBL1:=PBL(StrToFloat(StringGrid1.Cells[0,n]));
 StringGrid1.Cells[18,n]:=FloatToStr(PBL1[1]);
 StringGrid1.Cells[19,n]:=FloatToStr(PBL1[2]);
 StringGrid1.Cells[20,n]:=FloatToStr(PBL1[3]);
 StringGrid1.Cells[21,n]:=IntToStr(trunc((StrToFloat(StringGrid1.Cells[0,n])-jd0)/27.2753));
 g:=StrToInt(Form7.Edit8.Text);
 StringGrid1.Cells[22,n]:=Form7.Edit8.Text;
 for i:=0 to g-1 do
     for j:=1 to 8 do StringGrid1.Cells[22+i*8+j,n]:=Form7.StringGrid1.Cells[j,i+1];
 g:=8*g+1;
 F:=StrToInt(Form7.Edit9.Text);
 StringGrid1.Cells[22+g,n]:=Form7.Edit9.Text;
 for i:=0 to F-1 do
     for j:=1 to 5 do StringGrid1.Cells[22+g+i*5+j,n]:=Form7.StringGrid2.Cells[j,i+1];
 ListBox1.Clear;
 for i:=0 to StringGrid1.RowCount-1 do ListBox1.Items.Add(StringGrid1.Cells[1,i]);
 ListBox1.ItemIndex:=n;
 zobraz(datum,n);
 zmena:=true;
 Form9.TabSheet7.Visible:=true;
 Form9.TabSheet7.TabVisible:=true;
 Form9.PageControl1.TabIndex:=0;
 Form10.TabSheet11.Visible:=true;
 Form10.TabSheet11.TabVisible:=true;
 Form10.PageControl1.TabIndex:=0;
 no_data(true);
end;

procedure TForm1.zobraz(dat:string; n:integer);
//zobrazenie zakresu
type skupina=record
     typ,cislo: string;
     pocet,penumbry,male: integer;
     x,y,plocha:real;
     end;
     fakula=record
     intenzita: byte;
     x,y,plocha:real;
     cislo: string;
     end;


var posun,i,j,g,f,r,fC,gC,rC,p,s,RB,SN,CV,Fp,polomer: integer;
    t: string;
    skvrny: array[1..50] of skupina;
    polia: array[1..90] of fakula;
    x,y: real;

procedure typy;
begin
if skvrny[i].typ='Axx' then begin CV:=CV+1; exit; end;
if skvrny[i].typ='Bxo' then begin CV:=CV+2; exit; end;
if skvrny[i].typ='Bxi' then begin CV:=CV+3; exit; end;
if skvrny[i].typ='Hrx' then begin CV:=CV+4; exit; end;
if skvrny[i].typ='Cro' then begin CV:=CV+5; exit; end;
if skvrny[i].typ='Cri' then begin CV:=CV+6; exit; end;
if skvrny[i].typ='Hax' then begin CV:=CV+7; exit; end;
if skvrny[i].typ='Cao' then begin CV:=CV+8; exit; end;
if skvrny[i].typ='Cai' then begin CV:=CV+9; exit; end;
if skvrny[i].typ='Hsx' then begin CV:=CV+10; exit; end;
if skvrny[i].typ='Cso' then begin CV:=CV+11; exit; end;
if skvrny[i].typ='Csi' then begin CV:=CV+12; exit; end;
if skvrny[i].typ='Dro' then begin CV:=CV+13; exit; end;
if skvrny[i].typ='Ero' then begin CV:=CV+14; exit; end;
if skvrny[i].typ='Fro' then begin CV:=CV+15; exit; end;
if skvrny[i].typ='Dri' then begin CV:=CV+16; exit; end;
if skvrny[i].typ='Eri' then begin CV:=CV+17; exit; end;
if skvrny[i].typ='Fri' then begin CV:=CV+18; exit; end;
if skvrny[i].typ='Dao' then begin CV:=CV+19; exit; end;
if skvrny[i].typ='Eao' then begin CV:=CV+20; exit; end;
if skvrny[i].typ='Fao' then begin CV:=CV+21; exit; end;
if skvrny[i].typ='Dai' then begin CV:=CV+22; exit; end;
if skvrny[i].typ='Eai' then begin CV:=CV+23; exit; end;
if skvrny[i].typ='Fai' then begin CV:=CV+24; exit; end;
if skvrny[i].typ='Dso' then begin CV:=CV+25; exit; end;
if skvrny[i].typ='Eso' then begin CV:=CV+26; exit; end;
if skvrny[i].typ='Fso' then begin CV:=CV+27; exit; end;
if skvrny[i].typ='Dsi' then begin CV:=CV+28; exit; end;
if skvrny[i].typ='Esi' then begin CV:=CV+29; exit; end;
if skvrny[i].typ='Fsi' then begin CV:=CV+30; exit; end;
if skvrny[i].typ='Dac' then begin CV:=CV+31; exit; end;
if skvrny[i].typ='Eac' then begin CV:=CV+32; exit; end;
if skvrny[i].typ='Fac' then begin CV:=CV+33; exit; end;
if skvrny[i].typ='Dsc' then begin CV:=CV+34; exit; end;
if skvrny[i].typ='Esc' then begin CV:=CV+35; exit; end;
if skvrny[i].typ='Fsc' then begin CV:=CV+36; exit; end;
if skvrny[i].typ='Hkx' then begin CV:=CV+37; exit; end;
if skvrny[i].typ='Cko' then begin CV:=CV+38; exit; end;
if skvrny[i].typ='Cki' then begin CV:=CV+39; exit; end;
if skvrny[i].typ='Hhx' then begin CV:=CV+40; exit; end;
if skvrny[i].typ='Cho' then begin CV:=CV+41; exit; end;
if skvrny[i].typ='Chi' then begin CV:=CV+42; exit; end;
if skvrny[i].typ='Dko' then begin CV:=CV+43; exit; end;
if skvrny[i].typ='Eko' then begin CV:=CV+44; exit; end;
if skvrny[i].typ='Fko' then begin CV:=CV+45; exit; end;
if skvrny[i].typ='Dki' then begin CV:=CV+46; exit; end;
if skvrny[i].typ='Eki' then begin CV:=CV+47; exit; end;
if skvrny[i].typ='Fki' then begin CV:=CV+48; exit; end;
if skvrny[i].typ='Dho' then begin CV:=CV+49; exit; end;
if skvrny[i].typ='Eho' then begin CV:=CV+50; exit; end;
if skvrny[i].typ='Fho' then begin CV:=CV+51; exit; end;
if skvrny[i].typ='Dhi' then begin CV:=CV+52; exit; end;
if skvrny[i].typ='Ehi' then begin CV:=CV+53; exit; end;
if skvrny[i].typ='Fhi' then begin CV:=CV+54; exit; end;
if skvrny[i].typ='Dkc' then begin CV:=CV+55; exit; end;
if skvrny[i].typ='Ekc' then begin CV:=CV+56; exit; end;
if skvrny[i].typ='Fkc' then begin CV:=CV+57; exit; end;
if skvrny[i].typ='Dhc' then begin CV:=CV+58; exit; end;
if skvrny[i].typ='Ehc' then begin CV:=CV+59; exit; end;
if skvrny[i].typ='Fhc' then begin CV:=CV+60; exit; end;
end;

begin
 Memo1.Clear;
 Memo1.Lines.Add(dat);
 t:=StringGrid1.Cells[2,n];
 Insert(':',t,3);
 Insert(':',t,6);
 posun:=StrToInt(StringGrid1.Cells[3,n])+StrToInt(StringGrid1.Cells[4,n]);
 if posun<0 then t+=' (UT'+IntToStr(posun)+' h)'
    else t+=' (UT+'+IntToStr(posun)+' h)';
 Memo1.Lines.Add(t);
 Memo1.Lines.Add('------------------------');
 Memo1.Lines.Add(StringGrid1.Cells[8,n]);
 Memo1.Lines.Add(StringGrid1.Cells[9,n]);
 if not (StringGrid1.Cells[14,n]='') then
        Memo1.Lines.Add(StringGrid1.Cells[10,n]+' '+StringGrid1.Cells[11,n]+'/'+StringGrid1.Cells[12,n]+' + '+StringGrid1.Cells[13,n]+'mm + '+StringGrid1.Cells[14,n])
    else         Memo1.Lines.Add(StringGrid1.Cells[10,n]+' '+StringGrid1.Cells[11,n]+'/'+StringGrid1.Cells[12,n]+' + '+StringGrid1.Cells[13,n]+'mm');
 Memo1.Lines.Add(StringGrid1.Cells[15,n]+' (polomer zákresu: '+StringGrid1.Cells[16,n]+' mm)');
 polomer:=StrToInt(StringGrid1.Cells[16,n]);
 Memo1.Lines.Add('------------------------');
 Memo1.Lines.Add('Seeing: '+StringGrid1.Cells[5,n]);
 Memo1.Lines.Add('Teplota vzduchu: '+StringGrid1.Cells[6,n]+' °C');
 Memo1.Lines.Add('Rýchlosť vetra: '+StringGrid1.Cells[7,n]+' m/s');
 Memo1.Lines.Add('------------------------');
 Memo1.Lines.Add('P: '+StringGrid1.Cells[18,n]);
 Memo1.Lines.Add('B: '+StringGrid1.Cells[19,n]);
 Memo1.Lines.Add('L: '+StringGrid1.Cells[20,n]);
 Memo1.Lines.Add('Otočka: '+StringGrid1.Cells[21,n]);
 Memo1.Lines.Add('------------------------');
 g:=StrToInt(StringGrid1.Cells[22,n]);
 f:=0;
 p:=0;
 s:=0;
 fC:=0;
 gC:=0;
 CV:=0;
 RB:=0;
 vycisti;
 if StringGrid1.Cells[17,n]='1' then
    begin
    StringGrid2.Cells[4,0]:='uhol';
    StringGrid2.Cells[5,0]:='vzd.';
    StringGrid3.Cells[2,0]:='uhol';
    StringGrid3.Cells[3,0]:='vzd.';
    StringGrid2.Hint:='Informácie o jednotlivých skupinách:'+#13+'typ - podľa McIntoshovej kvalifikácie'+#13+'počet - počet škvŕn v skupine'
          +#13+'penum. - počet penumbier v skupine'+#13+'uhol - pozičný uhol stredu skupiny'+#13+'vzd. - vzdialenosť stredu skupiny od stredu sl. disku'
          +#13+'plocha - plocha škvŕn v mm2 '+#13+'mal. šk. - počet škvŕn v skupine menších ako 1 mm2'+#13+'č. skup. - číslo skupiny';
    StringGrid3.Hint:='Informácie o jednotlivých fakulových poliach:'+#13+'intezita - od 0 do 4 (4 -> najjasnejšie)'+#13+'uhol - pozičný uhol stredu fakuly'
         +#13+'vzd. - vzdialenosť stredu fakuly od stredu sl. disku'+#13+'plocha - plocha fakulového poľa v mm2'+#13+'č. fak. - číslo fakulového poľa';
    end
   else
    begin
    StringGrid2.Cells[4,0]:='x';
    StringGrid2.Cells[5,0]:='y';
    StringGrid3.Cells[2,0]:='x';
    StringGrid3.Cells[3,0]:='y';
    StringGrid2.Hint:='Informácie o jednotlivých skupinách:'+#13+'typ - podľa McIntoshovej kvalifikácie'+#13+'počet - počet škvŕn v skupine'
          +#13+'penum. - počet penumbier v skupine'+#13+'x - x-ová súradnica stredu skupiny'+#13+'y - y-ová súradnica stredu skupiny'
          +#13+'plocha - plocha škvŕn v mm2 '+#13+'mal. šk. - počet škvŕn v skupine menších ako 1 mm2'+#13+'č. skup. - číslo skupiny';
    StringGrid3.Hint:='Informácie o jednotlivých fakulových poliach:'+#13+'intezita - od 0 do 4 (4 -> najjasnejšie)'+#13+'x - x-ová súradnica stredu fakuly'
         +#13+'y - y-ová súradnica stredu fakuly'+#13+'plocha - plocha fakulového poľa v mm2'+#13+'č. fak. - číslo fakulového poľa';
     end;
 StringGrid2.RowCount:=g+1;
 if StringGrid2.RowCount>3 then StringGrid2.Width:=396
     else StringGrid2.Width:=380;
 for i:=1 to StringGrid2.RowCount-1 do StringGrid2.Cells[0,i]:=IntToStr(i);
 for i:=1 to g do
     begin
     for j:=1 to 8 do
         begin
         t:=StringGrid1.Cells[22+j+(i-1)*8,n];
         case j of
              1: skvrny[i].typ:=t;
              2: skvrny[i].pocet:=StrToInt(t);
              3: skvrny[i].penumbry:=StrToInt(t);
              4: skvrny[i].x:=StrToFloat(t);
              5: skvrny[i].y:=StrToFloat(t);
              6: skvrny[i].plocha:=StrToFloat(t);
              7: skvrny[i].male:=StrToInt(t);
              8: skvrny[i].cislo:=t;
              end;
         StringGrid2.Cells[j,i]:=t;
         end;
     if StringGrid1.Cells[17,n]='1' then
        begin
        x:=StrToFloat(StringGrid2.Cells[4,i]);
        y:=StrToFloat(StringGrid2.Cells[5,i]);
        if x>=0 then StringGrid2.Cells[4,i]:=FloatToStr(arctan(y/x)*180/pi)
           else StringGrid2.Cells[4,i]:=FloatToStr(arctan(y/x)*180/pi+180);
        StringGrid2.Cells[5,i]:=FloatToStr(sqrt(sqr(x)+sqr(y)));
        end;
     typy;
     if sqrt(sqr(skvrny[i].x)+sqr(skvrny[i].y))<polomer/2 then
        begin
        inc(gC);
        fC:=fC+skvrny[i].pocet;
        end;
     f:=f+skvrny[i].pocet;
     p:=p+skvrny[i].penumbry;
     s:=s+skvrny[i].male;
     t:=skvrny[i].typ;
     Delete(t,2,2);
     if (t='A') or (t='B') then j:=4
        else if t='C' then j:=8
             else if t='D' then j:=18
                  else if t='E' then j:=25
                       else if t='F' then j:=36
                            else if t='H' then j:=44;
     RB:=RB+j*skvrny[i].pocet;
     end;
 SN:=10*p+s;
 r:=10*g+f;
 rC:=10*gC+fC;
 Memo1.Lines.Add('gC = '+IntToStr(gC));
 Memo1.Lines.Add('fC = '+IntToStr(fC));
 Memo1.Lines.Add('rC = '+IntToStr(rC));
 Memo1.Lines.Add('');
 Memo1.Lines.Add('g = '+StringGrid1.Cells[22,n]);
 Memo1.Lines.Add('f = '+IntToStr(f));
 Memo1.Lines.Add('r = '+IntToStr(r));
 Memo1.Lines.Add('');
 Memo1.Lines.Add('CV = '+IntToStr(CV));
 Memo1.Lines.Add('SN = '+IntToStr(SN));
 Memo1.Lines.Add('RB = '+IntToStr(RB));
 Memo1.Lines.Add('');
 Fp:=StrToInt(StringGrid1.Cells[23+8*g,n]);
 StringGrid3.RowCount:=Fp+1;
 if StringGrid3.RowCount>3 then StringGrid3.Width:=264
     else StringGrid3.Width:=248;
 for i:=1 to StringGrid3.RowCount-1 do StringGrid3.Cells[0,i]:=IntToStr(i);
 for i:=1 to Fp do
     begin
     for j:=1 to 5 do
         begin
         t:=StringGrid1.Cells[23+8*g+j+(i-1)*5,n];
         case j of
              1: polia[i].intenzita:=StrToInt(t);
              2: polia[i].x:=StrToFloat(t);
              3: polia[i].y:=StrToFloat(t);
              4: polia[i].plocha:=StrToFloat(t);
              5: polia[i].cislo:=t;
              end;
         StringGrid3.Cells[j,i]:=t;
         end;
     case polia[i].intenzita of
          0: Image1.Canvas.Brush.Color:=$CBC9F5;
          1: Image1.Canvas.Brush.Color:=$C3C0F6;
          2: Image1.Canvas.Brush.Color:=$B0ACF4;
          3: Image1.Canvas.Brush.Color:=$A29EF8;
          4: Image1.Canvas.Brush.Color:=$857FF5;
          end;
     if StringGrid1.Cells[17,n]='1' then
        begin
        x:=StrToFloat(StringGrid3.Cells[2,i]);
        y:=StrToFloat(StringGrid3.Cells[3,i]);
        StringGrid3.Cells[2,i]:=FloatToStr(arctan(y/x)*180/pi);
        StringGrid3.Cells[3,i]:=FloatToStr(sqrt(sqr(x)+sqr(y)));
        end;
     Image1.Canvas.EllipseC(round(polia[i].x/polomer*(Image1.Width/2-20))+round(Image1.Width/2),-round(polia[i].y/polomer*(Image1.Height/2-20))+round(Image1.Height/2),round(sqrt(polia[i].plocha/pi)/polomer*(Image1.Height/2-20)),round(sqrt(polia[i].plocha/pi)/polomer*(Image1.Height/2-20)));
     Image1.Canvas.Brush.Color:=$89FBF9;
     Image1.Canvas.TextOut(round(polia[i].x/polomer*(Image1.Width/2-20))+round(Image1.Width/2)+round(sqrt(polia[i].plocha/pi)/polomer*(Image1.Height/2-20)),-round(polia[i].y/polomer*(Image1.Height/2-20))+round(Image1.Height/2)+round(sqrt(polia[i].plocha/pi)/polomer*(Image1.Height/2-20)),polia[i].cislo+'/'+IntToStr(i));
     end;
 for i:=1 to g do
     begin
     Image1.Canvas.Brush.Color:=clGrayText;
     Image1.Canvas.EllipseC(round(skvrny[i].x/polomer*(Image1.Width/2-20)+Image1.Width/2),round(-skvrny[i].y/polomer*(Image1.Height/2-20)+Image1.Height/2),round(sqrt(skvrny[i].plocha/pi)/polomer*(Image1.Height/2-20)),round(sqrt(skvrny[i].plocha/pi)/polomer*(Image1.Height/2-20)));
     Image1.Canvas.Brush.Color:=$89FBF9;
     Image1.Canvas.TextOut(round(skvrny[i].x/polomer*(Image1.Width/2-20)+Image1.Width/2)+round(sqrt(skvrny[i].plocha/pi)/polomer*(Image1.Height/2-20)),round(-skvrny[i].y/polomer*(Image1.Height/2-20)+Image1.Height/2)+round(sqrt(skvrny[i].plocha/pi)/polomer*(Image1.Height/2-20)),skvrny[i].cislo+'/'+IntToStr(i));
     end;
 Memo1.Lines.Add('F = '+IntToStr(Fp));
end;

initialization
  {$I unit1.lrs}

end.

