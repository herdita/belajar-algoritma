program menentukan_nilai_max;
{i.s: user memasukan nilai a,b,c}
{f.s: menampilkan nilai max dari ke-tiga nilai}

{Kamus}
var
a,b,c,max:integer;

{Algoritma}
begin
    {input}
    write('masukan nilai a : '); readln(a);
    write('masukan nilai b : '); readln(b);
    write('masukan nilai c : '); readln(c);
    {proses}
    if(a>b)then    //if ke satu
      max:= a
    else
      max:= b;

    if(b>max)then  //if ke kedua
      max:= c;

    {output}
    write('nilai yang terbesar : ',max);
    readln  
end.