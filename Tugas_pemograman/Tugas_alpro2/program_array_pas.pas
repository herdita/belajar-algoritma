program daftar_nilai_mahasiswa;
{i.s:}
{f.s:}

{kamus global}
const
    maksmhs=50;
type
    larik1=array[1..maksmhs]of string;
    larik2=array[1..maksmhs]of integer;
    larik3=array[1..maksmhs]of char;
var
nim,nama:larik1;
nilai   :larik2;
indeks  :larik3;
n       :integer;


procedure isi_data(var n:integer; var nim,nama:larik1; var nilai:larik2);
{i.s:}
{f.s:}

{kamus}
var
i:integer;

{algoritma}
begin
    write('Masukan banyaknya data mahasiswa : '); readln(n);
    while(n<1)or(n>maksmhs)do
    begin
       writeln('Jumlah mahasiswa tidak boleh kurang dari 0 dan lebih dari 100');
       write('masukan banyaknya data mahasiswa :'); readln(n);
    end;

    for i := 1 to n do
    begin
        write('Nim   : '); readln(nim[i]);
        write('Nama  : '); readln(nama[i]);
        write('Nilai : '); readln(nilai[i]);
        while(nilai[i]<0) or (nilai[i]>100)do
        begin
            writeln('isikan nilai dari 0 -100');
            write('nilai : '); readln(nilai[i]);
        end; // endwhile
    end;  // endfor
end;  // endprocedure


function idx(nilai:integer):char;
{i.s:}
{f.s:}

{kamus}

{algoritma}
begin
    case(nilai)of
        80..100:idx:='a';
        70..79 :idx:='b';
        60..69 :idx:='c';
        50..59 :idx:='d';
        0..49  :idx:='e';
    end;
end;

procedure tampil_data(n:integer; nim,nama:larik1; nilai:larik2);
{i.s:}
{f.s:}

{kamus}
var 
i:integer;

{algoritma}
begin
    writeln('       daftar nilai mahasiswa      ');
    writeln('-----------------------------------');
    writeln('|No|Nim|Nama|Nilai|Indeks');
    writeln('-----------------------------------');
    for i := 1 to n do
    begin
       indeks[i]:= idx(nilai[i]);
       writeln('|',i,'|',nim[i],'|',nama[i],'|',nilai[i],'|',indeks[i]);
    end;
    writeln('------------------------------------');
end;

{algoritma utama}
begin
    isi_data(n,nim,nama,nilai);
    tampil_data(n,nim,nama,nilai);
    readln;
end.
