program daftar_nilai_mahasiswa;
uses crt;

const
  maksmhs=50;
type
   larik1=array[1..maksmhs]of string;
   larik2=array[1..maksmhs]of integer;
   larik3=array[1..maksmhs]of char;

var
   nim,nama:larik1;
   nilai   :larik2;
   indeks  :larik3;
   n       :integer;
   i       :integer;
   


procedure jumlahdata(var n:integer);
{i.s}
{f.s}

begin
     write('Banyaknya data mahasiswa : '); readln(n);
     while(n<1)or(n>maksmhs)do
       begin
         gotoxy(1,2); write('Banyaknya data hanya antara 1-100'); readln;
         gotoxy(1,2); clreol;
         gotoxy(28,1); clreol;
         readln(n);
       end;
end;


function idx(na:integer):char;
{i.s}
{f.s}

begin
     case(na)of
       80..100:idx:='A';
       70..79 :idx:='B';
       60..69 :idx:='C';
       50..59 :idx:='D';
       0..49  :idx:='E';
     end;
end;


function rerata(n:integer; total:real):real;
{i.s}
{f.s}

begin
 rerata:=total/n;
end;


procedure jumlah_per_indeks(n:integer; mahasiswa:larik)
{i.s:}
{f.s:}

{kamus}
var
a,b,c,d,e:integer;

{algoritma}
begin
  for i:= 1 to n do
    case(mahasiswa[i].indeks)of
      'A': a:= a + 1;
      'B': b:= b + 1;
      'C': c:= c + 1;
      'D': d:= d + 1;
      'E': e:= e + 1;
    end;
  end;
end;


procedure tampildata(n:integer);
{i.s banyaknya data n}
{f.s menampilkan daftar mahasiswa}

var
     max:integer;
     min:integer;
     total:real;

begin
     clrscr;
     gotoxy(29,1);write('daftar nilai mahasiswa');
     gotoxy(11,2);
     write('----------------------------------------------------------');

     gotoxy(11,3);
     write('| NO |    NIM   |    NAMA MAHASISWA    |  NILAI  | INDEKS |');
     gotoxy(11,4);
     write('-----------------------------------------------------------');

     total:=0;
     for i := 1 to n do
     begin
        gotoxy(11,i+4);
        write('|    |          |                      |         |        |');
        gotoxy(13,i+4); write(i);
        gotoxy(18,i+4); readln(nim[i]);
        gotoxy(31,i+4); readln(nama[i]);
        gotoxy(54,i+4); readln(nilai[i]);

        

        total:= total + nilai[i];
        

        indeks[i]:=idx(nilai[i]);
        gotoxy(64,i+4); write(indeks[i]);

        end;

         max:=nilai[1];
         min:=nilai[1];
         for i:= 2 to n do
         begin
          if(nilai[i] > max) then
            begin   
               max:= nilai[i];
            end
           else
            begin
               if(nilai[i] < min) then
                  min:= nilai[i];
            end;
         end;

        gotoxy(11,i+5);
        write('-----------------------------------------------------------');
        gotoxy(11,i+6);
        write('rata-rata nilai dari ',n,' Mahasiswa = ',rerata(n,total):0:1);
        gotoxy(11,i+7);
        write('Nilai Maksimal dari  ',n,' Mahasiswa = ',max);
        gotoxy(11,i+8);
        write('Nilai Minimal dari  ',n,' Mahasiswa = ',min);
    
      
end;

begin
     jumlahdata(n);
     tampildata(n);
     readln;
end.
