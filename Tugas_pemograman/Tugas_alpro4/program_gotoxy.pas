program tabel;
{i.s: }
{f.s: }

uses crt;
const 
    makkos=10;
type
    larik1=array[1..makkos]of string;
    larik2=array[1..makkos]of longint;
    larik3=array[1..makkos]of longint;
var
    nim,nama,keterangan :larik1;
    uang                :larik2;
    kembalian           :larik3;
    n,listrik           :longint;
    per_orang           :longint;

procedure jumlah_data(var n:longint; var listrik:longint);
{i.s:}
{f.s:}

{var}

{algoritma}
begin
    gotoxy(19,4); writeln('-------------------------------');
    gotoxy(20,5); write('Banyaknya Data Anak kos : '); readln(n);
    while(n<1)or(n>makkos)do
    begin    
        gotoxy(20,6); write('Banyaknya data hanya antara 1-10'); readln;
        gotoxy(20,6); clreol;
        gotoxy(46,5); clreol;
        readln(n);
    end;
    gotoxy(20,6); write('biaya listrik bulan ini : '); readln(listrik);
    gotoxy(19,7); write('-------------------------------'); 
    per_orang:= listrik;
    gotoxy(20,8); write('Biaya per-orang nya     : ',per_orang/n:2:2);
    readln;
end;

function ket(kembalian:longint):string;
{i.s:}
{f.s:}

{var}

{algoritma}
begin
    if(kembalian>0)
     then
      ket:='Lunas';
end;
        




procedure tampildata(n,listrik:longint);
{i.s:}
{f.s:}

var
{prototype : }
i:longint;

begin
    clrscr;
    gotoxy(50,2); 
    writeln('Daftar kembalian Anak kos Pegasus');
    gotoxy(31,3); 
    writeln('----------------------------------------------------------------------');
    gotoxy(31,4);
    writeln('|NO|  NIM  |     NAMA ANAK KOS     |  Uang  | Kembalian | Keterangan |');
    gotoxy(31,5); 
    writeln('----------------------------------------------------------------------');
    
    for i := 1 to n do
    begin
        gotoxy(31,i+5);
         write('|  |       |                       |        |           |            |');
        gotoxy(32,i+5); write(i);
        gotoxy(36,i+5); readln(nim[i]);
        gotoxy(45,i+5); readln(nama[i]);
        gotoxy(68,i+5); readln(uang[i]);
        
        kembalian[i]:= uang[i];
        gotoxy(78,i+5); writeln(kembalian[i]-per_orang/n:2:2);
        keterangan[i]:= ket(kembalian[i]);
        gotoxy(91,i+5); writeln(Keterangan[i]);
        gotoxy(31,i+6); writeln('----------------------------------------------------------------------');
    end;
end;
        
{prototype : procedure jumlah_data(var n:longint; var listrik:longint);}
{prototype : function tgh(listrik,uang:longint):longint;}
{prototype : procedure tampildata(n:longint);}

begin
    jumlah_data(n,listrik);
    tampildata(n,listrik);
    readln;
end.