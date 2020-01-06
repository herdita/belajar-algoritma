program upah_perjam_karyawan;
{i.s : user memasukan nama,gol,jjk karyawan}
{f.s : menampilkan total upah karyawan}


{kamus}
const jamnormal  = 48;
const upahlembur = 3000;

var
nama:string;
gol :char;
jjk,upah_perjam,lembur,total_upah:integer;

{Algoritma}
begin
    {input}
    write('nama     : '); readln(nama);
    write('golongan : '); readln(gol);
    write('JJ kerja : '); readln(jjk);
    {proses}
    case(gol)of
        'a' : upah_perjam:= 4000;
        'b' : upah_perjam:= 5000;
        'c' : upah_perjam:= 6000;
        'd' : upah_perjam:= 7000;
    end;

    if(jjk<=jamnormal)
       then
         total_upah:= jjk * upah_perjam
       else
         begin
          lembur:= jjk - jamnormal;
          total_upah:= (jamnormal * upah_perjam) + (lembur * upahlembur);
         end;
    {output}
    writeln('nama      : ',nama);
    writeln('totalUpah : ',total_upah);
    readln;

end.    
