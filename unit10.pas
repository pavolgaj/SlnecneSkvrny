unit Unit10; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Buttons, Menus,Unit9,unit12,vypocty;

type

  { TForm10 }

  TForm10 = class(TForm)
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image10: TImage;
    Image11: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    PageControl1: TPageControl;
    PopupMenu1: TPopupMenu;
    TabSheet1: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure TabSheet10Show(Sender: TObject);
    procedure TabSheet11Show(Sender: TObject);
    procedure TabSheet13Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure TabSheet7Show(Sender: TObject);
    procedure TabSheet8Show(Sender: TObject);
    procedure TabSheet9Show(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form10: TForm10;
  grafy: array[1..11] of boolean;
  spustene: boolean=false;

implementation

{ TForm10 }

procedure TForm10.FormCreate(Sender: TObject);
var i:byte;
begin
  for i:=1 to 11 do grafy[i]:=false;
  PageControl1.TabIndex:=0;
  FormResize(Sender);
end;

procedure TForm10.FormActivate(Sender: TObject);
var i:byte;
begin
if Form9.StringGrid2.RowCount=1 then for i:=1 to 4 do otvorene[i]:=false;
end;

procedure TForm10.FormResize(Sender: TObject);
var i:byte;
begin
  for i:=1 to 11 do grafy[i]:=false;
  GroupBox1.Left:=round(Form10.Width/2-GroupBox1.Width/2);
  GroupBox1.Top:=round(Form10.Height/2-GroupBox1.Height/2);
  GroupBox2.Left:=round(Form10.Width/2-GroupBox2.Width/2);
  GroupBox2.Top:=round(Form10.Height/2-GroupBox2.Height/2);
  Image1.Width:=Form10.Width-5;
  Image2.Width:=Form10.Width-5;
  Image3.Width:=Form10.Width-5;
  Image4.Width:=Form10.Width-5;
  Image5.Width:=Form10.Width-5;
  Image6.Width:=Form10.Width-5;
  Image7.Width:=Form10.Width-5;
  Image8.Width:=Form10.Width-5;
  Image9.Width:=Form10.Width-5;
  Image10.Width:=Form10.Width-5;
  Image11.Width:=Form10.Width-5;
  Image1.Height:=Form10.Height-30;
  Image2.Height:=Form10.Height-30;
  Image3.Height:=Form10.Height-30;
  Image4.Height:=Form10.Height-30;
  Image5.Height:=Form10.Height-30;
  Image6.Height:=Form10.Height-30;
  Image7.Height:=Form10.Height-30;
  Image8.Height:=Form10.Height-30;
  Image9.Height:=Form10.Height-30;
  Image10.Height:=Form10.Height-30;
  Image11.Height:=Form10.Height-30;
  case PageControl1.TabIndex of
       1: TabSheet1Show(Sender);
       2: TabSheet2Show(Sender);
       3: TabSheet3Show(Sender);
       4: TabSheet4Show(Sender);
       5: TabSheet5Show(Sender);
       6: TabSheet6Show(Sender);
       7: TabSheet7Show(Sender);
       8: TabSheet8Show(Sender);
       9: TabSheet9Show(Sender);
       10: TabSheet10Show(Sender);
       11: TabSheet13Show(Sender);
    end;
end;

procedure TForm10.MenuItem1Click(Sender: TObject);
begin
case PageControl1.TabIndex of
       1: Image1.Picture.SaveToClipboardFormat(2);
       2: Image2.Picture.SaveToClipboardFormat(2);
       3: Image3.Picture.SaveToClipboardFormat(2);
       4: Image4.Picture.SaveToClipboardFormat(2);
       5: Image5.Picture.SaveToClipboardFormat(2);
       6: Image6.Picture.SaveToClipboardFormat(2);
       7: Image7.Picture.SaveToClipboardFormat(2);
       8: Image8.Picture.SaveToClipboardFormat(2);
       9: Image9.Picture.SaveToClipboardFormat(2);
       10: Image10.Picture.SaveToClipboardFormat(2);
       11: Image11.Picture.SaveToClipboardFormat(2);
    end;
end;

procedure TForm10.MenuItem3Click(Sender: TObject);
begin
  Form10.Close;
end;

procedure TForm10.TabSheet10Show(Sender: TObject);
//graf F
var i,diel,otvor,n,k: integer;
    vela: boolean;
const max = 40;    //maximalna hodnota F
begin
TabSheet11.TabVisible:=false;
TabSheet11.Visible:=false;
otvor:=Form9.PageControl1.TabIndex;
if Form9.PageControl1.TabIndex=0 then
   begin
   Form9.TabSheet7Show(Sender);
   Form9.TabSheet5Show(sender);
   end;
if not otvorene[1] then Form9.TabSheet1Show(sender);
if not otvorene[3] then Form9.TabSheet5Show(sender);
if otvor=0 then Form9.PageControl1.TabIndex:=7
   else Form9.PageControl1.TabIndex:=otvor;
if not grafy[10] then
  begin
  grafy[10]:=true;
  Image10.Canvas.Pen.Width:=1;
  Image10.Canvas.Brush.Color:=clWhite;
  Image10.Canvas.Pen.Color:=clWhite;
  Image10.Canvas.Rectangle(ClientRect);
  //horizontalna mriezka
  for i:=0 to 10 do
      begin
      Image10.Canvas.Pen.Color:=clGray;
      Image10.Canvas.Line(0,round(i*(Image10.Height-20)/10),Image10.Width,round(i*(Image10.Height-20)/10));
      Image10.Canvas.Pen.Color:=clBlack;
      Image10.Canvas.TextOut(0,round(i*(Image10.Height-20)/10)-3,IntToStr(max-round(max/10)*i));
      end;
  diel:=trunc(Image10.Width/(Form9.StringGrid5.RowCount-1));
  //vertikalna mriezka
  if StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4))>2 then
     begin
     n:=(StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4)))*4;
     k:=3;
     vela:=true;
    end
    else
     begin
     n:=Form9.StringGrid5.RowCount-2;
     k:=1;
     vela:=false;
     end;
  for i:=0 to n do
      begin
      if k*i+1>Form9.StringGrid5.RowCount-1 then break;
      Image10.Canvas.Pen.Color:=clGray;
      Image10.Canvas.Line(18+k*i*diel,0,18+k*i*diel,Image10.Height-20);
      Image10.Canvas.Pen.Color:=clBlack;
      if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='1.') or not vela then Image10.Canvas.TextOut(18+k*i*diel-10,Image10.Height-19,Form9.StringGrid5.Cells[0,k*i+1])
         else
         begin
         if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='2.') or (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='3.')then Image10.Canvas.TextOut(18+k*i*diel-10,Image10.Height-19,'1.'+Copy(Form9.StringGrid5.Cells[0,k*i+1],Length(Form9.StringGrid5.Cells[0,k*i+1])-3,4));
         end;
      end;
  Image10.Canvas.Pen.Color:=clRed;
  Image10.Canvas.Pen.Width:=2;
  //graf mesacnych priemerov
  Image10.Canvas.MoveTo(18,Image10.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[10,1])/max*Image10.Height));
  for i:=2 to Form9.StringGrid5.RowCount-1 do
      begin
      if Form9.StringGrid5.Cells[10,i]='' then Image10.Canvas.LineTo(18+(i-1)*diel,Image10.Height-20)
        else Image10.Canvas.LineTo(18+(i-1)*diel,Image10.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[10,i])/max*(Image10.Height-20)));
      end;
  Image10.Canvas.Pen.Color:=clBlue;
  Image10.Canvas.Pen.Width:=3;
  //graf klzavych priemerov
