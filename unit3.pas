unit Unit3; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, EditBtn, MaskEdit, Menus, Spin,vypocty;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DateEdit1: TDateEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
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
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form3: TForm3; 

implementation

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
begin
 DateEdit1.Date:=Date;
end;

procedure TForm3.Button2Click(Sender: TObject);
var cas: string;
begin
 cas:=TimeToStr(Time);
 if Length(cas)=7 then cas:='0'+cas;
 MaskEdit1.Text:=cas;
 DateEdit1.Date:=Date;
end;

procedure TForm3.Button3Click(Sender: TObject);
var cas,hod,min,sek,datum: string;
    posun,otocka: integer;
    rozdiel: real;
const jd0=2398140.10155;
begin
 posun:=StrToInt(SpinEdit1.Text);
 if RadioButton2.Checked=true then posun:=posun+1;
 DateTimeToString(datum,'d.M.yyyy',DateEdit1.Date);
 rozdiel:=rozdel(datum,MaskEdit1.Text,posun)-jd0;
 otocka:=trunc(rozdiel/27.2753);
 Edit2.Text:=IntToStr(otocka);
 cas:=MaskEdit1.Text;
 Delete(cas,3,6);
 hod:=cas;
 cas:=MaskEdit1.Text;
 Delete(cas,5,4);
 Delete (cas,1,2);
 min:=cas;
 cas:=MaskEdit1.Text;
 Delete(cas,1,4);
 sek:=cas;
 DateTimeToString(datum,'d.M.yyyy',DateEdit1.Date);
 Label3.Caption:=AnsiToUtf8('Číslo Carringtonovej otočky pre '+datum+' '+hod+':'+min+':'+sek);
end;

procedure TForm3.DateEdit1Change(Sender: TObject);
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

procedure TForm3.FormCreate(Sender: TObject);
begin
 Button2Click(Sender);
 DateEdit1Change(Sender);
 DateSeparator:='.';
end;

procedure TForm3.MenuItem1Click(Sender: TObject);
begin
 Close;
end;

procedure TForm3.MenuItem2Click(Sender: TObject);
begin
 Button3Click(Sender);
end;

initialization
  {$I unit3.lrs}

end.

