program Untitled;
{i.s:user memasukan data buku}
{f.s: menampilkan data buku yang sudah berurut}

uses crt;
const
     maksbuku=20;
     user='herdita';
     pass='10116136';
type
    databuku=record
          kodebuku,namabuku :string;
          tahun,pengarang   :string;
    end;
    buku=array[1..maksbuku]of databuku;
var
   bk    :buku;
   n,menu:integer;
   np,ks :string;


//function login
function login(np,ks:string):boolean;
{i.s}
{f.s}

{kamus}
var
   i:integer;

{algoritma}
begin
     i:=1;
     while((np<>user) or (ks<>pass)) and (i<>3)do
     begin
          gotoxy(1,3); write('salah login');
          readln; gotoxy(1,3); clreol; gotoxy(17,1); clreol;
          gotoxy(17,2); clreol;
          gotoxy(17,1); readln(np); gotoxy(17,2); readln(ks);
          i:=i+1;
     end;
     if(i <= 3)and(np = user)and(ks=pass)
     then
         login:= true
     else
         login:= false;
end;



//prosedur menu pilihan
procedure MenuPilihan(var menu:integer);
{i.s}
{f.s}

{kamus}

{algoritma}
begin
     gotoxy(30,9); write('MENU PILIHAN');
     gotoxy(30,10); write('============');
     gotoxy(30,11); write('1. Isi Data Buku');
     gotoxy(30,12); write('2. Tampil data buku');
     gotoxy(30,13); write('3. pencarian');
     gotoxy(30,14); write('0. Keluar');
     gotoxy(30,15); write('Pilihan Anda : '); readln(menu);
     while(menu<0)or(menu>3)do
      begin
          gotoxy(45,15); write('Maaf pilihan anda tidak ada'); readln;
          gotoxy(45,15); clreol;
          gotoxy(45,15); readln(menu);
      end;
end;


//prosedur memasukan data buku
procedure IsiDataBuku(var n:integer; var bk:buku);
{i.s:}
{f.s:}

{kamus}
var
   i:integer;
begin
     clrscr;
     write('Banyaknya data buku : '); readln(n);
     {validasi}
     while(n<0)or(n>maksbuku)do
     begin
          write('maaf banyaknya buku harus 1 - 20');
          gotoxy(1,2); clreol;
          gotoxy(23,1); readln(n);
     end;

     clrscr;
     gotoxy(24,1); write('Data Buku');
     gotoxy(1,3);
     write('-----------------------------------------------------');
     gotoxy(1,4);
     write('| Kode Buku |  Nama Buku  | tahun |    pengarang    |');
     gotoxy(1,5);
     write('-----------------------------------------------------');
     for i:= 1 to n do
     begin
          gotoxy(1,i+5);
          write('|           |             |       |                 |');
          gotoxy(3,i+5);  readln(bk[i].kodebuku);
          gotoxy(15,i+5);  readln(bk[i].namabuku);
          gotoxy(29,i+5);  readln(bk[i].tahun);
          gotoxy(38,i+5);  readln(bk[i].pengarang);
     end;
end;
          
     
//prosedur mengurutkan data buku
procedure UrutDataBuku(n:integer; var bk:buku);
{i,s:}
{f.s:}

{kamus}
var
   I,j,min :integer;
   temp    :databuku;

{algoritma}
begin
   // metode minimum sort secara ascending
   i:=1;
   for i:= 1 to (n-1)do
   begin
        min := i;
        for j:=(i+1)to n do
        begin
             if(bk[j].kodebuku < bk[min].kodebuku)
               then
                 min:= j;
        end;
        temp     := bk[i];
        bk[i]    := bk[min];
        bk[min]  := temp;
   end;
end;

//prosedur menampilkan data bukuk yang sudah terurut
procedure TampilDataBuku(n:integer; bk:buku);
{i.s:}
{f.s:}

{kamus}
var
    i:integer;

{algoritma}
begin
    clrscr;
    gotoxy(24,1); write('Data Buku');
    gotoxy(1,3);
    write('-----------------------------------------------------');
    gotoxy(1,4);
    write('| Kode Buku |  Nama Buku  | tahun |    pengarang    |');
    gotoxy(1,5);
    write('-----------------------------------------------------');
    for i:= 1 to n do
    begin
        gotoxy(1,i+5);
        write('|           |             |       |                 |');
        gotoxy(3,i+5);   write(bk[i].kodebuku);
        gotoxy(15,i+5);  write(bk[i].namabuku);
        gotoxy(29,i+5);  write(bk[i].tahun);
        gotoxy(38,i+5);  write(bk[i].pengarang);
    end;
end;


procedure search_pengarang();
{i.s:}
{f.s:}

{kamus}

{algoritam}
begin
    

{algoritma utama}
begin
     write('Nama pengguna  :'); readln(np);
     write('kata Kunci     :'); readln(ks);
     if(login(np,ks)) // login sukses
     then
        begin
          repeat
            clrscr;
            menupilihan(menu);
            case(menu)of
                 1 : isidatabuku(n,bk);
                 2 : begin
                          urutdatabuku(n,bk);
                          tampilDataBuku(n,bk); readln;
                     end;
            end; //endcase
          until(menu=0);
        end
     else
        begin
          write('maaf,sudah 3 kali salah login'); readln;
        end;
end.