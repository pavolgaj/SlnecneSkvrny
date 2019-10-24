unit Unit13; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, PReport;

type

  { TForm13 }

  TForm13 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    PReport1: TPReport;
    PRImage1: TPRImage;
    PRLabel1: TPRLabel;
    PRLabel10: TPRLabel;
    PRLabel11: TPRLabel;
    PRLabel12: TPRLabel;
    PRLabel13: TPRLabel;
    PRLabel14: TPRLabel;
    PRLabel15: TPRLabel;
    PRLabel16: TPRLabel;
    PRLabel17: TPRLabel;
    PRLabel18: TPRLabel;
    PRLabel19: TPRLabel;
    PRLabel2: TPRLabel;
    PRLabel20: TPRLabel;
    PRLabel21: TPRLabel;
    PRLabel22: TPRLabel;
    PRLabel23: TPRLabel;
    PRLabel24: TPRLabel;
    PRLabel25: TPRLabel;
    PRLabel26: TPRLabel;
    PRLabel27: TPRLabel;
    PRLabel28: TPRLabel;
    PRLabel29: TPRLabel;
    PRLabel3: TPRLabel;
    PRLabel30: TPRLabel;
    PRLabel31: TPRLabel;
    PRLabel32: TPRLabel;
    PRLabel33: TPRLabel;
    PRLabel34: TPRLabel;
    PRLabel35: TPRLabel;
    PRLabel36: TPRLabel;
    PRLabel37: TPRLabel;
    PRLabel38: TPRLabel;
    PRLabel39: TPRLabel;
    PRLabel4: TPRLabel;
    PRLabel40: TPRLabel;
    PRLabel41: TPRLabel;
    PRLabel42: TPRLabel;
    PRLabel43: TPRLabel;
    PRLabel44: TPRLabel;
    PRLabel45: TPRLabel;
    PRLabel46: TPRLabel;
    PRLabel47: TPRLabel;
    PRLabel48: TPRLabel;
    PRLabel49: TPRLabel;
    PRLabel5: TPRLabel;
    PRLabel50: TPRLabel;
    PRLabel51: TPRLabel;
    PRLabel52: TPRLabel;
    PRLabel53: TPRLabel;
    PRLabel54: TPRLabel;
    PRLabel55: TPRLabel;
    PRLabel56: TPRLabel;
    PRLabel57: TPRLabel;
    PRLabel58: TPRLabel;
    PRLabel59: TPRLabel;
    PRLabel6: TPRLabel;
    PRLabel60: TPRLabel;
    PRLabel61: TPRLabel;
    PRLabel62: TPRLabel;
    PRLabel63: TPRLabel;
    PRLabel64: TPRLabel;
    PRLabel65: TPRLabel;
    PRLabel66: TPRLabel;
    PRLabel67: TPRLabel;
    PRLabel68: TPRLabel;
    PRLabel69: TPRLabel;
    PRLabel7: TPRLabel;
    PRLabel8: TPRLabel;
    PRLayoutPanel1: TPRLayoutPanel;
    PRPage1: TPRPage;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure vycisti;
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form13: TForm13; 

implementation

{ TForm13 }

procedure TForm13.Button1Click(Sender: TObject);
begin
  SaveDialog1.Execute;
  PReport1.FileName:=SaveDialog1.FileName;
  PReport1.BeginDoc;
  PReport1.Print(PRPage1);
  PReport1.EndDoc;
end;

procedure TForm13.vycisti;
begin
 Image1.Canvas.Brush.Color:=clWhite;
 Image1.Canvas.Pen.Color:=clBlack;
 Image1.Canvas.FillRect(ClientRect);
 Image1.Canvas.Brush.Color:=clWhite;
 Image1.Canvas.EllipseC(round(Image1.Width/2),round(Image1.Height/2),round(Image1.Width/2)-15,round(Image1.Height/2)-15);
 Image1.Canvas.EllipseC(round(Image1.Width/2),round(Image1.Height/2),round((Image1.Width-30)/4),round((Image1.Height-30)/4));
 Image1.Canvas.Line(15,round(Image1.Height/2),Image1.Width-15,round(Image1.Height/2));
 Image1.Canvas.Line(round(Image1.Width/2),15,round(Image1.Width/2),Image1.Height-15);
end;

initialization
  {$I unit13.lrs}

end.

