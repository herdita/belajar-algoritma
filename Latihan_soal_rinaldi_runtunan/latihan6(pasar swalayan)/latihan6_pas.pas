program pasar_sewalayan;
{i.s: user memasukan nilai total belanja}
{f.s: menampilkan diskon harga, harga belanja}

{Kamus}
var
total_belanja:longint;
diskon,harga_belanja:real;

{Algoritma}
begin
    {input}
    write('total belanja : '); readln(total_belanja);
    {proses}
    if(total_belanja>=100000)
      then
       begin
         write('Diskon : '); readln(diskon);
         diskon:= diskon / 100;
         diskon:= total_belanja * diskon;
         harga_belanja:= total_belanja - diskon;
       end
      else
       harga_belanja:= total_belanja;
    {output}
    writeln('Harga Diskon  : ',diskon:2:2);
    writeln('Harga Belanja : ',harga_belanja:2:2);
    readln;
end.    