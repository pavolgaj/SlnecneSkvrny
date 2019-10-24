unit Unit2;

{$mode objfpc}{$H+}


interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, MaskEdit, EditBtn, Spin, Menus,vypocty;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DateEdit1: TDateEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MainMenu1: TMainMenu;
    MaskEdit1: TMaskEdit;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SpinEdit1: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form2: TForm2;

implementation

{ TForm2 }

procedure TForm2.MenuItem1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.MenuItem2Click(Sender: TObject);
begin
  Button3Click(Sender);
end;

procedure TForm2.DateEdit1Change(Sender: TObject);
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

procedure TForm2.FormShow(Sender: TObject);
begin
 Button2Click(Sender);
 DateEdit1Change(Sender);
 DateSeparator:='.';
end;


procedure TForm2.Button1Click(Sender: TObject);
begin
  DateEdit1.Date:=Date;
end;

procedure TForm2.Button2Click(Sender: TObject);
var cas: string;
begin
 cas:=TimeToStr(Time);
 if Length(cas)=7 then cas:='0'+cas;
 MaskEdit1.Text:=cas;
 DateEdit1.Date:=Date;
end;

procedure TForm2.Button3Click(Sender: TObject);
var posun: integer;
    datum:string;
begin
 posun:=StrToInt(SpinEdit1.Text);
 if RadioButton2.Checked=true then posun:=posun+1;
 DateTimeToString(datum,'d.M.yyyy',DateEdit1.Date);
 Edit3.Text:=FloatToStr(rozdel(datum,MaskEdit1.Text,posun));
end;


initialization
  {$I unit2.lrs}

end.

