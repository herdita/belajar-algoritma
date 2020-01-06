program mahasiswa_data;
{i.s:}
{f.s:}
uses crt;

{kamus}
const
    maksmhs=20;
    maksmatkul=10;
type
    dmhs= record
        nim :string;
        nama:string;
        ipk :integer;
    end;

    dmk= record
        kodemk :string;
        namamk :string;
        sks    :integer;
    end;

    arr_mhs     = array[1..maksmhs] of dmhs;
    arr_matkul  = array[1..maksmatkul] of dmk;
    arr_nilai   = array[1..maksmhs,1..maksmatkul] of integer;
    arr_indeks  = array[1..maksmhs,1..maksmatkul] of char;
var
    mahasiswa :arr_mhs;
    matkul    :arr_matkul;
    nilai     :arr_nilai;
    indeks    :arr_indeks;
    n,m       :integer;
    i,j       :integer;
    baris     :integer;

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


procedure daftar_mahasiswa(n:integer; var mahasiswa:arr_mhs);
{i,s:}
{f.s:}

{kamus}

{algoritma}
begin
    clrscr;
    writeln('          Daftar Mahasiswa         ');
    writeln('-----------------------------------');
    writeln('| No |   N I M   | Nama Mahasiswa |');
    writeln('-----------------------------------');
    
    for i := 1 to n do
    begin
        gotoxy(1,i+4);
        write('|    |           |                |');
        gotoxy(3,i+4); write(i);
        gotoxy(8,i+4); readln(mahasiswa[i].nim);
        gotoxy(20,i+4); readln(mahasiswa[i].nama);
    end;
    gotoxy(1,i+5);
    writeln('-----------------------------------');
    baris:=i+6;
end;


procedure daftar_matkul(m:integer; var matkul:arr_matkul);
{i,s:}
{f.s:}

{kamus}

{algoritma}
begin
    gotoxy(1,baris+1);
    writeln('                 Daftar Mata Kuliah                  ');
    gotoxy(1,baris+2);
    writeln('---------------------------------------------------');
    gotoxy(1,baris+3);
    writeln('| No | Kode Mata Kuliah  | Nama Mata Kuliah | SKS |');
    gotoxy(1,baris+4);
    writeln('---------------------------------------------------');
    
    for i := 1 to m do
    begin
        gotoxy(1,baris+i+4);
        write('|    |                   |                  |     |');
        gotoxy(3,baris+i+4); write(i);
        gotoxy(9,baris+i+4); readln(matkul[i].kodemk);
        gotoxy(29,baris+i+4); readln(matkul[i].namamk);
        gotoxy(48,baris+i+4); readln(matkul[i].sks);
    end;
end;


procedure nilai_mahasiswa(n:integer; m:integer; mahasiswa:arr_mhs; matkul:arr_matkul; var nilai:arr_nilai);
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
    gotoxy(13,4); 
    write('Kode Mata Kuliah');
    gotoxy(1,6); 
    write('nim');
    
    for i:= 1 to m do
    begin
        gotoxy(12*i,6); write(matkul[i].kodemk);
    end;

    for i:= 1 to n do
    begin
        gotoxy(1,i+6); write(mahasiswa[i].nim);
    end;

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
    daftar_mahasiswa(n,mahasiswa);
    daftar_matkul(m,matkul);
    write('Tekan Enter Untuk Melanjutkan! '); readln;
    nilai_mahasiswa(n,m,mahasiswa,matkul,nilai);
    for i:= 1 to n do
    begin
        for j:= 1 to m do
        begin
            indeks[i,j]:= idx(nilai[i,j]);
            gotoxy(12*j,i+6); clreol; delay(100); write(indeks[i,j]);
            writeln();
        end;
    end;
    write('Tekan Enter Untuk Melanjutkan! '); readln;

    clrscr;
    baris:=0;
    gotoxy(25,1);
    write('  HASIL STUDI MAHASISWA TEKNIK INFORMATIKA UNIKOM SEBANYAK ',n,' MAHASISWA');
    gotoxy(25,2);
    write(' ==========================================================================');
    
    for i := 1 to n do
    begin
        if (i > 1) then baris := baris - i;
        gotoxy(1,baris+i+4);
        write('-----------------------------------------------------Mahasiswa ke-',i,'-----------------------------------------------------');
        gotoxy(1,baris+i+5);
        writeln('Nim   : ',mahasiswa[i].nim);
        gotoxy(1,baris+i+6);
        writeln('Nama  : ',mahasiswa[i].nama);
        gotoxy(1,baris+i+7);
        write('------------------------------------------------------------');
        gotoxy(1,baris+i+8);
        write('| No | Kode Mata Kuliah  | Nama Mata Kuliah | SKS | indeks |');
        gotoxy(1,baris+i+9);
        write('------------------------------------------------------------');
        baris:= baris+i+9;

        for j:= 1 to m do
        begin
            gotoxy(1,j+baris);
            write('|    |                   |                  |     |        |');
            gotoxy(3,j+baris); write(j);
            gotoxy(9,j+baris); write(matkul[j].kodemk);
            gotoxy(29,j+baris); write(matkul[j].namamk);
            gotoxy(48,j+baris); write(matkul[j].sks);
            gotoxy(55,j+baris); write(indeks[i,j]);
        end;
        gotoxy(1,j+baris+1);
        writeln('------------------------------------------------------------');
        baris:= baris+j;        
    end;
end;



{algoritma utama}
begin
    isi_data(n,m);
    tampil_data(n,m);
    readln;
end.