if Form9.StringGrid6.RowCount>7 then
  begin
  if not (Form9.StringGrid6.Cells[1,7]='') then Image10.Canvas.MoveTo(18+6*diel,Image10.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[10,7])/max*Image10.Height));
  for i:=8 to Form9.StringGrid6.RowCount-6 do
      begin
      if Form9.StringGrid6.Cells[10,i]='' then Image10.Canvas.LineTo(18+(i-1)*diel,Image10.Height-20)
        else Image10.Canvas.LineTo(18+(i-1)*diel,Image10.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[10,i])/max*(Image10.Height-20)));
      end;
  end;
  end;
end;

procedure TForm10.TabSheet11Show(Sender: TObject);
var i: byte;
begin
 for i:=1 to 11 do grafy[i]:=false;
end;

procedure TForm10.TabSheet13Show(Sender: TObject);
//motylikovy diagram
var i,j,diel,otvor,n,k,d,jd0: integer;
    vela: boolean;
const max = 60;    //maximalna hodnota sirky skupiny
      krok = 10;   //velkost dieliku na mriezke
begin
TabSheet11.TabVisible:=false;
TabSheet11.Visible:=false;
otvor:=Form9.PageControl1.TabIndex;
if Form9.PageControl1.TabIndex=0 then
   begin
   Form9.TabSheet7Show(Sender);
   Form9.TabSheet5Show(sender);
   end;
if not otvorene[1] then Form9.TabSheet1Show(sender);
if not otvorene[3] then Form9.TabSheet5Show(sender);
if otvor=0 then Form9.PageControl1.TabIndex:=7
   else Form9.PageControl1.TabIndex:=otvor;
if not grafy[11] then
  begin
  grafy[11]:=true;
  Image11.Canvas.Pen.Width:=1;
  Image11.Canvas.Brush.Color:=clWhite;
  Image11.Canvas.Pen.Color:=clWhite;
  Image11.Canvas.Rectangle(ClientRect);
  //horizontalna mriezka
  for i:=0 to round(2*max/krok) do
      begin
      Image11.Canvas.Pen.Color:=clGray;
      Image11.Canvas.Line(0,round(i*(Image11.Height-20)/round(2*max/krok)),Image11.Width,round(i*(Image11.Height-20)/round(2*max/krok)));
      Image11.Canvas.Pen.Color:=clBlack;
      Image11.Canvas.TextOut(0,round(i*(Image11.Height-20)/round(2*max/krok))-3,IntToStr(max-krok*i));
      end;
   Image11.Canvas.Pen.Color:=clRed;
   Image11.Canvas.Line(0,round((Image11.Height-20)/2),Image11.Width,round((Image11.Height-20)/2));
   Image11.Canvas.Pen.Color:=clBlack;
   Image11.Canvas.TextOut(0,round((Image11.Height-20)/2),IntToStr(0));
  diel:=trunc(Image11.Width/(Form9.StringGrid5.RowCount-1));
  //vertikalna mriezka
  if StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4))>2 then
     begin
     n:=(StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4)))*4;
     k:=3;
     vela:=true;
    end
    else
     begin
     n:=Form9.StringGrid5.RowCount-2;
     k:=1;
     vela:=false;
     end;
  for i:=0 to n do
      begin
      if k*i+1>Form9.StringGrid5.RowCount-1 then break;
      Image11.Canvas.Pen.Color:=clGray;
      Image11.Canvas.Line(18+k*i*diel,0,18+k*i*diel,Image11.Height-20);
      Image11.Canvas.Pen.Color:=clBlack;
      if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='1.') or not vela then Image11.Canvas.TextOut(18+k*i*diel-10,Image11.Height-19,Form9.StringGrid5.Cells[0,k*i+1])
         else
         begin
         if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='2.') or (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='3.')then Image11.Canvas.TextOut(18+k*i*diel-10,Image11.Height-19,'1.'+Copy(Form9.StringGrid5.Cells[0,k*i+1],Length(Form9.StringGrid5.Cells[0,k*i+1])-3,4));
         end;
      end;
  Image11.Canvas.Pen.Color:=clBlack;
  Image11.Canvas.Pen.Width:=3;
  Form12.FormShow(Sender);
  //graf
  jd0:=trunc(rozdel(Form12.ComboBox1.Items.Strings[0],'120000',0));
  for i:=0 to Form12.ComboBox1.Items.Count-1 do
    begin
    Form12.ComboBox1.ItemIndex:=i;
    Form12.ComboBox1Change(Sender);
    d:=trunc(rozdel(Form12.ComboBox1.Items.Strings[i],'120000',0))-jd0;
    for j:=1 to Form12.StringGrid1.RowCount-1 do
        begin
        Image11.Canvas.EllipseC(18+round(d*diel/30),Image11.Height-20-round((StrToFloat(Form12.StringGrid1.Cells[2,j])+max)/(2*max)*(Image1.Height-20)),1,1);
        end;
    end;
  Form12.Close;
  end;
end;

procedure TForm10.TabSheet1Show(Sender: TObject);
// graf g
var i,diel,otvor,n,k: integer;
    vela: boolean;
