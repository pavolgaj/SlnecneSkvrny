unit Unit4;

{$mode objfpc}{$H+}


interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, EditBtn, MaskEdit, Menus, ExtCtrls, Spin,vypocty;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DateEdit1: TDateEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
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
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SpinEdit1: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure ine(pomocne: zapis);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form4: TForm4;
  showed: boolean=false;

implementation

{ TForm4 }


procedure TForm4.Button1Click(Sender: TObject);
begin
  DateEdit1.Date:=Date;
end;

procedure TForm4.Button2Click(Sender: TObject);
var cas: string;
begin
 cas:=TimeToStr(Time);
 if Length(cas)=7 then cas:='0'+cas;
 MaskEdit1.Text:=cas;
 DateEdit1.Date:=Date;
end;

procedure TForm4.Button3Click(Sender: TObject);
var posun: integer;
    PBL1: zapis;
    datum: string;
begin
 posun:=StrToInt(SpinEdit1.Text);
 if RadioButton2.Checked=true then posun:=posun+1;
 DateTimeToString(datum,'d.M.yyyy',DateEdit1.Date);
 PBL1:=PBL(rozdel(datum,MaskEdit1.Text,posun));
 Edit3.Text:=FloatToStr(PBL1[1]);
 Edit4.Text:=FloatToStr(PBL1[2]);
 Edit5.Text:=FloatToStr(PBL1[3]);
 ine(PBL1);
end;

procedure TForm4.ine(pomocne: zapis);
var i: integer;
    popis: string;
begin
 Memo1.clear;
 for i:=1 to 7 do
     begin
     case i of
          1: popis:=AnsiToUtf8('Juliánsky dátum: ');
          2: popis:=AnsiToUtf8('Dĺžka vzostupného uzla sl. rovníka: ');
          3: popis:=AnsiToUtf8('Sklon sl. rovníka k ekliptike: ');
          4: popis:=AnsiToUtf8('Dĺžka vzostupného uzla Mesiaca: ');
          5: popis:=AnsiToUtf8('Stredná anomália: ');
          6: popis:=AnsiToUtf8('Pravá anomália: ');
          7: popis:=AnsiToUtf8('Dĺžka Slnka s nutáciou: ');
        end;
     Memo1.Lines.Add(popis+FloatToStr(pomocne[i+3]));
     Memo1.Lines.Add('');
     end;
 Memo1.Lines.Add(AnsiToUtf8('Sklon ekliptiky: '+FloatToStr(pomocne[11])));
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
 if showed=true then
       begin
       showed:=false;
       Memo1.Visible:=false;
       Form4.Width:=375;
       Button4.Caption:=AnsiToUtf8('Zobraziť pomocné veličiny');
       end
    else
       begin
       showed:=true;
       Memo1.Visible:=true;
       Form4.Width:=619;
       Button4.Caption:=AnsiToUtf8('Skryť pomocné veličiny');
       end;
end;


procedure TForm4.DateEdit1Change(Sender: TObject);
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

procedure TForm4.FormCreate(Sender: TObject);
begin
 Button2Click(Sender);
 DateEdit1Change(Sender);
 DateSeparator:='.';
end;

procedure TForm4.MenuItem1Click(Sender: TObject);
begin
 Close;
end;

procedure TForm4.MenuItem2Click(Sender: TObject);
begin
 Button3Click(Sender);
end;

initialization
  {$I unit4.lrs}

end.

