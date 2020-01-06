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
   nmp   :string;

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
     gotoxy(30,8); write('MENU PILIHAN');
     gotoxy(30,9); write('============');
     gotoxy(30,10); write('1. Isi Data Buku');
     gotoxy(30,11); write('2. Tampil data buku');
     gotoxy(30,12); write('3. Cara Kode buku');
     gotoxy(30,13); write('4. Cari Pengarang');
     gotoxy(30,14); write('0. Keluar');
     gotoxy(30,15); write('Pilihan Anda : ');
     readln(menu);
     while(menu<0)or(menu>4)do
      begin
          gotoxy(45,15); write('Maaf anda tidak ada'); readln;
          gotoxy(45,15);   clreol;
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
          gotoxy(3,i+5);  write(bk[i].kodebuku);
          gotoxy(15,i+5);  write(bk[i].namabuku);
          gotoxy(29,i+5);  write(bk[i].tahun);
          gotoxy(38,i+5);  write(bk[i].pengarang);
     end;
end;


procedure carikode(n:integer; bk:buku);

var
    ia,ib,k:integer;
    ketemu: boolean;
    cari: string;

begin // pake binary_sort
     clrscr;
     write('Cari Kode buku : '); readln(cari);
     Ia:= 1;
     Ib:= n;
     ketemu:= false;
     while(not ketemu)and(ia<=ib)do
     begin
        k:= (ia+ib)div 2;
        if(bk[k].kodebuku = cari)then
        begin    
            ketemu:= true;
        end
        else
            begin
                if(bk[k].kodebuku < cari) then
                    ia:= k+1
                else
                    ib:= k-1;
            end;
    end;
    if(ketemu) then
        writeln(cari,' ditemukan di indeks ke-',k)
    else
        writeln(cari,' tidak di temukan ');

end;


procedure caripengarang(n:integer; bk:buku; nmp:string);
{i.s:}
{f.s:}

{kamus}
var
    i,baris : integer;

begin
    clrscr;
    // squensial search dengan boolean
    i:= 1;
    bk[n+1].pengarang:= nmp;
    while(bk[i].pengarang <> nmp)do
    begin
        i:= i+1;
        baris:= i+1;
    end; //endwhile
    if(i < n+1)then
    begin
        gotoxy(24,1); write('Data Buku');
        gotoxy(1,3);
        write('-----------------------------------------------------');
        gotoxy(1,4);
        write('| Kode Buku |  Nama Buku  | tahun |    pengarang    |');
        gotoxy(1,5);
        write('-----------------------------------------------------');
        gotoxy(1,baris+5);
        write('|           |             |       |                 |');
        gotoxy(3,baris+5);  write(bk[i].kodebuku);
        gotoxy(15,baris+5);  write(bk[i].namabuku);
        gotoxy(29,baris+5);  write(bk[i].tahun);
        gotoxy(38,baris+5);  write(bk[i].pengarang);
    end
    else
        begin
            write(nmp,' Tidak di temukan');
        end;
end;


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
                          tampildatabuku(n,bk);
                          readln;
                     end;
                 3 : begin
                          if(n=0)then
                          begin
                               clrscr;
                               writeln('Harap pilih menu no.1 terlebih dahulu');
                          end
                          else
                              begin
                                   urutdatabuku(n,bk);
                                   carikode(n,bk);
                               end;
                          readln;
                     end;
                 4 : begin
                          if(n=0)then
                          begin
                               clrscr;
                               writeln('Harap pilih menu no.1 terlebih dahulu');
                          end
                          else
                              begin
                                   clrscr;
                                   write('Pengarang yang di cari : '); readln(nmp);
                                   caripengarang(n,bk,nmp);
                               end;
                               readln;
                     end;

            end; //endcase
          until(menu=0);
     end
     else
        begin
          write('maaf,sudah 3 kali salah login'); readln;
        end;
end.