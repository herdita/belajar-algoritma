program pengurutan_rangking;
{f.s: data mahasiswa sudah tedefinisi}
{i.s: menampilan data mahasiswa}
uses crt;

{kamus global}
    const
        maks_mhs = 20;
    type
        data = record
            nama : string;
            nilai: integer;
            kelas: string;
        end;
        
        arr_mhs= array[1..maks_mhs]of data;
    var
        mahasiswa: arr_mhs;
        n        : integer;
        


procedure isi_data(var n:integer; var mahasiswa:arr_mhs);
{i.s: user mamasukan data mahasiswa}
{f.s: menyebarkan data mahasiswa}

{kamus}
var 
    i:integer;

{algoritma}
begin
    write('Masukan data mahasiswa : '); readln(n);
    writeln('------------------------');
    writeln('|     Nama     | Nilai | kelas |');
    writeln('------------------------');
    for i:= 1 to n do
    begin    
        writeln('|              |       |       |');
        gotoxy(3,4+i); readln(mahasiswa[i].nama);
        gotoxy(19,4+i); readln(mahasiswa[i].nilai);
        gotoxy(28,4+i); readln(mahasiswa[i].kelas);
    end;
end;


procedure tukar(var a:data; var b:data);
{i.s:}
{f.s:}

{kamus}
var
    temp: data;

{algoritma}
begin
    temp  := a;
    a     := b;
    b     := temp;
end;



procedure urut_data(n:integer; var mahasiswa:arr_mhs);
{i.s: data mahasaiswa sudah terdefinisi}
{f.s: menyebarkan data mahasiswa}

{kamus}
var
    i,k  :integer;
    
{algoritma}
begin
    //memakai metode max sort acsending
    for i:= 1 to (n-1)do
    begin
        for k:= i to n-i do
        begin    
            if(mahasiswa[k].nilai < mahasiswa[k+1].nilai) then
                tukar(mahasiswa[k],mahasiswa[k+1]);
        end;
    end;
end;


procedure tampil_data(n:integer; mahasiswa:arr_mhs);
{i.s: data mahasiswa sudah terdefinisi}
{f.s: menampikan data mahasiswa}

{kamus}
var 
    i:integer;

{algoritma}
begin
    clrscr;
    writeln('------------------------');
    writeln('|     Nama     | Nilai | Kelas |');
    writeln('------------------------');
    for i:= 1 to n do
    begin    
        gotoxy(1,3+i); write('|              |       |       |');
        gotoxy(3,3+i); write(mahasiswa[i].nama);
        gotoxy(19,3+i); write(mahasiswa[i].nilai);
        gotoxy(28,3+i); write(mahasiswa[i].kelas);
    end;
end;

{algoritma utama}
begin
    isi_data(n,mahasiswa);
    urut_data(n,mahasiswa);
    tampil_data(n,mahasiswa);
    readln;
end.
