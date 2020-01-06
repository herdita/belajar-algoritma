program indeks_mahasiswa;
{i.s:}
{f.s:}
uses crt;

{kamus}
const
    maksmhs = 20; // baris
    maksmatkul = 20;  //colom

type    
    arr_nilai   = array[1..maksmhs,1..maksmatkul] of integer;
    arr_indeks  = array[1..maksmhs,1..maksmatkul] of char;
var
    nilai   : arr_nilai;
    indeks  : arr_indeks;
    i,j     : integer;
    n,m     : integer;

procedure isi_data(var n:integer; var m:integer);
{i.s:}
{f.s:}

{kamus}

{algoritama}
begin
    write('Banyaknya data mahasiswa : '); readln(n);
    while(n < 0) or (n > maksmhs) do
    begin
        gotoxy(1,2); write('Banyaknya data hanya antara 1-20'); readln;
        gotoxy(1,2); clreol;
        gotoxy(28,1); clreol;
        readln(n);
    end;

    write('Banyaknya Mata kuliah    : '); readln(m);
    while(m < 0) or (m > maksmhs) do
    begin
        gotoxy(1,3); write('Banyaknya data hanya antara 1-10'); readln;
        gotoxy(1,3); clreol;
        gotoxy(28,2); clreol;
        readln(m);
    end; 
end;


procedure nilai_mahasiswa(n:integer; m:integer);
{i,s:}
{f.s:}

{kamus}
{algoritma}
begin
    clrscr;
    gotoxy(30,1);
    writeln('Pengisian Nilai mahasiswa');
    gotoxy(30,2);
    writeln('-------------------------');
    
    for i:= 1 to n do
    begin
        for j:= 1 to m do
        begin 
            gotoxy(12*j,i+6); readln(nilai[i,j]);
        end;
    end;
end;


function idx(ni:integer):char;
{i.s:}
{f.s:}

{kamus}

{algoritma}
begin
    case (ni) of
        80..100 : idx:='A';
        70..79  : idx:='B';
        60..69  : idx:='C';
        50..59  : idx:='D';
        0..49   : idx:='E';
    end;
end;


procedure tampil_data(n:integer; m:integer);
{i,s:}
{f.s:}

{kamus}

{algoritma}
begin
    for i:= 1 to n do
    begin
        for j:= 1 to m do
        begin
            indeks[i,j]:= idx(nilai[i,j]);
            gotoxy(12*j,i+6); clreol; delay(600); write(indeks[i,j]);
            writeln();
        end;
    end;
end;


{algoritma Utama}
begin
    isi_data(n,m);
    nilai_mahasiswa(n,m);
    tampil_data(n,m);
    readln;
end.