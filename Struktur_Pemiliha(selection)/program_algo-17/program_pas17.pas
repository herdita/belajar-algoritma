program jumlah_hari;
{i.s : user memasukan nomor bulan dan tahun}
{f.s : menampilkan jumlah hari}

{kamus}
var
nomor_bulan,tahun,jumlahhari:integer;

{algoritma}
begin
    {input}
    write('Nomor bulan : '); readln(nomor_bulan);
    write('tahun       : '); readln(tahun);
    {proses}
    case(nomor_bulan)of
        1,3,5,7,8,10,12 : jumlahhari:= 31;
        4,6,9,11        : jumlahhari:= 30;
        2               : if(tahun mod 4=0)or(tahun mod 100<>0)or(tahun mod 400<>0)
                            then
                              jumlahhari:= 29 //tahun kabisat
                            else
                              jumlahhari:= 28; //selain
    end;
    {output}
    writeln('Jumlah Hari : ',jumlahhari);
    readln;
end.