const max = 30;    //maximalna hodnota g
begin
TabSheet11.TabVisible:=false;
TabSheet11.Visible:=false;
otvor:=Form9.PageControl1.TabIndex;
if Form9.PageControl1.TabIndex=0 then
   begin
   Form9.TabSheet7Show(Sender);
   Form9.TabSheet5Show(sender);
   end;
if not otvorene[1] then Form9.TabSheet1Show(sender);
if not otvorene[3] then Form9.TabSheet5Show(sender);
if otvor=0 then Form9.PageControl1.TabIndex:=7
   else Form9.PageControl1.TabIndex:=otvor;
if not grafy[1] then
  begin
  grafy[1]:=true;
  Image1.Canvas.Pen.Width:=1;
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.Pen.Color:=clWhite;
  Image1.Canvas.Rectangle(ClientRect);
  //horizontalna mriezka
  for i:=0 to 10 do
      begin
      Image1.Canvas.Pen.Color:=clGray;
      Image1.Canvas.Line(0,round(i*(Image1.Height-20)/10),Image1.Width,round(i*(Image1.Height-20)/10));
      Image1.Canvas.Pen.Color:=clBlack;
      Image1.Canvas.TextOut(0,round(i*(Image1.Height-20)/10)-3,IntToStr(round(max-int(max/10)*i)));
      end;
  diel:=trunc(Image1.Width/(Form9.StringGrid5.RowCount-1));
  //vertikalna mriezka
  if StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4))>2 then
     begin
     n:=(StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4)))*4;
     k:=3;
     vela:=true;
    end
    else
     begin
     n:=Form9.StringGrid5.RowCount-2;
     k:=1;
     vela:=false;
     end;
  for i:=0 to n do
      begin
      if k*i+1>Form9.StringGrid5.RowCount-1 then break;
      Image1.Canvas.Pen.Color:=clGray;
      Image1.Canvas.Line(18+k*i*diel,0,18+k*i*diel,Image1.Height-20);
      Image1.Canvas.Pen.Color:=clBlack;
      if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='1.') or not vela then Image1.Canvas.TextOut(18+k*i*diel-10,Image1.Height-19,Form9.StringGrid5.Cells[0,k*i+1])
         else
         begin
         if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='2.') or (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='3.')then Image1.Canvas.TextOut(18+k*i*diel-10,Image1.Height-19,'1.'+Copy(Form9.StringGrid5.Cells[0,k*i+1],Length(Form9.StringGrid5.Cells[0,k*i+1])-3,4));
         end;
      end;
  Image1.Canvas.Pen.Color:=clRed;
  Image1.Canvas.Pen.Width:=2;
  Image1.Canvas.MoveTo(18,Image1.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[1,1])/max*Image1.Height));
  // graf mesacnych priemerov
  for i:=2 to Form9.StringGrid5.RowCount-1 do
      begin
      if Form9.StringGrid5.Cells[1,i]='' then Image1.Canvas.LineTo(18+(i-1)*diel,Image1.Height-20)
        else Image1.Canvas.LineTo(18+(i-1)*diel,Image1.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[1,i])/max*(Image1.Height-20)));
      end;
  Image1.Canvas.Pen.Color:=clBlue;
  Image1.Canvas.Pen.Width:=3;
  // graf klzavych priemerov
 if Form9.StringGrid6.RowCount>7 then
  begin
  if not (Form9.StringGrid6.Cells[1,7]='') then Image1.Canvas.MoveTo(18+6*diel,Image1.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[1,7])/max*Image1.Height));
  for i:=8 to Form9.StringGrid6.RowCount-6 do
      begin
      if Form9.StringGrid6.Cells[1,i]='' then Image1.Canvas.LineTo(18+(i-1)*diel,Image1.Height-20)
        else Image1.Canvas.LineTo(18+(i-1)*diel,Image1.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[1,i])/max*(Image1.Height-20)));
      end;
  end;
  end;
end;

procedure TForm10.TabSheet2Show(Sender: TObject);
//graf f
var i,diel,otvor,n,k: integer;
    vela: boolean;
const max = 150;    //maximalna hodnota f
begin
TabSheet11.TabVisible:=false;
TabSheet11.Visible:=false;
otvor:=Form9.PageControl1.TabIndex;
if Form9.PageControl1.TabIndex=0 then
   begin
   Form9.TabSheet7Show(Sender);
   Form9.TabSheet5Show(sender);
   end;
if not otvorene[1] then Form9.TabSheet1Show(sender);
if not otvorene[3] then Form9.TabSheet5Show(sender);
if otvor=0 then Form9.PageControl1.TabIndex:=7
   else Form9.PageControl1.TabIndex:=otvor;
if not grafy[2] then
  begin
  grafy[2]:=true;
  Image2.Canvas.Pen.Width:=1;
  Image2.Canvas.Brush.Color:=clWhite;
  Image2.Canvas.Pen.Color:=clWhite;
  Image2.Canvas.Rectangle(ClientRect);
  // horizontalna mriezka
  for i:=0 to 10 do
      begin
      Image2.Canvas.Pen.Color:=clGray;
      Image2.Canvas.Line(0,round(i*(Image2.Height-20)/10),Image2.Width,round(i*(Image2.Height-20)/10));
      Image2.Canvas.Pen.Color:=clBlack;
      Image2.Canvas.TextOut(0,round(i*(Image2.Height-20)/10)-3,IntToStr(max-round(max/10)*i));
      end;
  diel:=trunc(Image2.Width/(Form9.StringGrid5.RowCount-1));
  // vertikalna mriezka
 if StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4))>2 then
     begin
     n:=(StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4)))*4;
     k:=3;
     vela:=true;
    end
    else
     begin
     n:=Form9.StringGrid5.RowCount-2;
     k:=1;
     vela:=false;
     end;
  for i:=0 to n do
      begin
      if k*i+1>Form9.StringGrid5.RowCount-1 then break;
      Image2.Canvas.Pen.Color:=clGray;
      Image2.Canvas.Line(18+k*i*diel,0,18+k*i*diel,Image2.Height-20);
      Image2.Canvas.Pen.Color:=clBlack;
      if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='1.') or not vela then Image2.Canvas.TextOut(18+k*i*diel-10,Image2.Height-19,Form9.StringGrid5.Cells[0,k*i+1])
         else
         begin
         if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='2.') or (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='3.')then Image2.Canvas.TextOut(18+k*i*diel-10,Image2.Height-19,'1.'+Copy(Form9.StringGrid5.Cells[0,k*i+1],Length(Form9.StringGrid5.Cells[0,k*i+1])-3,4));
         end;
      end;
  Image2.Canvas.Pen.Color:=clRed;
  Image2.Canvas.Pen.Width:=2;
  Image2.Canvas.MoveTo(18,Image2.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[2,1])/max*Image2.Height));
  // graf mesacnych priemerov
  for i:=2 to Form9.StringGrid5.RowCount-1 do
      begin
      if Form9.StringGrid5.Cells[2,i]='' then Image2.Canvas.LineTo(18+(i-1)*diel,Image2.Height-20)
        else Image2.Canvas.LineTo(18+(i-1)*diel,Image2.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[2,i])/max*(Image2.Height-20)));
      end;
  Image2.Canvas.Pen.Color:=clBlue;
  Image2.Canvas.Pen.Width:=3;
  // graf klzavych priemerov
