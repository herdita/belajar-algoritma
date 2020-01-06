program upah_karyawan;
{i.s: user memasukan nama dan jumlah jam keja}
{f.s: menampilkan upah karyawan}

{kamus}
var
nama:string;
jjk,upah,lembur:integer;

{algoritma}
begin
    {input}
    write('Masukan nama anda : '); readln(nama);
    write('Jumlah jam kerja  : '); readln(jjk);
    {proses}
    if(jjk<=48)
      then
        upah:= jjk * 2000
      else
        begin
         lembur:= jjk - 48;
         upah:=(jjk*2000)+(lembur*3000);
        end;
    {output}
    writeln('Nama : ',nama);
    writeln('Upah : ',upah);
    readln;
end.
