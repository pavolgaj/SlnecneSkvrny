unit Unit12; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  Grids, Menus, StdCtrls,math;

type

  { TForm12 }

  TForm12 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem2: TMenuItem;
    PopupMenu2: TPopupMenu;
    PopupMenu1: TPopupMenu;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form12: TForm12; 

implementation

uses Unit1;

{ TForm12 }

procedure TForm12.FormShow(Sender: TObject);
begin
  ComboBox1.Items:=Form1.ListBox1.Items;
  if Form1.ListBox1.ItemIndex>0 then
     begin
     ComboBox1.ItemIndex:=Form1.ListBox1.ItemIndex;
     ComboBox1Change(Sender);
     end;
end;

procedure TForm12.MenuItem1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm12.MenuItem3Click(Sender: TObject);
begin
 StringGrid2.CopyToClipboard;
end;

procedure TForm12.MenuItem2Click(Sender: TObject);
begin
  StringGrid1.CopyToClipboard;
end;

procedure TForm12.ComboBox1Change(Sender: TObject);
var x,y,Ps,Bs,Ls,l,b,k,m,n,r:real;
    i,g,f:Integer;
begin
 r:=StrToFloat(Form1.StringGrid1.Cells[16,ComboBox1.ItemIndex]);
 Ps:=StrToFloat(Form1.StringGrid1.Cells[18,ComboBox1.ItemIndex]);
 Bs:=StrToFloat(Form1.StringGrid1.Cells[19,ComboBox1.ItemIndex]);
 Ls:=StrToFloat(Form1.StringGrid1.Cells[20,ComboBox1.ItemIndex]);
 g:=StrToInt(Form1.StringGrid1.Cells[22,ComboBox1.ItemIndex]);
 StringGrid1.RowCount:=g+1;
 if g>11 then StringGrid1.Width:=178
    else StringGrid1.Width:=162;
 for i:=1 to g do
     begin
     StringGrid1.Cells[0,i]:=IntToStr(i);
     x:=StrToFloat(Form1.StringGrid1.Cells[22+4+(i-1)*8,ComboBox1.ItemIndex]);
     y:=StrToFloat(Form1.StringGrid1.Cells[22+5+(i-1)*8,ComboBox1.ItemIndex]);
     k:=x*cos(Ps*pi/180)+y*sin(Ps*pi/180);
     m:=-x*sin(Ps*pi/180)+y*cos(Ps*pi/180);
     n:=sqrt(sqr(r)-sqr(x)-sqr(y));
     b:=arctan((m*cos(Bs*pi/180)+n*sin(Bs*pi/180))/r)*180/pi;
     l:=Ls+arcsin(k/r*cos(b*pi/180))*180/pi;
     StringGrid1.Cells[1,i]:=FloatToStr(Round(l*100)/100);
     StringGrid1.Cells[2,i]:=FloatToStr(Round(b*100)/100);
     end;
 f:=StrToInt(Form1.StringGrid1.Cells[23+g*8,ComboBox1.ItemIndex]);
 StringGrid2.RowCount:=f+1;
 if f>11 then StringGrid2.Width:=178
    else StringGrid2.Width:=162;
 for i:=1 to f do
     begin
     StringGrid2.Cells[0,i]:=IntToStr(i);
     x:=StrToFloat(Form1.StringGrid1.Cells[23+g*8+2+(i-1)*5,ComboBox1.ItemIndex]);
     y:=StrToFloat(Form1.StringGrid1.Cells[23+g*8+3+(i-1)*5,ComboBox1.ItemIndex]);
     k:=x*cos(Ps*pi/180)+y*sin(Ps*pi/180);
     m:=-x*sin(Ps*pi/180)+y*cos(Ps*pi/180);
     n:=sqrt(sqr(r)-sqr(x)-sqr(y));
     b:=arctan((m*cos(Bs*pi/180)+n*sin(Bs*pi/180))/r)*180/pi;
     l:=Ls+arcsin(k/r*cos(b*pi/180))*180/pi;
     StringGrid2.Cells[1,i]:=FloatToStr(Round(l*100)/100);
     StringGrid2.Cells[2,i]:=FloatToStr(Round(b*100)/100);
     end;
end;

initialization
  {$I unit12.lrs}

end.