if Form9.StringGrid6.RowCount>7 then
  begin
  if not (Form9.StringGrid6.Cells[1,7]='') then Image2.Canvas.MoveTo(18+6*diel,Image2.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[2,7])/max*Image2.Height));
  for i:=8 to Form9.StringGrid6.RowCount-6 do
      begin
      if Form9.StringGrid6.Cells[2,i]='' then Image2.Canvas.LineTo(18+(i-1)*diel,Image2.Height-20)
        else Image2.Canvas.LineTo(18+(i-1)*diel,Image2.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[2,i])/max*(Image2.Height-20)));
      end;
  end;
  end;
end;


procedure TForm10.TabSheet3Show(Sender: TObject);
// graf r
var i,diel,otvor,n,k: integer;
    vela: boolean;
const max = 300;    //maximalna hodnota r
begin
TabSheet11.TabVisible:=false;
TabSheet11.Visible:=false;
otvor:=Form9.PageControl1.TabIndex;
if Form9.PageControl1.TabIndex=0 then
   begin
   Form9.TabSheet7Show(Sender);
   Form9.TabSheet5Show(sender);
   end;
if not otvorene[1] then Form9.TabSheet1Show(sender);
if not otvorene[3] then Form9.TabSheet5Show(sender);
if otvor=0 then Form9.PageControl1.TabIndex:=7
   else Form9.PageControl1.TabIndex:=otvor;
if not grafy[3] then
  begin
  grafy[3]:=true;
  Image3.Canvas.Pen.Width:=1;
  Image3.Canvas.Brush.Color:=clWhite;
  Image3.Canvas.Pen.Color:=clWhite;
  Image3.Canvas.Rectangle(ClientRect);
  // horizontalna mriezka
  for i:=0 to 10 do
      begin
      Image3.Canvas.Pen.Color:=clGray;
      Image3.Canvas.Line(0,round(i*(Image3.Height-20)/10),Image3.Width,round(i*(Image3.Height-20)/10));
      Image3.Canvas.Pen.Color:=clBlack;
      Image3.Canvas.TextOut(0,round(i*(Image3.Height-20)/10)-3,IntToStr(max-round(max/10)*i));
      end;
   Image3.Canvas.Pen.Color:=clGray;
   Image3.Canvas.Pen.Style:=psDash;
   Image3.Canvas.Line(0,round((max-100)*(Image3.Height-20)/max),Image3.Width,round((max-100)*(Image3.Height-20)/max));
   Image3.Canvas.Pen.Style:=psSolid;
   Image3.Canvas.Pen.Color:=clBlack;
   Image3.Canvas.TextOut(0,round((max-100)*(Image3.Height-20)/max)-3,IntToStr(100));
   Image3.Canvas.Pen.Color:=clGray;
   Image3.Canvas.Pen.Style:=psDash;
   Image3.Canvas.Line(0,round((max-200)*(Image3.Height-20)/max),Image3.Width,round((max-200)*(Image3.Height-20)/max));
   Image3.Canvas.Pen.Style:=psSolid;
   Image3.Canvas.Pen.Color:=clBlack;
   Image3.Canvas.TextOut(0,round((max-200)*(Image3.Height-20)/max)-3,IntToStr(200));
  diel:=trunc(Image3.Width/(Form9.StringGrid5.RowCount-1));
  // vertikalna mriezka
  if StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4))>2 then
     begin
     n:=(StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4)))*4;
     k:=3;
     vela:=true;
    end
    else
     begin
     n:=Form9.StringGrid5.RowCount-2;
     k:=1;
     vela:=false;
     end;
  for i:=0 to n do
      begin
      if k*i+1>Form9.StringGrid5.RowCount-1 then break;
      Image3.Canvas.Pen.Color:=clGray;
      Image3.Canvas.Line(18+k*i*diel,0,18+k*i*diel,Image3.Height-20);
      Image3.Canvas.Pen.Color:=clBlack;
      if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='1.') or not vela then Image3.Canvas.TextOut(18+k*i*diel-10,Image3.Height-19,Form9.StringGrid5.Cells[0,k*i+1])
         else
         begin
         if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='2.') or (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='3.')then Image3.Canvas.TextOut(18+k*i*diel-10,Image3.Height-19,'1.'+Copy(Form9.StringGrid5.Cells[0,k*i+1],Length(Form9.StringGrid5.Cells[0,k*i+1])-3,4));
         end;
      end;
  Image3.Canvas.Pen.Color:=clRed;
  Image3.Canvas.Pen.Width:=2;
  Image3.Canvas.MoveTo(18,Image3.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[3,1])/max*Image3.Height));
  // graf mesacnych priemerov
  for i:=2 to Form9.StringGrid5.RowCount-1 do
      begin
      if Form9.StringGrid5.Cells[3,i]='' then Image3.Canvas.LineTo(18+(i-1)*diel,Image3.Height-20)
        else Image3.Canvas.LineTo(18+(i-1)*diel,Image3.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[3,i])/max*(Image3.Height-20)));
      end;
  Image3.Canvas.Pen.Color:=clBlue;
  Image3.Canvas.Pen.Width:=3;
  // graf klzavych priemerov
