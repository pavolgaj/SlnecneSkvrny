unit Unit6; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, EditBtn, Menus,Unit5;

type

  { TForm6 }

  TForm6 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox3: TComboBox;
    Edit3: TEdit;
    FileNameEdit1: TFileNameEdit;
    Label5: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form6: TForm6; 

implementation

{ TForm6 }

procedure TForm6.ComboBox3Change(Sender: TObject);
begin
  if ComboBox3.ItemIndex=0 then
     begin
     FileNameEdit1.Visible:=false;
     Edit3.Visible:=true;
     end
  else
     begin
     FileNameEdit1.Visible:=true;
     Edit3.Visible:=false;
     end;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
 ComboBox3.ItemIndex:=Form5.ComboBox3.ItemIndex;
 if Form5.ComboBox3.ItemIndex=0 then Edit3.Text:=Form5.Edit3.Text
    else FileNameEdit1.FileName:=Form5.FileNameEdit1.FileName;
 ComboBox3Change(Sender);
end;

procedure TForm6.MenuItem1Click(Sender: TObject);
begin
 Button1Click(Sender);
end;

procedure TForm6.MenuItem2Click(Sender: TObject);
begin
 Button2Click(Sender);
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  Form5.ComboBox3.ItemIndex:=ComboBox3.ItemIndex;
  if ComboBox3.ItemIndex=0 then Form5.Edit3.Text:=Edit3.Text
    else Form5.FileNameEdit1.FileName:=FileNameEdit1.FileName;
  Form5.ComboBox3Change(Sender);
  Form5.Button1Click(Sender);
  if odp=mrYes then close;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  close;
end;

initialization
  {$I unit6.lrs}

end.

