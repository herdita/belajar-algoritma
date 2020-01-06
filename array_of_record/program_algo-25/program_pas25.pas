program array_satu_dimensi;
{i.s:}
{f.s:}

uses crt;

{kamus}
    const
        maks_data=10;
    type
        data= record
            nama    :string;
            nilai   :integer;
            indeks  :char;
        end;
        arr= array[1..maks_data] of data;
        
    var
        mahasiswa:arr;
        i,n     :integer;

procedure isi_data(var n:integer; var mahasiswa:arr);
{i.s:}
{f.s:}

{kamus}

{algoritma}
begin
    write('masukan data yang akan di masukan : '); readln(n);
    while(n < 0) or (n > maks_data) do
    begin
        writeln('maaf data yang anda masukan harus 1 - 10');
        write('Masukan banyak data : '); readln(n);
    end;
end;

function idx(ni:integer):char;
{i.s:}
{f.s:}

{kamus}

{algoritma}
begin
    case (ni) of
        80..100 : idx:= 'A';
        70..79  : idx:= 'B';
        60..69  : idx:= 'C';
        50..59  : idx:= 'D';
        0..49   : idx:= 'E';
    end;
end;

procedure tampil_data(n:integer; mahasiswa:arr);
{i.s:}
{f.s:}

{kamus}

{algoritma}
begin
    writeln('---------------------------');
    writeln('|  Nama  | Nilai | indeks |');
    writeln('---------------------------');

    
    for i := 1 to n do
    begin
    writeln('|        |       |        |');
        gotoxy(2,i+4); readln(mahasiswa[i].nama);
        gotoxy(12,i+4); readln(mahasiswa[i].nilai);
    end;
    for i:= 1 to n do
    begin
        mahasiswa[i].indeks:= idx(mahasiswa[i].nilai);
        gotoxy(21,i+4); delay(700); write(mahasiswa[i].indeks);
    end;
end;


{algoritma Utama}
begin
    isi_data(n,mahasiswa);
    tampil_data(n,mahasiswa);
    readln;
end.