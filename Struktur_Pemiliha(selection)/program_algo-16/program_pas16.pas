program index_nilai_ujian;
{i.s: user memasukan nilai_ujian}
{f.s: menampilkan index nilai }

{kamus}
var
nilai:integer;
index_nilai:char;

{algoritma}
    begin
        {input}
        write('Nilai : '); readln(nilai);
        {proses}
        case(nilai)of
            80..100 : index_nilai:='A'; 
            70..79  : index_nilai:='B'; 
            60..69  : index_nilai:='C'; 
            50..59  : index_nilai:='D'; 
            else index_nilai:='E';  // selain
        end;
        {output}
        writeln('index_nilai : ',index_nilai);
        readln;
    end.