unit Unit5; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Grids, ExtCtrls, EditBtn,LCLType, Menus;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit3: TEdit;
    FileNameEdit1: TFileNameEdit;
    FileNameEdit2: TFileNameEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure StringGrid1EditingDone(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form5: TForm5;
  odp: byte;

implementation

uses Unit1;

{ TForm5 }

procedure TForm5.Button2Click(Sender: TObject);
//zrusit
begin
  FormShow(Sender);
  close;
end;

procedure TForm5.Button3Click(Sender: TObject);
//pridat pozorovatela
begin
  StringGrid1.RowCount:=StringGrid1.RowCount+1;
  if StringGrid1.RowCount>5 then StringGrid1.Width:=704;
end;

procedure TForm5.Button4Click(Sender: TObject);
//odstranit pozorovatela
var i,j: integer;
begin
  for i:=ComboBox2.ItemIndex+1 to StringGrid1.RowCount-2 do
      for j:=0 to StringGrid1.ColCount-1 do StringGrid1.Cells[j,i]:=StringGrid1.Cells[j,i+1];
  StringGrid1.RowCount:=StringGrid1.RowCount-1;
  ComboBox2.Items.Clear;
  for i:=1 to StringGrid1.RowCount-1 do ComboBox2.Items.Add(StringGrid1.Cells[0,i]);
  ComboBox2.ItemIndex:=0;
  if StringGrid1.RowCount<6 then StringGrid1.Width:=688;
end;

procedure TForm5.Button5Click(Sender: TObject);
//import nastaveni
var i,j,a: integer;
    f: TextFile;
    t: string;
    nastav: boolean;
begin
 OpenDialog1.Execute;
 if FileExists(OpenDialog1.FileName) then
 begin
 AssignFile(f,OpenDialog1.FileName);
 Reset(f);
 readln(f,t);
 if t='Export nastaveni z programu Slnecne skvrny' then
 begin
 readln(f,t);
 if t='nastavenia 1.0' then nastav:=true
    else nastav:=false;
 readln(f,t);
 ComboBox3.ItemIndex:=StrToInt(t);
 readln(f,t);
 if ComboBox3.ItemIndex=0 then Edit3.Text:=t
    else FileNameEdit1.FileName:=t;
 readln(f,t);
 ComboBox1.ItemIndex:=StrToInt(t);
 if nastav then
    begin
    readln(f,t);
    if StrToInt(t)=1 then CheckBox1.Checked:=true
       else CheckBox1.Checked:=false;
    CheckBox1Change(Sender);
    readln(f,t);
    FileNameEdit2.FileName:=t;
    end
 else CheckBox1.Checked:=false;
 StringGrid1.RowCount:=1;
 i:=0;
 while not eof(f) do
       begin
       StringGrid1.RowCount:=StringGrid1.RowCount+1;
       inc(i);
       readln(f,t);
       j:=0;
       repeat
          a:=AnsiPos(';',t);
          StringGrid1.Cells[j,i]:=Copy(t,1,a-1);
          delete(t,1,a);
          inc(j);
       until t='';
       end;
 CloseFile(f);
 ComboBox3Change(Sender);
 ComboBox2.Clear;
 for i:=1 to StringGrid1.RowCount-1 do ComboBox2.Items.Add(StringGrid1.Cells[0,i]);
 ComboBox2.ItemIndex:=0;
 if StringGrid1.RowCount>5 then StringGrid1.Width:=704 else StringGrid1.Width:=688;
 FileSetAttr('nastavenia.config',not faAnyFile);
 AssignFile(f,'nastavenia.config');
 Rewrite(f);
 writeln(f,'nastavenia 1.0');
 writeln(f,ComboBox3.ItemIndex);
 if ComboBox3.ItemIndex=0 then writeln(f,Edit3.Text)
     else writeLn(f,FileNameEdit1.FileName);
 write(f,ComboBox1.ItemIndex);
 writeln(f);
 if CheckBox1.Checked then writeln(f,'1')
     else writeln(f,'0');
 write(f,FileNameEdit2.FileName);
 for i:=1 to StringGrid1.RowCount-1 do
      begin
      writeln(f);
      for j:=0 to StringGrid1.ColCount-1 do write(f,StringGrid1.Cells[j,i]+';');
      end;
 CloseFile(f);
 FileSetAttr('nastavenia.config',faHidden or faSysFile);
 end;
  end;
end;

procedure TForm5.Button6Click(Sender: TObject);
//export nastaveni
var i,j: integer;
    f: TextFile;
begin
  SaveDialog1.Execute;
if not (SaveDialog1.FileName='') then
  begin
     if pos('.',SaveDialog1.FileName)=0 then
        begin
         if SaveDialog1.FilterIndex=2 then SaveDialog1.FileName:=SaveDialog1.FileName+'.config'
            else SaveDialog1.FileName:=SaveDialog1.FileName+'.txt';
        end;
  FileSetAttr(SaveDialog1.FileName,not faAnyFile);
  AssignFile(f,SaveDialog1.FileName);
  Rewrite(f);
  writeln(f,'Export nastaveni z programu Slnecne skvrny');
  writeln(f,'nastavenia 1.0');
  writeln(f,ComboBox3.ItemIndex);
  if ComboBox3.ItemIndex=0 then writeln(f,Edit3.Text)
     else writeLn(f,FileNameEdit1.FileName);
  write(f,ComboBox1.ItemIndex);
  writeln(f);
  if CheckBox1.Checked then writeln(f,'1')
     else writeln(f,'0');
  write(f,FileNameEdit2.FileName);
  for i:=1 to StringGrid1.RowCount-1 do
      begin
      writeln(f);
      for j:=0 to StringGrid1.ColCount-1 do write(f,StringGrid1.Cells[j,i]+';');
      end;
  CloseFile(f);
  FileSetAttr(SaveDialog1.FileName,faReadOnly);
  end;
end;

procedure TForm5.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.Checked then FileNameEdit2.Enabled:=true
     else FileNameEdit2.Enabled:=false;
end;

procedure TForm5.ComboBox3Change(Sender: TObject);
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

procedure TForm5.FormShow(Sender: TObject);
//nacitanie nastaveni
var i,j,a: integer;
    f: TextFile;
    t: string;
begin
  if FileExists('nastavenia.config') then begin
     AssignFile(f,'nastavenia.config');
     Reset(f);
     readln(f,t);
     odp:=1;
     if (t='nastavenia 1.0') then
     begin
     readln(f,t);
     ComboBox3.ItemIndex:=StrToInt(t);
     readln(f,t);
     if ComboBox3.ItemIndex=0 then Edit3.Text:=t
        else FileNameEdit1.FileName:=t;
     readln(f,t);
     ComboBox1.ItemIndex:=StrToInt(t);
     readln(f,t);
     if StrToInt(t)=1 then CheckBox1.Checked:=true
        else CheckBox1.Checked:=false;
     CheckBox1Change(Sender);
     readln(f,t);
     FileNameEdit2.FileName:=t;
     StringGrid1.RowCount:=1;
     i:=0;
     while not eof(f) do
          begin
          StringGrid1.RowCount:=StringGrid1.RowCount+1;
          inc(i);
          readln(f,t);
          j:=0;
          repeat
                a:=AnsiPos(';',t);
                StringGrid1.Cells[j,i]:=Copy(t,1,a-1);
                delete(t,1,a);
                inc(j);
          until t='';
          end;
     CloseFile(f);
     ComboBox2.Clear;
     for i:=1 to StringGrid1.RowCount-1 do ComboBox2.Items.Add(StringGrid1.Cells[0,i]);
     ComboBox2.ItemIndex:=0;
     if StringGrid1.RowCount>5 then StringGrid1.Width:=704 else StringGrid1.Width:=688;
     Form1.ToolButton4.Enabled:=true;
     form1.MenuItem19.Enabled:=true;
     end
    else
      begin
      MessageDlg('Slnečné škvrny','Používate staršiu verziu nastavení! Použite program "konvert.exe" na konvertovanie na nový formát, pred jeho použitím zavrite program Slnečné škvrny.',mtError,[mbOK],0);
      odp:=0;
      Form1.ToolButton4.Enabled:=false;
      form1.MenuItem19.Enabled:=false;
      exit;
      end;
     end
  else
     begin
     StringGrid1.RowCount:=2;
     ComboBox2.Clear;
     ComboBox2.ItemIndex:=0;
     end;
  ComboBox3Change(Sender);
end;

procedure TForm5.MenuItem1Click(Sender: TObject);
begin
 Button1Click(Sender);
end;

procedure TForm5.MenuItem2Click(Sender: TObject);
begin
 Button2Click(Sender);
end;

procedure TForm5.StringGrid1EditingDone(Sender: TObject);
var i: integer;
begin
  ComboBox2.Items.Clear;
  for i:=1 to StringGrid1.RowCount-1 do ComboBox2.Items.Add(StringGrid1.Cells[0,i]);
end;


procedure TForm5.Button1Click(Sender: TObject);
//ulozenie nastaveni
var i,j: integer;
    f: TextFile;
begin
if DirectoryIsWritable(GetCurrentDir) then
  begin
  FileSetAttr('nastavenia.config',not faAnyFile);
  AssignFile(f,'nastavenia.config');
  Rewrite(f);
  writeln(f,'nastavenia 1.0');
  writeln(f,ComboBox3.ItemIndex);
  if ComboBox3.ItemIndex=0 then writeln(f,Edit3.Text)
     else writeLn(f,FileNameEdit1.FileName);
  write(f,ComboBox1.ItemIndex);
  writeln(f);
  if CheckBox1.Checked then writeln(f,'1')
     else writeln(f,'0');
  write(f,FileNameEdit2.FileName);
  for i:=1 to StringGrid1.RowCount-1 do
      begin
      writeln(f);
      for j:=0 to StringGrid1.ColCount-1 do write(f,StringGrid1.Cells[j,i]+';');
      end;
  CloseFile(f);
  FileSetAttr('nastavenia.config',faHidden or faSysFile or faReadOnly);
  end;
  if ComboBox3.ItemIndex=0 then begin
       if not FileExists(Edit3.Text) then
          begin
          odp:=MessageDlg('Slnečné škvrny','Prednastavený súbor dát nenájdený!'+#13#13+'                  Naozaj zavrieť?',mtWarning, mbYesNo,0);
          if odp=mrYes then close;
          end
         else
           begin
           if (data<>Edit3.Text) and (Form1.StringGrid1.Cells[0,0]='') then
              begin
              if MessageDlg('Slnečné škvrny','Načítať dáta z prednastaveného súboru?',mtInformation,mbYesNo,0)=mrYes then
                 begin
                 data:=Edit3.Text;
                 Form1.otvaranie(Sender);
                 end;
              end;
           close;
           end;
       end
    else if not FileExists(FileNameEdit1.FileName) then
         begin
         odp:=MessageDlg('Slnečné škvrny','Prednastavený súbor dát nenájdený!'+#13#13+'                  Naozaj zavrieť?',mtWarning, mbYesNo,0);
         if odp=mrYes then close;
         end
       else
         begin
         if (data<>FileNameEdit1.FileName) and (Form1.StringGrid1.Cells[0,0]='') then
              begin
              if MessageDlg('Slnečné škvrny','Načítať dáta z prednastaveného súboru?',mtInformation,mbYesNo,0)=mrYes then
                 begin
                 data:=FileNameEdit1.FileName;
                 Form1.otvaranie(Sender);
                 end;
              end;
         close;
         end;
end;

initialization
  {$I unit5.lrs}

end.

