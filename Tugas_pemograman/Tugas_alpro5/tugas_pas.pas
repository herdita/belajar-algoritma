program data_mahasiswa;
uses crt;
{i.s:}
{f.s:}

{kamus}
const 
    maksmhs=50;
type
    dmhs= record
        nim,nama:string;
        nilai   :integer;
        indeks  :char;
        keterangan:string;
    end;
    arr_mhs=array[1..maksmhs]of dmhs;

 var
    mahasiswa:arr_mhs;
    n:integer;
    i:integer;

procedure isi_data( var n:integer; var mahasiswa:arr_mhs);
{i.s:}
{f.s:}

{var}

{algoritma}
begin
     write('Banyaknya data mahasiswa : '); readln(n);
     while(n<1)or(n>maksmhs)do
       begin
         gotoxy(1,2); write('Banyaknya data hanya antara 1-100'); readln;
         gotoxy(1,2); clreol;
         gotoxy(28,1); clreol;
         readln(n);
       end;
end;


function idx(nilai:integer):char;
{i.s:}
{f.s:}

{kamus}

{algoritma}
begin
    case nilai of
        80..100: idx:='A';
        70..79 : idx:='B';
        60..69 : idx:='C';
        50..59 : idx:='D';
        0..49  : idx:='E';
    end;
end;

function rerata(n:integer; total:integer):real;
{i.s}
{f.s}

begin
 rerata:=total/n;
end;


function Nmax(n:integer; mahasiswa:arr_mhs):integer;
{i.s}
{f.s}
var
    max:integer;

begin
    max:= mahasiswa[1].nilai;
    for i := 2 to n do
     begin
        if(mahasiswa[i].nilai > max) then
            max:= mahasiswa[i].nilai;
     end;
     Nmax:= max;
end;



function Nmin(n:integer; mahasiswa:arr_mhs):integer;
{i.s}
{f.s}
var
    min:integer;

begin
    min:= mahasiswa[1].nilai;
    for i := 2 to n do
     begin
        if(mahasiswa[i].nilai < min) then
            min:= mahasiswa[i].nilai;
     end;
     Nmin:= min;
end;


procedure jumlah_per_indeks(n:integer; mahasiswa:arr_mhs);
{i.s:}
{f.s:}

{kamus}
var
    a,b,c,d,e:integer;
{algoritma}
begin
    a:= 0;
    b:= 0;
    c:= 0;
    d:= 0;
    e:= 0;
    for i:= 1 to n do
    begin
        case (mahasiswa[i].indeks) of
            'A' : a:= a + 1;
            'B' : b:= b + 1;
            'C' : c:= c + 1;
            'D' : d:= d + 1;
            'E' : e:= e + 1;
        end;
    end;
    gotoxy(11,i+10);
    writeln('Jumlah Mahasiswa dari ',n,' yang dapat   A : ',a,' orang');
    gotoxy(11,i+11);
    writeln('Jumlah Mahasiswa dari ',n,' yang dapat   B : ',b,' orang');
    gotoxy(11,i+12);
    writeln('Jumlah Mahasiswa dari ',n,' yang dapat   C : ',c,' orang');
    gotoxy(11,i+13);
    writeln('Jumlah Mahasiswa dari ',n,' yang dapat   D : ',d,' orang');
    gotoxy(11,i+14);
    writeln('Jumlah Mahasiswa dari ',n,' yang dapat   E : ',e,' orang');
    gotoxy(11,i+15);
    write('--------------------------------------------------------------------------');
end;

procedure ket(n:integer; var mahasiswa:arr_mhs);
{i.s:}
{f.s:}

{kamus}
var
    ket:string;

{algoritma}
begin
    for i:= 1 to n do
    begin
        if(mahasiswa[i].indeks = 'A') or (mahasiswa[i].indeks = 'B') or (mahasiswa[i].indeks = 'C') then
            ket:= 'lulus'
        else
            ket:= 'tidak lulus';
    
    gotoxy(71,i+4);
    mahasiswa[i].keterangan:= ket;
    delay(700);
    write(mahasiswa[i].keterangan);
    end;
end;

procedure jumlah_lulus(n:integer; mahasiswa:arr_mhs);
{i.s:}
{f.s:}

{kamus}
var
    a,b:integer;
{algoritma}
begin
    a:=0;
    b:=0;
    for i:= 1 to n do
    begin
        if(mahasiswa[i].keterangan ='lulus') then
            a:= a + 1
        else
            if(mahasiswa[i].keterangan ='tidak lulus') then
            b:= b + 1;
    end;
    gotoxy(11,i+16);
    writeln('Jumlah Mahasiswa dari ',n,' yang Lulus       : ',a,' orang');
    gotoxy(11,i+17);
    writeln('Jumlah Mahasiswa dari ',n,' yang Tidak lulus : ',b,' orang');
end;

procedure tampil_data(n:integer; var mahasiswa:arr_mhs);
{i.s:}
{f.s:}

{kamus}
{function idx(nilai:integer):integer}
var
    total:integer;

{algoritma}
begin
   clrscr;
     gotoxy(29,1);write('daftar nilai mahasiswa');
     gotoxy(11,2);
     write('--------------------------------------------------------------------------');

     gotoxy(11,3);
     write('| NO |    NIM   |    NAMA MAHASISWA    |  NILAI  | INDEKS |  KETERANGAN  |');
     gotoxy(11,4);
     write('--------------------------------------------------------------------------');

    total:=0;
     for i := 1 to n do
     begin
        gotoxy(11,i+4);
        write('|    |          |                      |         |        |              |');
        gotoxy(13,i+4); write(i);
        gotoxy(18,i+4); readln(mahasiswa[i].nim);
        gotoxy(31,i+4); readln(mahasiswa[i].nama);
        gotoxy(54,i+4); readln(mahasiswa[i].nilai);

        total:= total + mahasiswa[i].nilai;
        mahasiswa[i].indeks:=idx(mahasiswa[i].nilai); 
        gotoxy(64,i+4); write(mahasiswa[i].indeks);
        
    end;

        gotoxy(11,i+5);
        write('--------------------------------------------------------------------------');
        gotoxy(11,i+6);
        write('rata-rata nilai dari  ',n,' Mahasiswa = ',rerata(n,total):0:1);
        gotoxy(11,i+7);
        write('Nilai maksimal dari   ',n,' Mahasiswa = ',Nmax(n,mahasiswa));
        gotoxy(11,i+8);
        write('Nilai minimal  dari   ',n,' Mahasiswa = ',Nmin(n,mahasiswa));
        gotoxy(11,i+9);
        write('--------------------------------------------------------------------------');
        jumlah_per_indeks(n,mahasiswa);
        ket(n,mahasiswa);
        jumlah_lulus(n,mahasiswa);
           
end;


    
begin
    isi_data(n,mahasiswa);
    tampil_data(n,mahasiswa);
   
    readln;
end.
    