if Form9.StringGrid6.RowCount>7 then
  begin
  if not (Form9.StringGrid6.Cells[1,7]='') then Image3.Canvas.MoveTo(18+6*diel,Image3.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[3,7])/max*Image3.Height));
  for i:=8 to Form9.StringGrid6.RowCount-6 do
      begin
      if Form9.StringGrid6.Cells[3,i]='' then Image3.Canvas.LineTo(18+(i-1)*diel,Image3.Height-20)
        else Image3.Canvas.LineTo(18+(i-1)*diel,Image3.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[3,i])/max*(Image3.Height-20)));
      end;
  end;
  end;
end;

procedure TForm10.TabSheet4Show(Sender: TObject);
// graf gC
var i,diel,otvor,n,k: integer;
    vela: boolean;
const max = 10;    //maximalna hodnota gC
begin
TabSheet11.TabVisible:=false;
TabSheet11.Visible:=false;
otvor:=Form9.PageControl1.TabIndex;
if Form9.PageControl1.TabIndex=0 then
   begin
   Form9.TabSheet7Show(Sender);
   Form9.TabSheet5Show(sender);
   end;
if not otvorene[1] then Form9.TabSheet1Show(sender);
if not otvorene[3] then Form9.TabSheet5Show(sender);
if otvor=0 then Form9.PageControl1.TabIndex:=7
   else Form9.PageControl1.TabIndex:=otvor;
if not grafy[4] then
  begin
  grafy[4]:=true;
  Image4.Canvas.Pen.Width:=1;
  Image4.Canvas.Brush.Color:=clWhite;
  Image4.Canvas.Pen.Color:=clWhite;
  Image4.Canvas.Rectangle(ClientRect);
  //horizontalna mriezka
  for i:=0 to 10 do
      begin
      Image4.Canvas.Pen.Color:=clGray;
      Image4.Canvas.Line(0,round(i*(Image4.Height-20)/10),Image4.Width,round(i*(Image4.Height-20)/10));
      Image4.Canvas.Pen.Color:=clBlack;
      Image4.Canvas.TextOut(0,round(i*(Image4.Height-20)/10)-3,IntToStr(max-round(max/10)*i));
      end;
  diel:=trunc(Image4.Width/(Form9.StringGrid5.RowCount-1));
  //vertikalna mriezka
 if StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4))>2 then
     begin
     n:=(StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4)))*4;
     k:=3;
     vela:=true;
    end
    else
     begin
     n:=Form9.StringGrid5.RowCount-2;
     k:=1;
     vela:=false;
     end;
  for i:=0 to n do
      begin
      if k*i+1>Form9.StringGrid5.RowCount-1 then break;
      Image4.Canvas.Pen.Color:=clGray;
      Image4.Canvas.Line(18+k*i*diel,0,18+k*i*diel,Image4.Height-20);
      Image4.Canvas.Pen.Color:=clBlack;
      if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='1.') or not vela then Image4.Canvas.TextOut(18+k*i*diel-10,Image4.Height-19,Form9.StringGrid5.Cells[0,k*i+1])
         else
         begin
         if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='2.') or (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='3.')then Image4.Canvas.TextOut(18+k*i*diel-10,Image4.Height-19,'1.'+Copy(Form9.StringGrid5.Cells[0,k*i+1],Length(Form9.StringGrid5.Cells[0,k*i+1])-3,4));
         end;
      end;
  Image4.Canvas.Pen.Color:=clRed;
  Image4.Canvas.Pen.Width:=2;
  //graf mesacnych priemerov
  Image4.Canvas.MoveTo(18,Image4.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[4,1])/max*Image4.Height));
  for i:=2 to Form9.StringGrid5.RowCount-1 do
      begin
      if Form9.StringGrid5.Cells[4,i]='' then Image4.Canvas.LineTo(18+(i-1)*diel,Image4.Height-20)
        else Image4.Canvas.LineTo(18+(i-1)*diel,Image4.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[4,i])/max*(Image4.Height-20)));
      end;
  Image4.Canvas.Pen.Color:=clBlue;
  Image4.Canvas.Pen.Width:=3;
  //graf klzavych priemerov
if Form9.StringGrid6.RowCount>7 then
  begin
  if not (Form9.StringGrid6.Cells[1,7]='') then Image4.Canvas.MoveTo(18+6*diel,Image4.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[4,7])/max*Image4.Height));
  for i:=8 to Form9.StringGrid6.RowCount-6 do
      begin
      if Form9.StringGrid6.Cells[4,i]='' then Image4.Canvas.LineTo(18+(i-1)*diel,Image4.Height-20)
        else Image4.Canvas.LineTo(18+(i-1)*diel,Image4.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[4,i])/max*(Image4.Height-20)));
      end;
  end;
  end;
end;

procedure TForm10.TabSheet5Show(Sender: TObject);
// graf fC
var i,diel,otvor,n,k: integer;
    vela: boolean;
const max = 80;    //maximalna hodnota fC
begin
TabSheet11.TabVisible:=false;
TabSheet11.Visible:=false;
otvor:=Form9.PageControl1.TabIndex;
if Form9.PageControl1.TabIndex=0 then
   begin
   Form9.TabSheet7Show(Sender);
   Form9.TabSheet5Show(sender);
   end;
if not otvorene[1] then Form9.TabSheet1Show(sender);
if not otvorene[3] then Form9.TabSheet5Show(sender);
if otvor=0 then Form9.PageControl1.TabIndex:=7
   else Form9.PageControl1.TabIndex:=otvor;
