unit Unit9; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ComCtrls, ExtCtrls, Grids, StdCtrls, Menus, Buttons,strutils;

type

  { TForm9 }

  TForm9 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    PageControl1: TPageControl;
    PopupMenu1: TPopupMenu;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    StringGrid5: TStringGrid;
    StringGrid6: TStringGrid;
    StringGrid7: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure mesiace(mes: string);
    procedure TabSheet6Show(Sender: TObject);
    procedure TabSheet7Show(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

  var
  Form9: TForm9;
  otvorene: array[1..4] of boolean;


implementation

uses Unit1;

{ TForm9 }

procedure TForm9.FormCreate(Sender: TObject);
var i: integer;
begin
 for i:=1 to 4 do otvorene[i]:=false;
 PageControl1.TabIndex:=0;
 FormResize(Sender);
end;

procedure TForm9.FormResize(Sender: TObject);
begin
  GroupBox1.Left:=round(Form9.Width/2-GroupBox1.Width/2);
  GroupBox1.Top:=round(Form9.Height/2-GroupBox1.Height/2);
  GroupBox2.Left:=round(Form9.Width/2-GroupBox2.Width/2);
  GroupBox2.Top:=round(Form9.Height/2-GroupBox2.Height/2);
  StringGrid2.Height:=Form9.Height-30;
  StringGrid3.Height:=Form9.Height-30;
  StringGrid4.Height:=Form9.Height-30;
  StringGrid5.Height:=Form9.Height-30;
  StringGrid6.Height:=Form9.Height-30;
  StringGrid7.Height:=Form9.Height-30;
  if Form9.Width>735 then
        begin
        StringGrid2.Width:=730;
        StringGrid3.Width:=730;
        StringGrid4.Width:=730;
        StringGrid5.Width:=730;
        StringGrid6.Width:=730;
        end
     else
      begin
      StringGrid2.Width:=Form9.Width-5;
      StringGrid3.Width:=Form9.Width-5;
      StringGrid4.Width:=Form9.Width-5;
      StringGrid5.Width:=Form9.Width-5;
      StringGrid6.Width:=Form9.Width-5;
      end;
  StringGrid7.Width:=Form9.Width-5;
end;

procedure TForm9.MenuItem1Click(Sender: TObject);
begin
  case PageControl1.TabIndex of
       1: begin
          StringGrid2.CopyToClipboard;
          end;
       2: begin
          StringGrid3.CopyToClipboard;
          end;
       3: begin
          StringGrid4.CopyToClipboard;
          end;
       4: begin
          StringGrid5.CopyToClipboard;
          end;
       5: begin
          StringGrid6.CopyToClipboard;
          end;
       6: begin
          StringGrid7.CopyToClipboard;
          end;
  end;
end;

procedure TForm9.MenuItem3Click(Sender: TObject);
begin
  Form9.Close;
end;

procedure TForm9.TabSheet1Show(Sender: TObject);
type skupina=record
     typ: string;
     pocet,penumbry,male: integer;
     x,y:real;
     end;

var i,j,k,g,f,r,fC,gC,rC,p,s,RB,SN,CV,Fp,polomer: integer;
    hodnoty: array[1..10] of string;
    skvrny: array[1..50] of skupina;
    t:string;
procedure typy;
begin
if skvrny[i].typ='Axx' then begin CV:=CV+1; exit; end;
if skvrny[i].typ='Bxo' then begin CV:=CV+2; exit; end;
if skvrny[i].typ='Bxi' then begin CV:=CV+3; exit; end;
if skvrny[i].typ='Hrx' then begin CV:=CV+4; exit; end;
if skvrny[i].typ='Cro' then begin CV:=CV+5; exit; end;
if skvrny[i].typ='Cri' then begin CV:=CV+6; exit; end;
if skvrny[i].typ='Hax' then begin CV:=CV+7; exit; end;
if skvrny[i].typ='Cao' then begin CV:=CV+8; exit; end;
if skvrny[i].typ='Cai' then begin CV:=CV+9; exit; end;
if skvrny[i].typ='Hsx' then begin CV:=CV+10; exit; end;
if skvrny[i].typ='Cso' then begin CV:=CV+11; exit; end;
if skvrny[i].typ='Csi' then begin CV:=CV+12; exit; end;
if skvrny[i].typ='Dro' then begin CV:=CV+13; exit; end;
if skvrny[i].typ='Ero' then begin CV:=CV+14; exit; end;
if skvrny[i].typ='Fro' then begin CV:=CV+15; exit; end;
if skvrny[i].typ='Dri' then begin CV:=CV+16; exit; end;
if skvrny[i].typ='Eri' then begin CV:=CV+17; exit; end;
if skvrny[i].typ='Fri' then begin CV:=CV+18; exit; end;
if skvrny[i].typ='Dao' then begin CV:=CV+19; exit; end;
if skvrny[i].typ='Eao' then begin CV:=CV+20; exit; end;
if skvrny[i].typ='Fao' then begin CV:=CV+21; exit; end;
if skvrny[i].typ='Dai' then begin CV:=CV+22; exit; end;
if skvrny[i].typ='Eai' then begin CV:=CV+23; exit; end;
if skvrny[i].typ='Fai' then begin CV:=CV+24; exit; end;
if skvrny[i].typ='Dso' then begin CV:=CV+25; exit; end;
if skvrny[i].typ='Eso' then begin CV:=CV+26; exit; end;
if skvrny[i].typ='Fso' then begin CV:=CV+27; exit; end;
if skvrny[i].typ='Dsi' then begin CV:=CV+28; exit; end;
if skvrny[i].typ='Esi' then begin CV:=CV+29; exit; end;
if skvrny[i].typ='Fsi' then begin CV:=CV+30; exit; end;
if skvrny[i].typ='Dac' then begin CV:=CV+31; exit; end;
if skvrny[i].typ='Eac' then begin CV:=CV+32; exit; end;
if skvrny[i].typ='Fac' then begin CV:=CV+33; exit; end;
if skvrny[i].typ='Dsc' then begin CV:=CV+34; exit; end;
if skvrny[i].typ='Esc' then begin CV:=CV+35; exit; end;
if skvrny[i].typ='Fsc' then begin CV:=CV+36; exit; end;
if skvrny[i].typ='Hkx' then begin CV:=CV+37; exit; end;
if skvrny[i].typ='Cko' then begin CV:=CV+38; exit; end;
if skvrny[i].typ='Cki' then begin CV:=CV+39; exit; end;
if skvrny[i].typ='Hhx' then begin CV:=CV+40; exit; end;
if skvrny[i].typ='Cho' then begin CV:=CV+41; exit; end;
if skvrny[i].typ='Chi' then begin CV:=CV+42; exit; end;
if skvrny[i].typ='Dko' then begin CV:=CV+43; exit; end;
if skvrny[i].typ='Eko' then begin CV:=CV+44; exit; end;
if skvrny[i].typ='Fko' then begin CV:=CV+45; exit; end;
if skvrny[i].typ='Dki' then begin CV:=CV+46; exit; end;
if skvrny[i].typ='Eki' then begin CV:=CV+47; exit; end;
if skvrny[i].typ='Fki' then begin CV:=CV+48; exit; end;
if skvrny[i].typ='Dho' then begin CV:=CV+49; exit; end;
if skvrny[i].typ='Eho' then begin CV:=CV+50; exit; end;
if skvrny[i].typ='Fho' then begin CV:=CV+51; exit; end;
if skvrny[i].typ='Dhi' then begin CV:=CV+52; exit; end;
if skvrny[i].typ='Ehi' then begin CV:=CV+53; exit; end;
if skvrny[i].typ='Fhi' then begin CV:=CV+54; exit; end;
if skvrny[i].typ='Dkc' then begin CV:=CV+55; exit; end;
if skvrny[i].typ='Ekc' then begin CV:=CV+56; exit; end;
if skvrny[i].typ='Fkc' then begin CV:=CV+57; exit; end;
if skvrny[i].typ='Dhc' then begin CV:=CV+58; exit; end;
if skvrny[i].typ='Ehc' then begin CV:=CV+59; exit; end;
if skvrny[i].typ='Fhc' then begin CV:=CV+60; exit; end;
end;

begin
TabSheet7.Visible:=false;
TabSheet7.TabVisible:=false;
PageControl1.TabIndex:=1;
if not otvorene[1] then begin
 otvorene[1]:=true;
 for i:=2 to 4 do otvorene[i]:=false;
 if not (Form1.StringGrid1.Cells[0,0]='') then  StringGrid2.RowCount:=Form1.StringGrid1.RowCount+1
    else StringGrid2.RowCount:=1;
 for k:=1 to StringGrid2.RowCount-1 do
      begin
      polomer:=StrToInt(Form1.StringGrid1.Cells[16,k-1]);
      StringGrid2.Cells[0,k]:=Form1.StringGrid1.Cells[1,k-1];
       g:=StrToInt(Form1.StringGrid1.Cells[22,k-1]);
       f:=0;
       p:=0;
       s:=0;
       fC:=0;
       gC:=0;
       CV:=0;
       RB:=0;
       for i:=1 to g do
           begin
           for j:=1 to 8 do
               begin
               t:=Form1.StringGrid1.Cells[22+j+(i-1)*8,k-1];
               case j of
                    1: skvrny[i].typ:=t;
                    2: skvrny[i].pocet:=StrToInt(t);
                    3: skvrny[i].penumbry:=StrToInt(t);
                    4: skvrny[i].x:=StrToFloat(t);
                    5: skvrny[i].y:=StrToFloat(t);
                    7: skvrny[i].male:=StrToInt(t);
                    end;
               end;
           typy;
           if sqrt(sqr(skvrny[i].x)+sqr(skvrny[i].y))<polomer/2 then
              begin
              inc(gC);
              fC:=fC+skvrny[i].pocet;
              end;
           f:=f+skvrny[i].pocet;
           p:=p+skvrny[i].penumbry;
           s:=s+skvrny[i].male;
           t:=skvrny[i].typ;
           Delete(t,2,2);
           if (t='A') or (t='B') then j:=4
              else if t='C' then j:=8
                   else if t='D' then j:=18
                        else if t='E' then j:=25
                             else if t='F' then j:=36
                                  else if t='H' then j:=44;
           RB:=RB+j*skvrny[i].pocet;
           end;
       SN:=10*p+s;
       r:=10*g+f;
       rC:=10*gC+fC;
       Fp:=StrToInt(Form1.StringGrid1.Cells[23+8*g,k-1]);
       StringGrid2.Cells[1,k]:=IntToStr(g);
       StringGrid2.Cells[2,k]:=IntToStr(f);
       StringGrid2.Cells[3,k]:=IntToStr(r);
       StringGrid2.Cells[4,k]:=IntToStr(gC);
       StringGrid2.Cells[5,k]:=IntToStr(fC);
       StringGrid2.Cells[6,k]:=IntToStr(rC);
       StringGrid2.Cells[7,k]:=IntToStr(CV);
       StringGrid2.Cells[8,k]:=IntToStr(SN);
       StringGrid2.Cells[9,k]:=IntToStr(RB);
       StringGrid2.Cells[10,k]:=IntToStr(Fp);
      end;
  end;
end;

procedure TForm9.TabSheet2Show(Sender: TObject);
var mes: string;
begin
  TabSheet7.Visible:=false;
  TabSheet7.TabVisible:=false;
  if not otvorene[1] then
     begin
     TabSheet1Show(Sender);
     PageControl1.TabIndex:=2;
     end
   else
     begin
     StringGrid3.RowCount:=1;
     mes:=InputBox('Mesačný prehľad','Zadajte mesiac, ktorý chcete zobraziť (v tvare m.rrrr)','');
     if MidStr(mes,1,1)='0' then Delete(mes,1,1);
     mesiace(mes);
     if (StringGrid3.RowCount=1) and (mes<>'') then
        begin
        ShowMessage('Zvolený mesiac sa nenašiel');
        TabSheet2Show(Sender);
        end;
     end;
end;

procedure TForm9.mesiace(mes: string);
var i: integer;
begin
 for i:=1 to StringGrid2.RowCount-1 do
      begin
      if Pos(mes,StringGrid2.Cells[0,i])>0 then
         begin
         StringGrid3.RowCount:=StringGrid3.RowCount+1;
         StringGrid3.Rows[StringGrid3.RowCount-1]:=StringGrid2.Rows[i];
         end
        else if StringGrid3.RowCount>1 then exit;
      end;
end;

procedure TForm9.TabSheet6Show(Sender: TObject);
var min,max,i,j,k:integer;
    poz,rok: string;
begin
TabSheet7.Visible:=false;
TabSheet7.TabVisible:=false;
if not otvorene[1] then TabSheet1Show(Sender);
PageControl1.TabIndex:=6;
 if not otvorene[4] then
 begin
  otvorene[4]:=true;
  StringGrid7.ColCount:=1;
  StringGrid7.ColCount:=3;
  StringGrid7.RowCount:=1;
  StringGrid7.RowCount:=3;
  if StringGrid2.RowCount>1 then
  begin
  min:=StrToInt(MidStr(StringGrid2.Cells[0,1],Length(StringGrid2.Cells[0,1])-3,4));
  max:=StrToInt(MidStr(StringGrid2.Cells[0,StringGrid2.RowCount-1],Length(StringGrid2.Cells[0,StringGrid2.RowCount-1])-3,4));
  for i:=min to max do
      begin
      StringGrid7.ColCount:=StringGrid7.ColCount+1;
      StringGrid7.Cells[StringGrid7.ColCount-3,0]:=IntToStr(i);
      end;
  for i:=0 to Form1.StringGrid1.RowCount-1 do
      begin
      rok:=MidStr(Form1.StringGrid1.Cells[1,i],Length(Form1.StringGrid1.Cells[1,i])-3,4);
      poz:=Form1.StringGrid1.Cells[8,i];
      for j:=1 to StringGrid7.ColCount-3 do if rok=StringGrid7.Cells[j,0] then break;
      for k:=1 to StringGrid7.RowCount-2 do if poz=StringGrid7.Cells[0,k] then break;
      if (k=StringGrid7.RowCount-2) and (not (poz=StringGrid7.Cells[0,k])) then
         begin
         StringGrid7.RowCount:=StringGrid7.RowCount+1;
         StringGrid7.Cells[0,k]:=poz;
         end;
      if StringGrid7.Cells[j,k]='' then StringGrid7.Cells[j,k]:='1'
         else StringGrid7.Cells[j,k]:=IntToStr(StrToInt(StringGrid7.Cells[j,k])+1);
      end;
  StringGrid7.Cells[StringGrid7.ColCount-1,StringGrid7.RowCount-1]:='0';
  for j:=1 to StringGrid7.RowCount-3 do StringGrid7.Cells[StringGrid7.ColCount-1,j]:='0';
  for i:=1 to StringGrid7.ColCount-3 do
      begin
      StringGrid7.Cells[i,StringGrid7.RowCount-1]:='0';
      for j:=1 to StringGrid7.RowCount-3 do
          begin
          if StringGrid7.Cells[i,j]='' then StringGrid7.Cells[i,j]:='0';
          StringGrid7.Cells[i,StringGrid7.RowCount-1]:=IntToStr(StrToInt(StringGrid7.Cells[i,StringGrid7.RowCount-1])+StrToInt(StringGrid7.Cells[i,j]));
          StringGrid7.Cells[StringGrid7.ColCount-1,j]:=IntToStr(StrToInt(StringGrid7.Cells[StringGrid7.ColCount-1,j])+StrToInt(StringGrid7.Cells[i,j]));
          StringGrid7.Cells[StringGrid7.ColCount-1,StringGrid7.RowCount-1]:=IntToStr(StrToInt(StringGrid7.Cells[StringGrid7.ColCount-1,StringGrid7.RowCount-1])+StrToInt(StringGrid7.Cells[i,j]));
          end;
      end;
  StringGrid7.Cells[StringGrid7.ColCount-2,0]:='';
  StringGrid7.Cells[StringGrid7.ColCount-1,0]:='Spolu';
  StringGrid7.Cells[0,StringGrid7.RowCount-2]:='';
  StringGrid7.Cells[0,StringGrid7.RowCount-1]:='Spolu';
 end;
 end;
end;

procedure TForm9.TabSheet7Show(Sender: TObject);
var i: integer;
begin
 for i:=1 to 4 do otvorene[i]:=false;
end;

procedure TForm9.TabSheet3Show(Sender: TObject);
var rok: string;
    i: integer;
begin
  TabSheet7.Visible:=false;
  TabSheet7.TabVisible:=false;
  if not otvorene[1] then
     begin
     TabSheet1Show(Sender);
     PageControl1.TabIndex:=3;
     end
   else
     begin
     StringGrid4.RowCount:=1;
     rok:=InputBox('Ročný prehľad','Zadajte rok, ktorý chcete zobraziť','');
     for i:=1 to StringGrid2.RowCount-1 do
         begin
         if Pos(rok,StringGrid2.Cells[0,i])>0 then
            begin
            StringGrid4.RowCount:=StringGrid4.RowCount+1;
            StringGrid4.Rows[StringGrid4.RowCount-1]:=StringGrid2.Rows[i];
            end
           else if StringGrid4.RowCount>1 then exit;
         end;
     if (StringGrid4.RowCount=1) and (rok<>'') then
        begin
        ShowMessage('Zvolený rok sa nenašiel');
        TabSheet3Show(Sender);
        end;
     end;
end;

procedure TForm9.TabSheet4Show(Sender: TObject);
var i,j,bodka,rok0,mesiac0,rok,mesiac: integer;
    mes: string;
    udaje: array[1..11] of integer;
begin
TabSheet7.Visible:=false;
TabSheet7.TabVisible:=false;
if not otvorene[1] then TabSheet1Show(Sender);
PageControl1.TabIndex:=4;
 if not otvorene[2] then
  begin
  otvorene[2]:=true;
  StringGrid5.RowCount:=1;
  for i:=1 to StringGrid2.RowCount-1 do
      begin
      mes:=StringGrid2.Cells[0,i];
      bodka:=AnsiPos('.',mes);
      Delete(mes,1,bodka);
      if mes=StringGrid5.Cells[0,StringGrid5.RowCount-1] then
         begin
         for j:=1 to 10 do udaje[j]+=StrToInt(StringGrid2.Cells[j,i]);
         inc(udaje[11]);
         end
        else
         begin
         if StringGrid5.RowCount>1 then for j:=1 to 10 do StringGrid5.Cells[j,StringGrid5.RowCount-1]:=FloatToStr(round(udaje[j]/udaje[11]*100)/100);
         bodka:=AnsiPos('.',mes);
         mesiac:=StrToInt(MidStr(mes,1,bodka-1));
         rok:=StrToInt(MidStr(mes,bodka+1,Length(mes)-bodka));
         if StringGrid5.RowCount>1 then
            while not (rok*12+mesiac=rok0*12+mesiac0+1) do
               begin
               if mesiac0<12 then inc(mesiac0)
                  else
                    begin
                    mesiac0:=1;
                    inc(rok0);
                    end;
               StringGrid5.RowCount:=StringGrid5.RowCount+1;
               StringGrid5.Cells[0,StringGrid5.RowCount-1]:=IntToStr(mesiac0)+'.'+IntToStr(rok0);
               end;
         StringGrid5.RowCount:=StringGrid5.RowCount+1;
         mesiac0:=mesiac;
         rok0:=rok;
         StringGrid5.Cells[0,StringGrid5.RowCount-1]:=mes;
         for j:=1 to 10 do udaje[j]:=StrToInt(StringGrid2.Cells[j,i]);
         udaje[11]:=1;
         end;
      end;
  if StringGrid5.RowCount>1 then for j:=1 to 10 do StringGrid5.Cells[j,StringGrid5.RowCount-1]:=FloatToStr(round(udaje[j]/udaje[11]*100)/100);
  end;
end;

procedure TForm9.TabSheet5Show(Sender: TObject);
var i,j,k:integer;
    udaje: array[1..10] of real;
begin
TabSheet7.Visible:=false;
TabSheet7.TabVisible:=false;
if not otvorene[1] then TabSheet1Show(Sender);
PageControl1.TabIndex:=5;
if not otvorene[3] then
 begin
 otvorene[3]:=true;
 if not otvorene[2] then TabSheet4Show(Sender);
 PageControl1.TabIndex:=5;
 StringGrid6.RowCount:=1;
 StringGrid6.RowCount:=StringGrid5.RowCount;
 StringGrid6.Cols[0]:=StringGrid5.Cols[0];
 for i:=7 to StringGrid6.RowCount-6 do
     begin
     for j:=1 to 10 do udaje[j]:=0;
     for k:=i-6 to i+5 do if not (StringGrid5.Cells[1,k]='') then for j:=1 to 10 do udaje[j]+=StrToFloat(StringGrid5.Cells[j,k]);
     for j:=1 to 10 do StringGrid6.Cells[j,i]:=FloatToStr(round(udaje[j]/12*100)/100);
     end;
 end;
end;


initialization
  {$I unit9.lrs}

end.

