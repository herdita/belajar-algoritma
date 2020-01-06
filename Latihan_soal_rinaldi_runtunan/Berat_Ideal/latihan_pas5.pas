program menentukan_berat_badan_ideal;
{i.s : user memasukan nilai tinggi badan}
{f.s : menampilkan berat badan ideal }

{Kamus}
var
tinggi_badan,berat_badan:integer;
berat_ideal,berat_ideal1,berat_ideal2:real;

{algoritma}
begin
    {input}
    write('Tinggi Badan : '); readln(tinggi_badan);
    write('Berat Badan  : '); readln(berat_badan);
    {proses}
    berat_ideal := tinggi_badan - 100;
    berat_ideal := berat_ideal - (berat_ideal * 0.1);
    berat_ideal1 := berat_ideal - 2;
    berat_ideal2 := berat_ideal + 2;
    if(berat_badan < berat_ideal1)or(berat_badan > berat_ideal2)
       then
         {output}
         writeln('Berat badan kamu tidak ideal, idealnya : ',berat_ideal:2:1)
       else
         {output}
         writeln('Mantap Broo !! Berat badan kamu ideal');
    readln;
end.