if not grafy[5] then
  begin
  grafy[5]:=true;
  Image5.Canvas.Pen.Width:=1;
  Image5.Canvas.Brush.Color:=clWhite;
  Image5.Canvas.Pen.Color:=clWhite;
  Image5.Canvas.Rectangle(ClientRect);
  //horizontalna mriezka
  for i:=0 to 10 do
      begin
      Image5.Canvas.Pen.Color:=clGray;
      Image5.Canvas.Line(0,round(i*(Image5.Height-20)/10),Image5.Width,round(i*(Image5.Height-20)/10));
      Image5.Canvas.Pen.Color:=clBlack;
      Image5.Canvas.TextOut(0,round(i*(Image5.Height-20)/10)-3,IntToStr(max-round(max/10)*i));
      end;
  diel:=trunc(Image5.Width/(Form9.StringGrid5.RowCount-1));
  //vertikalna mriezka
  if StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4))>2 then
     begin
     n:=(StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4)))*4;
     k:=3;
     vela:=true;
    end
    else
     begin
     n:=Form9.StringGrid5.RowCount-2;
     k:=1;
     vela:=false;
     end;
  for i:=0 to n do
      begin
      if k*i+1>Form9.StringGrid5.RowCount-1 then break;
      Image5.Canvas.Pen.Color:=clGray;
      Image5.Canvas.Line(18+k*i*diel,0,18+k*i*diel,Image5.Height-20);
      Image5.Canvas.Pen.Color:=clBlack;
      if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='1.') or not vela then Image5.Canvas.TextOut(18+k*i*diel-10,Image5.Height-19,Form9.StringGrid5.Cells[0,k*i+1])
         else
         begin
         if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='2.') or (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='3.')then Image5.Canvas.TextOut(18+k*i*diel-10,Image5.Height-19,'1.'+Copy(Form9.StringGrid5.Cells[0,k*i+1],Length(Form9.StringGrid5.Cells[0,k*i+1])-3,4));
         end;
      end;
  Image5.Canvas.Pen.Color:=clRed;
  Image5.Canvas.Pen.Width:=2;
  // graf mesacnych priemerov
  Image5.Canvas.MoveTo(18,Image5.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[5,1])/max*Image5.Height));
  for i:=2 to Form9.StringGrid5.RowCount-1 do
      begin
      if Form9.StringGrid5.Cells[5,i]='' then Image5.Canvas.LineTo(18+(i-1)*diel,Image5.Height-20)
        else Image5.Canvas.LineTo(18+(i-1)*diel,Image5.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[5,i])/max*(Image5.Height-20)));
      end;
  Image5.Canvas.Pen.Color:=clBlue;
  Image5.Canvas.Pen.Width:=3;
  // graf klzavych priemerov
if Form9.StringGrid6.RowCount>7 then
  begin
  if not (Form9.StringGrid6.Cells[1,7]='') then Image5.Canvas.MoveTo(18+6*diel,Image5.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[5,7])/max*Image5.Height));
  for i:=8 to Form9.StringGrid6.RowCount-6 do
      begin
      if Form9.StringGrid6.Cells[5,i]='' then Image5.Canvas.LineTo(18+(i-1)*diel,Image5.Height-20)
        else Image5.Canvas.LineTo(18+(i-1)*diel,Image5.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[5,i])/max*(Image5.Height-20)));
      end;
  end;
  end;
end;

procedure TForm10.TabSheet6Show(Sender: TObject);
// graf rC
var i,diel,otvor,n,k: integer;
    vela: boolean;
const max = 100;    //maximalna hodnota rC
begin
TabSheet11.TabVisible:=false;
TabSheet11.Visible:=false;
otvor:=Form9.PageControl1.TabIndex;
if Form9.PageControl1.TabIndex=0 then
   begin
   Form9.TabSheet7Show(Sender);
   Form9.TabSheet5Show(sender);
   end;
if not otvorene[1] then Form9.TabSheet1Show(sender);
if not otvorene[3] then Form9.TabSheet5Show(sender);
if otvor=0 then Form9.PageControl1.TabIndex:=7
   else Form9.PageControl1.TabIndex:=otvor;
if not grafy[6] then
  begin
  grafy[6]:=true;
  Image6.Canvas.Pen.Width:=1;
  Image6.Canvas.Brush.Color:=clWhite;
  Image6.Canvas.Pen.Color:=clWhite;
  Image6.Canvas.Rectangle(ClientRect);
  //horizontalna mriezka
  for i:=0 to 10 do
      begin
      Image6.Canvas.Pen.Color:=clGray;
      Image6.Canvas.Line(0,round(i*(Image6.Height-20)/10),Image6.Width,round(i*(Image6.Height-20)/10));
      Image6.Canvas.Pen.Color:=clBlack;
      Image6.Canvas.TextOut(0,round(i*(Image6.Height-20)/10)-3,IntToStr(max-round(max/10)*i));
      end;
  diel:=trunc(Image6.Width/(Form9.StringGrid5.RowCount-1));
  //vertikalna mriezka
 if StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4))>2 then
     begin
     n:=(StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4)))*4;
     k:=3;
     vela:=true;
    end
    else
     begin
     n:=Form9.StringGrid5.RowCount-2;
     k:=1;
     vela:=false;
     end;
  for i:=0 to n do
      begin
      if k*i+1>Form9.StringGrid5.RowCount-1 then break;
      Image6.Canvas.Pen.Color:=clGray;
      Image6.Canvas.Line(18+k*i*diel,0,18+k*i*diel,Image6.Height-20);
      Image6.Canvas.Pen.Color:=clBlack;
      if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='1.') or not vela then Image6.Canvas.TextOut(18+k*i*diel-10,Image6.Height-19,Form9.StringGrid5.Cells[0,k*i+1])
         else
         begin
         if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='2.') or (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='3.')then Image6.Canvas.TextOut(18+k*i*diel-10,Image6.Height-19,'1.'+Copy(Form9.StringGrid5.Cells[0,k*i+1],Length(Form9.StringGrid5.Cells[0,k*i+1])-3,4));
         end;
      end;
  Image6.Canvas.Pen.Color:=clRed;
  Image6.Canvas.Pen.Width:=2;
  //graf mesacnych priemerov
  Image6.Canvas.MoveTo(18,Image6.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[6,1])/max*Image6.Height));
  for i:=2 to Form9.StringGrid5.RowCount-1 do
      begin
      if Form9.StringGrid5.Cells[6,i]='' then Image6.Canvas.LineTo(18+(i-1)*diel,Image6.Height-20)
        else Image6.Canvas.LineTo(18+(i-1)*diel,Image6.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[6,i])/max*(Image6.Height-20)));
      end;
  Image6.Canvas.Pen.Color:=clBlue;
  Image6.Canvas.Pen.Width:=3;
  //graf klzavych priemerov
if Form9.StringGrid6.RowCount>7 then
  begin
  if not (Form9.StringGrid6.Cells[1,7]='') then Image6.Canvas.MoveTo(18+6*diel,Image6.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[6,7])/max*Image6.Height));
  for i:=8 to Form9.StringGrid6.RowCount-6 do
      begin
      if Form9.StringGrid6.Cells[6,i]='' then Image6.Canvas.LineTo(18+(i-1)*diel,Image6.Height-20)
        else Image6.Canvas.LineTo(18+(i-1)*diel,Image6.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[6,i])/max*(Image6.Height-20)));
      end;
  end;
  end;
end;

procedure TForm10.TabSheet7Show(Sender: TObject);
//graf CV
var i,diel,otvor,n,k: integer;
    vela: boolean;
