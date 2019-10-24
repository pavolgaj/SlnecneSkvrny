unit vypocty;

interface

uses SysUtils,Math;

type zapis=array[1..11] of real;

function JD(r,m,d,h,min,s: integer):real;
function rozdel(datum,cas: string; posun: integer): real;
function PBL(JulDat:real): zapis;

implementation

function JD(r,m,d,h,min,s: integer):real;
var den1,f,g: real;
begin
 den1:=d+(h-12)/24+min/(24*60)+s/(24*3600);
 if m<3 then
   begin
     f := m+12;
     g := r-1;
   end
  else
   begin
     f := m;
     g := r;
   end;
 JD := (den1+trunc((153*f-457)/5)+365*g+trunc(g/4)-trunc(g/100)+trunc(g/400)+1721119);
end;

function rozdel(datum,cas: string; posun: integer): real;
var hod,minuta,sek:string;
    d,m,r,h,min,s,bodka:integer;
begin
 hod:=Copy(cas,1,2);
 Delete(cas,1,2);
 minuta:=Copy(cas,1,2);
 Delete(cas,1,2);
 sek:=cas;
 s:=StrToInt(sek);
 h:=StrToInt(hod)-posun;
 min:=StrToInt(minuta);
 bodka:=AnsiPos('.',datum);
 d:=StrToInt(Copy(datum,1,bodka-1));
 Delete(datum,1,bodka);
 bodka:=AnsiPos('.',datum);
 m:=StrToInt(Copy(datum,1,bodka-1));
 Delete(datum,1,bodka);
 r:=StrToInt(datum);
 rozdel:=JD(r,m,d,h,min,s);
end;

function PBL(JulDat:real): zapis;
var t,tC,th,kks,kkm,G,L1,M,C,v,lam,nL,nI,e,lamS,x,y,eta,th0,P,B,L,thR: real;
    Corr,Corrth: integer;
const i=7.25*pi/180;
begin
 t:=(JulDat-2396758)/365.25;
 tC:=(JulDat-2415020)/36525;
 th:=(JulDat-2398220)*2*pi/25.38;
 kks:=(73.666667+0.01395833*t)*pi/180;
 kkm:=(259.183275-1934.142008*tC+0.002078*sqr(tC))*pi/180;
 G:=0.0000739*SIN((31.8+119*tC)*pi/180)+0.0017778*SIN((231.19+20.2*tC)*pi/180)+0.00052*SIN((57.24+150.27*tC)*pi/180);
 L1:=(279.696678+36000.768925*tC+0.0003025*sqr(tC)+G)*pi/180;
 M:=(358.475833+35999.04975*tC-0.00015*sqr(tC)+G)*pi/180;
 C:=(1.9194603-0.0047889*tC-0.0000144*sqr(tC))*SIN(M)+(0.0200939-0.0001003*tC)*SIN(2*M)+0.0002925*SIN(3*M)+0.000005*SIN(4*M);
 v:=(M*180/pi+C)*pi/180;
 lam:=L1+C*pi/180-0.0056933*(1+0.01671*COS(v));
 nL:=-0.00479*SIN(kkm)-0.00035*SIN(2*M);
 nI:=0.00256*COS(kkm)+0.00015*COS(2*L1);
 lamS:=(lam*180/pi+nL)*pi/180;
 e:=(23.452294-0.0130125*tC-0.0000016*sqr(tC)+nI)*pi/180;
 x:=arctan(-COS(lamS)*tan(e))*180/pi;
 y:=ARCTAN(-COS(lam-kks)*TAN(i))*180/pi;
 if cos(lam-kks)>0 then
    if sin(lam-kks)<0 then Corr:=360
       else Corr:=0
    else Corr:=180;
 eta:=(ARCTAN(TAN(lam-kks))*COS(i))*180/pi+Corr;
 th0:=ARCTAN(TAN(th))*180/pi;
 if cos(th)>0 then
    if sin(th)<0 then Corrth:=360
       else Corrth:=0
    else Corrth:=180;
 thR:=th0+Corrth;
 P:=x+y;
 B:=ARCSIN(SIN(lam-kks)*SIN(i))*180/pi;
 L:=eta-thR-180;
 while L<0 do L:=L+360;
 if kks>0 then while kks>2*pi do kks:=kks-2*pi
    else while kks<0 do kks:=kks+2*pi;
 if kkm>0 then while kkm>2*pi do kkm:=kkm-2*pi
    else while kkm<0 do kkm:=kkm+2*pi;
 if M>0 then while M>2*pi do M:=M-2*pi
    else while M<0 do M:=M+2*pi;
 if v>0 then while v>2*pi do v:=v-2*pi
    else while v<0 do v:=v+2*pi;
 if lamS>0 then while lamS>2*pi do lamS:=lamS-2*pi
    else while lamS<0 do lamS:=lamS+2*pi;
 PBL[1]:=Round(P*100)/100;
 PBL[2]:=Round(B*100)/100;
 PBL[3]:=Round(L*100)/100;
 PBL[4]:=Round(JulDat*100)/100;
 PBL[5]:=Round(kks*180/pi*100)/100;
 PBL[6]:=Round(i*180/pi*100)/100;
 PBL[7]:=Round(kkm*180/pi*100)/100;
 PBL[8]:=Round(M*180/pi*100)/100;
 PBL[9]:=Round(v*180/pi*100)/100;
 PBL[10]:=Round(lamS*180/pi*100)/100;
 PBL[11]:=Round(e*180/pi*100)/100;
end;

end.

