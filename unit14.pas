unit Unit14; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Menus;

type

  { TForm14 }

  TForm14 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox1SelectionChange(Sender: TObject; User: boolean);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form14: TForm14;
  vyber:integer=0;

implementation

{ TForm14 }

procedure TForm14.ListBox1SelectionChange(Sender: TObject; User: boolean);
begin
  case ListBox1.SelCount of
     1: Label2.Caption:='1 záznam?';
     2,3,4: Label2.Caption:=IntToStr(ListBox1.SelCount)+' záznamy?';
     else Label2.Caption:=IntToStr(ListBox1.SelCount)+' záznamov?';
  end;
end;

procedure TForm14.Button1Click(Sender: TObject);
begin
  vyber:=ListBox1.SelCount;
  close;
end;

procedure TForm14.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm14.FormShow(Sender: TObject);
begin
 Label2.Caption:='0 záznamov?';
 vyber:=0;
 ListBox1.ClearSelection;
end;

initialization
  {$I unit14.lrs}

end.

