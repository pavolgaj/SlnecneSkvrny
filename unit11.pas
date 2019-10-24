unit Unit11; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls,LclIntf, LclType,Menus, ShellAPI;

type

  { TForm11 }

  TForm11 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MainMenu1: TMainMenu;
    MenuItem3: TMenuItem;
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form11: TForm11; 

implementation

{ TForm11 }

procedure TForm11.Label4Click(Sender: TObject);
begin
 ShellExecute(handle, 'open', 'http://www.palkog.ic.cz', nil,nil, sw_show);
 Label4.Font.Color:=clPurple;
end;

procedure TForm11.Label5Click(Sender: TObject);
begin
 ShellExecute(handle, 'open', 'mailto://pavol1gajdos@gmail.com', nil,nil, sw_show);
 Label5.Font.Color:=clPurple;
end;

procedure TForm11.Label7Click(Sender: TObject);
begin
 ShellExecute(handle, 'open', 'http://sourceforge.net/projects/slnecneskvrny/', nil,nil, sw_show);
 Label7.Font.Color:=clPurple;
end;

procedure TForm11.MenuItem3Click(Sender: TObject);
begin
  Form11.Close;
end;

initialization
  {$I unit11.lrs}

end.