const max = 500;    //maximalna hodnota CV
begin
TabSheet11.TabVisible:=false;
TabSheet11.Visible:=false;
otvor:=Form9.PageControl1.TabIndex;
if Form9.PageControl1.TabIndex=0 then
   begin
   Form9.TabSheet7Show(Sender);
   Form9.TabSheet5Show(sender);
   end;
if not otvorene[1] then Form9.TabSheet1Show(sender);
if not otvorene[3] then Form9.TabSheet5Show(sender);
if otvor=0 then Form9.PageControl1.TabIndex:=7
   else Form9.PageControl1.TabIndex:=otvor;
if not grafy[7] then
  begin
  grafy[7]:=true;
  Image7.Canvas.Pen.Width:=1;
  Image7.Canvas.Brush.Color:=clWhite;
  Image7.Canvas.Pen.Color:=clWhite;
  Image7.Canvas.Rectangle(ClientRect);
  //horizontalna mriezka
  for i:=0 to 10 do
      begin
      Image7.Canvas.Pen.Color:=clGray;
      Image7.Canvas.Line(0,round(i*(Image7.Height-20)/10),Image7.Width,round(i*(Image7.Height-20)/10));
      Image7.Canvas.Pen.Color:=clBlack;
      Image7.Canvas.TextOut(0,round(i*(Image7.Height-20)/10)-3,IntToStr(max-round(max/10)*i));
      end;
  diel:=trunc(Image7.Width/(Form9.StringGrid5.RowCount-1));
  //vertikalna mriezka
  if StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4))>2 then
     begin
     n:=(StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4)))*4;
     k:=3;
     vela:=true;
    end
    else
     begin
     n:=Form9.StringGrid5.RowCount-2;
     k:=1;
     vela:=false;
     end;
  for i:=0 to n do
      begin
      if k*i+1>Form9.StringGrid5.RowCount-1 then break;
      Image7.Canvas.Pen.Color:=clGray;
      Image7.Canvas.Line(18+k*i*diel,0,18+k*i*diel,Image7.Height-20);
      Image7.Canvas.Pen.Color:=clBlack;
      if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='1.') or not vela then Image7.Canvas.TextOut(18+k*i*diel-10,Image7.Height-19,Form9.StringGrid5.Cells[0,k*i+1])
         else
         begin
         if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='2.') or (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='3.')then Image7.Canvas.TextOut(18+k*i*diel-10,Image7.Height-19,'1.'+Copy(Form9.StringGrid5.Cells[0,k*i+1],Length(Form9.StringGrid5.Cells[0,k*i+1])-3,4));
         end;
      end;
  Image7.Canvas.Pen.Color:=clRed;
  Image7.Canvas.Pen.Width:=2;
  //graf mesacnych priemerov
  Image7.Canvas.MoveTo(18,Image7.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[7,1])/max*Image7.Height));
  for i:=2 to Form9.StringGrid5.RowCount-1 do
      begin
      if Form9.StringGrid5.Cells[7,i]='' then Image7.Canvas.LineTo(18+(i-1)*diel,Image7.Height-20)
        else Image7.Canvas.LineTo(18+(i-1)*diel,Image7.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[7,i])/max*(Image7.Height-20)));
      end;
  Image7.Canvas.Pen.Color:=clBlue;
  Image7.Canvas.Pen.Width:=3;
  //graf klzavych priemerov
if Form9.StringGrid6.RowCount>7 then
  begin
  if not (Form9.StringGrid6.Cells[1,7]='') then Image7.Canvas.MoveTo(18+6*diel,Image7.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[7,7])/max*Image7.Height));
  for i:=8 to Form9.StringGrid6.RowCount-6 do
      begin
      if Form9.StringGrid6.Cells[7,i]='' then Image7.Canvas.LineTo(18+(i-1)*diel,Image7.Height-20)
        else Image7.Canvas.LineTo(18+(i-1)*diel,Image7.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[7,i])/max*(Image7.Height-20)));
      end;
  end;
  end;
end;

procedure TForm10.TabSheet8Show(Sender: TObject);
// graf SN
var i,diel,otvor,n,k: integer;
    vela: boolean;
const max = 400;    //maximalna hodnota SN
begin
TabSheet11.TabVisible:=false;
TabSheet11.Visible:=false;
otvor:=Form9.PageControl1.TabIndex;
if Form9.PageControl1.TabIndex=0 then
   begin
   Form9.TabSheet7Show(Sender);
   Form9.TabSheet5Show(sender);
   end;
if not otvorene[1] then Form9.TabSheet1Show(sender);
if not otvorene[3] then Form9.TabSheet5Show(sender);
if otvor=0 then Form9.PageControl1.TabIndex:=7
   else Form9.PageControl1.TabIndex:=otvor;
if not grafy[8] then
  begin
  grafy[8]:=true;
  Image8.Canvas.Pen.Width:=1;
  Image8.Canvas.Brush.Color:=clWhite;
  Image8.Canvas.Pen.Color:=clWhite;
  Image8.Canvas.Rectangle(ClientRect);
  //horizontalna mriezka
  for i:=0 to 10 do
      begin
      Image8.Canvas.Pen.Color:=clGray;
      Image8.Canvas.Line(0,round(i*(Image8.Height-20)/10),Image8.Width,round(i*(Image8.Height-20)/10));
      Image8.Canvas.Pen.Color:=clBlack;
      Image8.Canvas.TextOut(0,round(i*(Image8.Height-20)/10)-3,IntToStr(max-round(max/10)*i));
      end;
  diel:=trunc(Image8.Width/(Form9.StringGrid5.RowCount-1));
  //vertikalna mriezka
 if StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4))>2 then
     begin
     n:=(StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4)))*4;
     k:=3;
     vela:=true;
    end
    else
     begin
     n:=Form9.StringGrid5.RowCount-2;
     k:=1;
     vela:=false;
     end;
  for i:=0 to n do
      begin
      if k*i+1>Form9.StringGrid5.RowCount-1 then break;
      Image8.Canvas.Pen.Color:=clGray;
      Image8.Canvas.Line(18+k*i*diel,0,18+k*i*diel,Image8.Height-20);
      Image8.Canvas.Pen.Color:=clBlack;
      if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='1.') or not vela then Image8.Canvas.TextOut(18+k*i*diel-10,Image8.Height-19,Form9.StringGrid5.Cells[0,k*i+1])
         else
         begin
         if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='2.') or (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='3.')then Image8.Canvas.TextOut(18+k*i*diel-10,Image8.Height-19,'1.'+Copy(Form9.StringGrid5.Cells[0,k*i+1],Length(Form9.StringGrid5.Cells[0,k*i+1])-3,4));
         end;
      end;
  Image8.Canvas.Pen.Color:=clRed;
  Image8.Canvas.Pen.Width:=2;
  //graf mesacnych priemerov
  Image8.Canvas.MoveTo(18,Image8.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[8,1])/max*Image8.Height));
  for i:=2 to Form9.StringGrid5.RowCount-1 do
      begin
      if Form9.StringGrid5.Cells[8,i]='' then Image8.Canvas.LineTo(18+(i-1)*diel,Image8.Height-20)
        else Image8.Canvas.LineTo(18+(i-1)*diel,Image8.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[8,i])/max*(Image8.Height-20)));
      end;
  Image8.Canvas.Pen.Color:=clBlue;
  Image8.Canvas.Pen.Width:=3;
  // graf klzavych priemerov
