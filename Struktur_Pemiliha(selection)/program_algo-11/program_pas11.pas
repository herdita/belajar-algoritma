program nilai_maxsimum;
{i.s: user memasukan nilai a dan b}
{f.s: menampilkan nilai maksimum dari a dan b}

{kamus}
var
a,b,max:integer;

{algoritma}
begin
    {input}
    write('masukan nilai A :'); readln(a);
    write('masukan nilai B :'); readln(b);
    {proses}
    if(a>b)then
      max:= a
    else // sebalikanya jika (b>a)
      max:= b;
    {output}
    write('Nilai terbersanya adalah nilai ',max);
    readln;
end.