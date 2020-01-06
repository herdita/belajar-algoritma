program mencetak_1_sampai_n;
{i.s: user memasukan nilai n}
{f.s: mencetak banyaknya n}

{kamus}
var
i:integer;
n:integer;

{algoritma}
begin
    {input}
    write('Masukan Nilai n : '); readln(n);
    {proses}
    for i:= 1 to n do
      {output}
      write(i);
      readln;
end.