if Form9.StringGrid6.RowCount>7 then
  begin
  if not (Form9.StringGrid6.Cells[1,7]='') then Image8.Canvas.MoveTo(18+6*diel,Image8.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[8,7])/max*Image8.Height));
  for i:=8 to Form9.StringGrid6.RowCount-6 do
      begin
      if Form9.StringGrid6.Cells[8,i]='' then Image8.Canvas.LineTo(18+(i-1)*diel,Image8.Height-20)
        else Image8.Canvas.LineTo(18+(i-1)*diel,Image8.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[8,i])/max*(Image8.Height-20)));
      end;
  end;
  end;
end;

procedure TForm10.TabSheet9Show(Sender: TObject);
//graf RB
var i,diel,otvor,n,k: integer;
    vela: boolean;
const max = 4000;    //maximalna hodnota RB
begin
TabSheet11.TabVisible:=false;
TabSheet11.Visible:=false;
otvor:=Form9.PageControl1.TabIndex;
if Form9.PageControl1.TabIndex=0 then
   begin
   Form9.TabSheet7Show(Sender);
   Form9.TabSheet5Show(sender);
   end;
if not otvorene[1] then Form9.TabSheet1Show(sender);
if not otvorene[3] then Form9.TabSheet5Show(sender);
if otvor=0 then Form9.PageControl1.TabIndex:=7
   else Form9.PageControl1.TabIndex:=otvor;
if not grafy[9] then
  begin
  grafy[9]:=true;
  Image9.Canvas.Pen.Width:=1;
  Image9.Canvas.Brush.Color:=clWhite;
  Image9.Canvas.Pen.Color:=clWhite;
  Image9.Canvas.Rectangle(ClientRect);
  //horizontalna mriezka
  for i:=0 to 10 do
      begin
      Image9.Canvas.Pen.Color:=clGray;
      Image9.Canvas.Line(0,round(i*(Image9.Height-20)/10),Image9.Width,round(i*(Image9.Height-20)/10));
      Image9.Canvas.Pen.Color:=clBlack;
      Image9.Canvas.TextOut(0,round(i*(Image9.Height-20)/10)-3,IntToStr(max-round(max/10)*i));
      end;
  diel:=trunc(Image9.Width/(Form9.StringGrid5.RowCount-1));
  //vertikalna mriezka
  if StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4))>2 then
     begin
     n:=(StrToInt(Copy(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1],Length(Form9.StringGrid5.Cells[0,Form9.StringGrid5.RowCount-1])-3,4))-StrToInt(Copy(Form9.StringGrid5.Cells[0,1],Length(Form9.StringGrid5.Cells[0,1])-3,4)))*4;
     k:=3;
     vela:=true;
    end
    else
     begin
     n:=Form9.StringGrid5.RowCount-2;
     k:=1;
     vela:=false;
     end;
  for i:=0 to n do
      begin
      if k*i+1>Form9.StringGrid5.RowCount-1 then break;
      Image9.Canvas.Pen.Color:=clGray;
      Image9.Canvas.Line(18+k*i*diel,0,18+k*i*diel,Image9.Height-20);
      Image9.Canvas.Pen.Color:=clBlack;
      if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='1.') or not vela then Image9.Canvas.TextOut(18+k*i*diel-10,Image9.Height-19,Form9.StringGrid5.Cells[0,k*i+1])
         else
         begin
         if (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='2.') or (Copy(Form9.StringGrid5.Cells[0,k*i+1],1,2)='3.')then Image9.Canvas.TextOut(18+k*i*diel-10,Image9.Height-19,'1.'+Copy(Form9.StringGrid5.Cells[0,k*i+1],Length(Form9.StringGrid5.Cells[0,k*i+1])-3,4));
         end;
      end;
  Image9.Canvas.Pen.Color:=clRed;
  Image9.Canvas.Pen.Width:=2;
  //graf mesacnych priemerov
  Image9.Canvas.MoveTo(18,Image9.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[9,1])/max*Image9.Height));
  for i:=2 to Form9.StringGrid5.RowCount-1 do
      begin
      if Form9.StringGrid5.Cells[9,i]='' then Image9.Canvas.LineTo(18+(i-1)*diel,Image9.Height-20)
        else Image9.Canvas.LineTo(18+(i-1)*diel,Image9.Height-20-round(StrToFloat(Form9.StringGrid5.Cells[9,i])/max*(Image9.Height-20)));
      end;
  Image9.Canvas.Pen.Color:=clBlue;
  Image9.Canvas.Pen.Width:=3;
  //graf klzavych priemerov
if Form9.StringGrid6.RowCount>7 then
  begin
  if not (Form9.StringGrid6.Cells[1,7]='') then Image9.Canvas.MoveTo(18+6*diel,Image9.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[9,7])/max*Image9.Height));
  for i:=8 to Form9.StringGrid6.RowCount-6 do
      begin
      if Form9.StringGrid6.Cells[9,i]='' then Image9.Canvas.LineTo(18+(i-1)*diel,Image9.Height-20)
        else Image9.Canvas.LineTo(18+(i-1)*diel,Image9.Height-20-round(StrToFloat(Form9.StringGrid6.Cells[9,i])/max*(Image9.Height-20)));
      end;
  end;
  end;
end;

initialization
  {$I unit10.lrs}

end.

