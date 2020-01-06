program pengurutan;
uses crt;
{i.s:}
{f.s:}

{kamus}
    const
        maks=20;
    type
        data=record
            nama    : string;
            kelas   : string;
            nilai   : string;
        end;
        arr_data= array[1..maks]of data;
    var
        mahasiswa: arr_data;
        n:integer;
        
    
procedure isi_data(var n:integer; var mahasiswa:arr_data);
{i.s:}
{f.s:}

{kamus}
var 
    i:integer;

{algoritma}
begin
    write('banyaknya data : '); readln(n);
    {validasi}
    write('|    Nama    |  Kelas  | Nilai |');
    for i:= 1 to n do
    begin
        gotoxy(1,2+i);  writeln('|            |         |       |');
        gotoxy(3,2+i);  readln(mahasiswa[i].nama);
        gotoxy(17,2+i); readln(mahasiswa[i].nilai);
        gotoxy(28,2+i); readln(mahasiswa[i].kelas);
    end;
end;


procedure bubble_sort(n:integer; var mahasiswa:arr_data);
{i.s:}
{f.s:}

{kamus}
var
    temp: data;
    I,k : integer;

{algoritma}
begin
    for i:= 1 to n-1 do
    begin
        for k:= i to n-i do
        begin
            if(mahasiswa[k].nama > mahasiswa[k+1].nama) then
            begin    
                temp            := mahasiswa[k];
                mahasiswa[k]    := mahasiswa[k+1];
                mahasiswa[k+1]  := temp;
            end;
        end;
    end;
end;


procedure tampil_data(n:integer; mahasiswa:arr_data);
{i.s:}
{f.s:}

{kamus}
var
    i:integer;

{algoritma}
begin
    clrscr;
    write('|    Nama    |  Kelas  | Nilai |');
    bubble_sort(n,mahasiswa);
    for i:= 1 to n do
    begin
        gotoxy(1,1+i);  write('|            |         |       |');
        gotoxy(2,1+i);  write(mahasiswa[i].nama);
        gotoxy(17,1+i); write(mahasiswa[i].kelas);
        gotoxy(28,1+i); write(mahasiswa[i].nilai);
    end;
end;

begin
    isi_data(n,mahasiswa);
    tampil_data(n,mahasiswa);
    readln;
end.