unit Unit8; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Menus;

type

  { TForm8 }

  TForm8 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox1SelectionChange(Sender: TObject; User: boolean);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form8: TForm8;
  zmazat: boolean=false;

implementation

{ TForm8 }

procedure TForm8.ListBox1SelectionChange(Sender: TObject; User: boolean);
begin
  case ListBox1.SelCount of
     1: Label2.Caption:='1 záznam?';
     2,3,4: Label2.Caption:=IntToStr(ListBox1.SelCount)+' záznamy?';
     else Label2.Caption:=IntToStr(ListBox1.SelCount)+' záznamov?';
  end;
end;

procedure TForm8.MenuItem1Click(Sender: TObject);
begin
 Button1Click(Sender);
end;

procedure TForm8.MenuItem2Click(Sender: TObject);
begin
 Button2Click(Sender);
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
  zmazat:=true;
  close;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
zmazat:=false;
close;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
 Label2.Caption:='0 záznamov?';
 ListBox1.ClearSelection;
end;

initialization
  {$I unit8.lrs}

end.

