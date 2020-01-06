program bilangan_genap;
{i.s : user memasukan bilangan }
{f.s : menampilakan bilangan ganjil atau genap}

{Kamus}
var
x:integer;
bilangan:string;

{Algoritma}
begin
    write('Masukan bilangan : '); readln(x);
    bilangan:= 'ganjil';
    if(x mod 2 =0)then
      bilangan:= 'genap';
    writeln('Ini bilangan ',bilangan);
    readln;
end.