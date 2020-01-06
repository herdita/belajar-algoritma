program peminjaman_buku;
{i.s:}
{f.s:}
uses crt;

{kamus}
    const
        maks_bk     = 2000;  // maksimal Buku
        user='kelompok';
        pass='perpustakaan';
    type
        buku=record
            kode_bk,nama_bk,pengarang : string;
            tahun : integer;
        end; //endrecord

        agt=record
            nama,kelamin,alamat: string;
        end;

        pinjam=record
            tgl     : integer;
            bulan   : integer;
            tahun   : integer;
        end; //endrecord

        kembali= record
            tgl     : integer;
            bulan   : integer;
            tahun   : integer;
        end; //endrecord

        arr_bk      = array[1..maks_bk]of buku;
         
    var
        dt_bk      : arr_bk;
        dt_agt     : agt;
        dt_pinjam  : pinjam;
        dt_kembali : kembali;
        np,ks      : string;
        urut,pilihan,cari,isi: integer;
        n,jumlah_kembali     : integer;


function login_karyawan(np,ks:string):boolean;
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
          gotoxy(52,17); write(' Login Failed ');readln; gotoxy(45,17); clreol; 
          gotoxy(62,15); clreol; gotoxy(62,14); clreol;
          gotoxy(63,14); readln(np); gotoxy(63,15); readln(ks);
          i:=i+1;
     end;
     if(i <= 3)and(np = user)and(ks=pass)
     then
         login_karyawan:= true
     else
         login_karyawan:= false;
end;


procedure pemasukan_data(var n:integer; var dt_bk:arr_bk);
{i.s:}
{f.s:}

{kamus}
var
    i:integer;

{algoritma}
begin
        
        gotoxy(45,10); writeln('------------------------------');
        gotoxy(45,11); write('  Masukan Banyaknya Data : ');
        gotoxy(45,12); writeln('------------------------------');
        gotoxy(72,11); readln(n);
        clrscr;
        gotoxy(33,3); writeln('-----------------------------------------------------');
        gotoxy(33,4); writeln('                 Pemasukan Data Buku                 ');
        gotoxy(33,5); writeln('-----------------------------------------------------');
        gotoxy(33,6); writeln('| Kode buku |    Nama buku    | Tahun |  Pengarang  |');
        gotoxy(33,7); writeln('-----------------------------------------------------');
        for i := 1 to n do
        begin
            gotoxy(33,7+i); write('|           |                 |       |             |');
            gotoxy(35,7+i); readln(dt_bk[i].kode_bk);
            gotoxy(47,7+i); readln(dt_bk[i].nama_bk);
            gotoxy(65,7+i); readln(dt_bk[i].tahun);
            gotoxy(73,7+i); readln(dt_bk[i].pengarang);
        end; //endfor
        gotoxy(33,8+n); write('-----------------------------------------------------'); readln;
        isi:=0;
        clrscr;    
end; //endprocedure    


procedure menu_pemasukan_data(var isi:integer);
{i.s:}
{f.s:}

{kamus}

{algoritma}
begin
    gotoxy(32,3); writeln('------------------------------------------------------');
    gotoxy(32,4); writeln('| Pemasukan data Hanya bisa di lakukan oleh Karyawan |');
    gotoxy(32,5); writeln('------------------------------------------------------');
    gotoxy(32,6); writeln('                  1. Login Karyawan                   ');
    gotoxy(32,7); writeln('                  0. Keluar                           ');
    gotoxy(32,8); writeln('------------------------------------------------------');
    gotoxy(32,9); write('Daftar Pilihan : '); readln(isi);
    {validasi}
    while(isi < 0) or (isi > 1)do
    begin
        gotoxy(32,10); writeln('Pilihan anda tidak ada di daftar'); readln;
        gotoxy(32,10); clreol;
        gotoxy(49,9); clreol;
        readln(isi);
    end; //endwhile
end; // endprocedure


procedure urut_kode_bk(n:integer; var dt_bk:arr_bk);
{i.s:}
{f.s:}

{kamus}
var
    i,k : integer;
    temp: buku; 
{algoritma}
begin // metode bubble sort
    for i:= 1 to n-1 do
    begin
        for k:= 1 to n-i do
        begin
            if(dt_bk[k].kode_bk > dt_bk[k+1].kode_bk) then
            begin
                temp       := dt_bk[k];
                dt_bk[k]   := dt_bk[k+1];
                dt_bk[k+1] := temp;
            end; //endif
        end; //endfor
    end; //endfor
end; //endprocedure



procedure urut_nama_bk(n:integer; var dt_bk:arr_bk);
{i.s:}
{f.s:}

{kamus}
var
    i,k : integer;
    temp: buku; 
{algoritma}
begin // metode bubble sort
    for i:= 1 to n-1 do
    begin
        for k:= 1 to n-i do
        begin
            if(dt_bk[k].nama_bk > dt_bk[k+1].nama_bk) then
            begin
                temp       := dt_bk[k];
                dt_bk[k]   := dt_bk[k+1];
                dt_bk[k+1] := temp;
            end; //endif
        end; //endfor
    end; //endfor
end; //endprocedure



procedure urut_tahun(n:integer; var dt_bk:arr_bk);
{i.s:}
{f.s:}

{kamus}
var
    i,k,min : integer;
    temp: buku;

{algoritma}
begin // metode selection sort
    for i:= 1 to n-1 do
    begin
        min:= i;
        for k:= 1+i to n do
        begin
            if(dt_bk[k].tahun < dt_bk[min].tahun) then
            begin
                min:= k;
            end; //endif
        end; //endfor
        temp       := dt_bk[i];
        dt_bk[i]   := dt_bk[min];
        dt_bk[min] := temp;
    end; //endfor
end; //endprocedure



procedure urut_pengarang(n:integer; var dt_bk:arr_bk);
{i.s:}
{f.s:}

{kamus}
var
    i,k,min : integer;
    temp: buku;

{algoritma}
begin // metode selection sort
    for i:= 1 to n-1 do
    begin
        min:= i;
        for k:= 1+i to n do
        begin
            if(dt_bk[k].pengarang < dt_bk[min].pengarang) then
            begin
                min:= k;
            end; //endif
        end; //endfor
        temp       := dt_bk[i];
        dt_bk[i]   := dt_bk[min];
        dt_bk[min] := temp;
    end; //endfor
end; //endprocedure



procedure tampil_data_urut(n:integer; dt_bk:arr_bk);
{i.s:}
{f.s:}

{kamus}
var
    i:integer;

{algoritma}
begin
    clrscr;
    gotoxy(33,3); writeln('                 Pengurutan Data Buku                ');
    gotoxy(33,4); writeln('-----------------------------------------------------');
    gotoxy(33,5); writeln('| Kode buku |    Nama buku    | Tahun |  Pengarang  |');
    gotoxy(33,6); writeln('-----------------------------------------------------');
    for i := 1 to n do
    begin
        gotoxy(33,6+i); write('|           |                 |       |             |');
        gotoxy(35,6+i); write(dt_bk[i].kode_bk);
        gotoxy(47,6+i); write(dt_bk[i].nama_bk);
        gotoxy(65,6+i); write(dt_bk[i].tahun);
        gotoxy(73,6+i); write(dt_bk[i].pengarang);
    end; //endfor
    gotoxy(33,7+n); write('-----------------------------------------------------');
    readln;
    clrscr;    
end; //endprocedure    



procedure menu_pengurutan(var urut:integer);
{i.s:}
{f.s:}

{kamus}

{algoritma}
begin
    gotoxy(45,4);  writeln('--------------------------');
    gotoxy(45,5);  writeln('| Pengurutan Berdasarkan |');
    gotoxy(45,6);  writeln('--------------------------');
    gotoxy(45,7);  writeln('|    1. Kode Buku        |');
    gotoxy(45,8);  writeln('|    2. Nama Buku        |');
    gotoxy(45,9);  writeln('|    3. Tahun            |');
    gotoxy(45,10); writeln('|    4. pengarang        |');
    gotoxy(45,11); writeln('|    0. Kembali          |');
    gotoxy(45,12); writeln('--------------------------');
    gotoxy(45,13); write('Daftar pilihan : '); readln(urut);
    {validasi}
    while(urut < 0)or(urut > 4)do
    begin
        gotoxy(45,14); writeln('Pilihan anda tidak ada di daftar'); readln;
        gotoxy(45,14); clreol;
        gotoxy(63,13); clreol;
        readln(urut);
    end; //endwhile
end; //endprocedure



procedure cari_kode_bk(n:integer; var dt_bk:arr_bk);
{i.s:}
{f.s:}

{kamus}
var
    search  : string;
    ketemu  : boolean;
    k,ia,ib : integer;

{algoritma}
begin // metode squensial search dengan boolean
    clrscr;
    gotoxy(43,3); writeln('-----------------------------------');
    gotoxy(43,4); write('  Kode buku Yang di cari : ');
    gotoxy(43,5); writeln('-----------------------------------');
    gotoxy(70,4); readln(search);
    ia:=1;
    ib:=n;
    ketemu:= false;
    while(not ketemu)and(ia <= ib)do
    begin
        k:= (ia+ib) div 2;
        if(search = dt_bk[k].kode_bk)then
            ketemu:= true
        else
            if(search > dt_bk[k].kode_bk)then
                ia:= k+1
            else
                ib:= k-1; //endif
    end; //endwile
    if(ketemu) then
     begin
        gotoxy(33,8);  writeln('                 Pencarian Data Buku                 ');
        gotoxy(33,9);  writeln('-----------------------------------------------------');
        gotoxy(33,10); writeln('| Kode buku |    Nama buku    | Tahun |  Pengarang  |');
        gotoxy(33,11); writeln('-----------------------------------------------------');
        gotoxy(33,12); write('|           |                 |       |             |');
        gotoxy(35,12); write(dt_bk[k].kode_bk);
        gotoxy(47,12); write(dt_bk[k].nama_bk);
        gotoxy(65,12); write(dt_bk[k].tahun);
        gotoxy(73,12); write(dt_bk[k].pengarang);
        gotoxy(33,13); write('-----------------------------------------------------');    
     end    
    else
     begin
        gotoxy(44,6); writeln('Maaf data Yang ada cari tidak Ada');
     end; //endif
     readln;
    clrscr;
end; //endprocedure



procedure cari_pengarang(n:integer; var dt_bk:arr_bk);
{i.s:}
{f.s:}

{kamus}
var
    search  :string;
    ketemu  : boolean;
    i,j,baris : integer;

{algoritma}
begin // metode squensial search dengan boolean
    clrscr;
    gotoxy(43,3); writeln('-----------------------------------');
    gotoxy(43,4); write('  Pengarang Yang di cari : '); 
    gotoxy(43,5); writeln('-----------------------------------');
    gotoxy(70,4); readln(search);
    i:= 1;
    ketemu:= false;
    while(not ketemu)and(i <= n)do
    begin
        if(dt_bk[i].pengarang = search)then
            ketemu:= true
        else
            i:= i+1;
    end; //endwile
    if(ketemu) then
     begin
        gotoxy(33,8);  writeln('               Pencarian Data Pengarang              ');
        gotoxy(33,9);  writeln('-----------------------------------------------------');
        gotoxy(33,10); writeln('| Kode buku |    Nama buku    | Tahun |  Pengarang  |');
        gotoxy(33,11); writeln('-----------------------------------------------------');
        baris:= 11;
        for j:= i to n do
        begin
            if(pos(lowercase(search),lowercase(dt_bk[j].pengarang))>0) then
            begin
                gotoxy(33,baris+1); write('|           |                 |       |             |');
                gotoxy(35,baris+1); write(dt_bk[j].kode_bk);
                gotoxy(47,baris+1); write(dt_bk[j].nama_bk);
                gotoxy(65,baris+1); write(dt_bk[j].tahun);
                gotoxy(73,baris+1); write(dt_bk[j].pengarang);
                baris:= baris+1;
            end; //endif
        end; //endfor
        gotoxy(33,baris+1);
        writeln('-----------------------------------------------------');
     end    
    else
     begin
        gotoxy(44,6); writeln('Maaf data Yang ada cari tidak Ada');
     end; //endif
     readln;
     clrscr;
end; //endprocedure


procedure menu_pencarian(var cari:integer);
{i.s:}
{f.s:}

{kamus}

{algoritma}
begin
    gotoxy(45,4);  writeln('-------------------------');
    gotoxy(45,5);  writeln('| Pencarian Berdasarkan |');
    gotoxy(45,6);  writeln('-------------------------');
    gotoxy(45,7);  writeln('|    1. Kode Buku       |');
    gotoxy(45,8);  writeln('|    2. Pengarang       |');
    gotoxy(45,9);  writeln('|    0. Kembali         |');
    gotoxy(45,10);  writeln('-------------------------');
    gotoxy(45,11); write('Daftar pilihan : '); readln(cari);
    {validasi}
    while(cari < 0)or(cari > 2)do
    begin
        gotoxy(45,12); writeln('Pilihan anda tidak ada di daftar'); readln;
        gotoxy(45,12); clreol;
        gotoxy(73,11); clreol;
        readln(cari);
    end; //endwhile
end; //endprocedure


procedure peminjaman(n:integer; var dt_bk:arr_bk);
{i.s:}
{f.s:}

{kamus}
var
    jumlah,i,k,baris : integer;
    ketemu           : boolean;
    search           : string;
    sisa,konversi    : integer;
{algoritma}
begin
    clrscr;
    gotoxy(33,3);  writeln('Peminjaman Buku Perpustakaan Bapusipda Bandung');
    gotoxy(33,5);  writeln('            Masukan Identitas Anda            ');
    gotoxy(33,6);  writeln('----------------------------------------------');
    gotoxy(33,7);  writeln(' Nama Lengkap  : ');
    gotoxy(33,8);  writeln(' Jenis Kelamin : ');
    gotoxy(33,9);  writeln(' Alamat        : ');
    gotoxy(33,10); writeln('----------------------------------------------');
    gotoxy(50,7);  readln(dt_agt.nama);
    gotoxy(50,8);  readln(dt_agt.kelamin);
    gotoxy(50,9);  readln(dt_agt.alamat);
    
    gotoxy(33,12);  write('Jumlah Buku Yang di Pinjam : '); readln(jumlah);
    //validasi
    while(jumlah > 3)do
    begin    
        gotoxy(33,13); writeln('Maaf Jumlah Peminjaman tidak boleh lebih dari 3'); readln;
        gotoxy(33,13); clreol;
        gotoxy(62,12); clreol;
        readln(jumlah);
    end;

    gotoxy(30,13); writeln('-----------------------------------------------------');
    gotoxy(30,14); writeln('| Kode buku |    Nama buku    | Tahun |  Pengarang  |');
    gotoxy(30,15); writeln('-----------------------------------------------------');
        for i:= 1 to jumlah do
        begin
            repeat
                gotoxy(30,15+i); write('|           |                 |       |             |');
                gotoxy(32,15+i); readln(search);
                ketemu:=false;
                k:= 1;
                while(dt_bk[k].kode_bk <> search) and (k < n)do
                begin
                    k:= k+1;
                end; //endwile
                if(dt_bk[k].kode_bk = search) then
                 begin
                    gotoxy(44,15+i); write(dt_bk[k].nama_bk);
                    gotoxy(62,15+i); write(dt_bk[k].tahun);
                    gotoxy(70,15+i); write(dt_bk[k].pengarang);
                    ketemu:= true;    
                end
                else
                 begin
                    gotoxy(44,15+i); write('Maaf Kode buku Yang anda cari tidak Ada'); readln;
                    gotoxy(32,15+i); clreol;
                 end; //endif 
            until ketemu=true;
            gotoxy(30,16+i); writeln('-----------------------------------------------------');
            baris:= 18+i;                     
        end; //endfor

    gotoxy(44,baris+1); writeln('Tanggal Peminjaman buku');
    gotoxy(40,baris+2); writeln('-------------------------------');
    gotoxy(44,baris+3); writeln(' Contoh 10 - 1 - 2017  ');  
    gotoxy(44,baris+4); writeln('-----------------------');
    gotoxy(44,baris+5); writeln('| Tgl | Bulan | Tahun |');
    gotoxy(44,baris+6); writeln('-----------------------');
    gotoxy(44,baris+7); writeln('|     |       |       |');
    gotoxy(44,baris+8); writeln('-----------------------');
    gotoxy(47,baris+7); readln(dt_pinjam.tgl);
    gotoxy(54,baris+7); readln(dt_pinjam.bulan);
    gotoxy(60,baris+7); readln(dt_pinjam.tahun);
    
    konversi:= ((dt_pinjam.tahun * 365) + (dt_pinjam.bulan * 30) + dt_pinjam.tgl + 14);
    dt_pinjam.tahun:= konversi div 365;
    sisa           := konversi mod 365;
    dt_pinjam.bulan:= sisa div 30;
    dt_pinjam.tgl  := sisa mod 30;
    gotoxy(39,baris+10);  writeln(' Terima kasih Atas Kunjungannya ');
    gotoxy(23,baris+11);  writeln(' Batas Akhir Pengembalian buku Tanggal: ',dt_pinjam.tgl,',  bulan: ',dt_pinjam.bulan,', Tahun: ',dt_pinjam.tahun);
    gotoxy(18,baris+12);  writeln(' Note : jika buku terlambat di kembalikan, Maka di Denda, 1 buku perhari Rp.300 ');
    readln;
end;   


procedure konversi_tgl(dt_pinjam:pinjam; dt_kembali:kembali; jumlah_kembali:integer);
{i.s:}
{f.s:}

{kamus}
var
    konversi1,konversi2 :integer;
    hasil,denda         :integer;

{algoritma}
begin
    konversi1:= ((dt_pinjam.tahun * 365) + (dt_pinjam.bulan * 30) + dt_pinjam.tgl);
    konversi2:= ((dt_kembali.tahun * 365) + (dt_kembali.bulan * 30) + dt_kembali.tgl);
    hasil    := konversi2 - konversi1;
    if(hasil > 14)then
    begin
        hasil:= hasil - 14;
        denda:= 300 * jumlah_kembali * hasil;
        gotoxy(38,31); writeln(' !!! Pengembalian Buku Telat ',hasil,' Hari  !!!');
        gotoxy(43,32); writeln('Dendanya : Rp.',denda);
    end 
    else
    begin
        gotoxy(35,31); writeln('Terima Kasih Telah Mengembalikan Buku Tepat Waktu');
    end; //endif
end; //endprocedure


procedure Pengembalian(var dt_pinjam:pinjam; var dt_kembali:kembali; var jumlah_kembali:integer);
{i.s:}
{f.s:}

{kamus}
var    
    i,baris : integer;
    
{algoritma}
begin
    clrscr;
    gotoxy(33,3);  writeln('Pengembalian Buku Perpustakaan Bapusipda Bandung');
    gotoxy(33,5);  writeln('             Masukan Identitas Anda             ');
    gotoxy(33,6);  writeln('------------------------------------------------');
    gotoxy(33,7);  writeln(' Nama Lengkap  : ');
    gotoxy(33,8);  writeln(' Jenis Kelamin : ');
    gotoxy(33,9);  writeln(' Alamat        : ');
    gotoxy(33,10); writeln('------------------------------------------------');
    gotoxy(50,7);  readln(dt_agt.nama);
    gotoxy(50,8);  readln(dt_agt.kelamin);
    gotoxy(50,9);  readln(dt_agt.alamat);
    
    gotoxy(33,12);  write('Jumlah Buku Yang di kembalikan : '); readln(jumlah_kembali);
    //validasi
    while(jumlah_kembali > 3)do
    begin    
        gotoxy(33,13); writeln('Maaf Jumlah Peminjaman tidak boleh lebih dari 3'); readln;
        gotoxy(33,13); clreol;
        gotoxy(66,12); clreol;
        readln(jumlah_kembali);
    end;
    gotoxy(52,14); writeln('-------------');
    gotoxy(52,15); writeln('| Kode buku |');
    gotoxy(52,16); writeln('-------------');
    for i:= 1 to jumlah_kembali do
    begin
        gotoxy(52,16+i); write('|           |');
        gotoxy(54,16+i); readln; 
    end;
    gotoxy(52,17+i); writeln('-------------');
    baris:= 19+i;
    gotoxy(30,baris+1); writeln('Tanggal Peminjaman buku');
    gotoxy(26,baris+2); writeln('-------------------------------');
    gotoxy(30,baris+3); writeln(' Contoh 10 - 1 - 2017  ');  
    gotoxy(30,baris+4); writeln('-----------------------');
    gotoxy(30,baris+5); writeln('| Tgl | Bulan | Tahun |');
    gotoxy(30,baris+6); writeln('-----------------------');
    gotoxy(30,baris+7); writeln('|     |       |       |');
    gotoxy(30,baris+8); writeln('-----------------------');

    gotoxy(64,baris+1); writeln('Tanggal Pengembalian buku');
    gotoxy(60,baris+2); writeln('-------------------------------');
    gotoxy(64,baris+3); writeln(' Contoh 24 - 1 - 2017  ');  
    gotoxy(64,baris+4); writeln('-----------------------');
    gotoxy(64,baris+5); writeln('| Tgl | Bulan | Tahun |');
    gotoxy(64,baris+6); writeln('-----------------------');
    gotoxy(64,baris+7); writeln('|     |       |       |');
    gotoxy(64,baris+8); writeln('-----------------------');

    gotoxy(32,baris+7); readln(dt_pinjam.tgl);
    gotoxy(40,baris+7); readln(dt_pinjam.bulan);
    gotoxy(46,baris+7); readln(dt_pinjam.tahun);

    gotoxy(66,baris+7); readln(dt_kembali.tgl);
    gotoxy(74,baris+7); readln(dt_kembali.bulan);
    gotoxy(80,baris+7); readln(dt_kembali.tahun);

    konversi_tgl(dt_pinjam,dt_kembali,jumlah_kembali);
    readln;      
end;

procedure menu_perpus(var pilihan:integer);
{i.s:}
{f.s:}

{kamus}

{algoritma}
begin
    gotoxy(38,3);  writeln('============================================');
    gotoxy(38,4);  writeln('|              Selamat Datang              |');
    gotoxy(38,5);  writeln('--------------------------------------------');
    gotoxy(38,6);  writeln('|      Perpustakaan Bapusipda Bandung      |');
    gotoxy(38,7);  writeln('--------------------------------------------');
    gotoxy(38,8);  writeln('|****         1. Pemasukan Data        ****|');
    gotoxy(38,9);  writeln('|**           2. Pengurutan              **|');
    gotoxy(38,10); writeln('|*            3. Pencarian                *|');
    gotoxy(38,11); writeln('|*            4. Peminjaman               *|');
    gotoxy(38,12); writeln('|**           5. Pengembalian            **|');
    gotoxy(38,13); writeln('|****         0. Keluar                ****|');
    gotoxy(38,14); writeln('--------------------------------------------');
    gotoxy(38,15); write('Daftar Pilihan : '); readln(pilihan);
    {validasi}
    while(pilihan < 0) or (pilihan > 5)do
    begin
        gotoxy(38,16); writeln('Pilihan anda tidak ada di daftar'); readln;
        gotoxy(38,16); clreol;
        gotoxy(55,15); clreol;
        readln(pilihan);
    end; //endwhile
end; //endprocedure




{algoritma utama}
begin 
    repeat    
        clrscr;
        menu_perpus(pilihan);
        clrscr;
        case(pilihan)of
            1 : begin
                    repeat
                        menu_pemasukan_data(isi);
                        case(isi) of
                            1 : begin
                                    gotoxy(45,12); writeln('           LOGIN           ');
                                    gotoxy(45,13); writeln('---------------------------');
                                    gotoxy(45,14); write(' Nama pengguna  : ');  readln(np);
                                    gotoxy(45,15); write(' kata Sandi     : ');  readln(ks);
                                    gotoxy(45,16); writeln('---------------------------');
                                    if(login_karyawan(np,ks))then //login succes
                                     begin
                                        clrscr;
                                        pemasukan_data(n,dt_bk);
                                     end
                                    else
                                        begin
                                            gotoxy(45,17); write('maaf,sudah 3 kali salah login'); readln;
                                            gotoxy(45,17); clreol; gotoxy(45,16); clreol; 
                                            gotoxy(45,15); clreol; gotoxy(45,14); clreol; 
                                            gotoxy(45,13); clreol; gotoxy(45,12); clreol;
                                            gotoxy(49,9); clreol;
                                        end; //endif
                                end; //endcase
                        end; //endcase
                    until(isi=0);
                end; //endcase
            2 : begin
                    repeat
                        menu_pengurutan(urut);
                        case(urut)of
                            1 : begin
                                    urut_kode_bk(n,dt_bk);
                                    tampil_data_urut(n,dt_bk);
                                end;
                            2: begin
                                    urut_nama_bk(n,dt_bk);
                                    tampil_data_urut(n,dt_bk);
                                end;
                            3: begin
                                    urut_tahun(n,dt_bk);
                                    tampil_data_urut(n,dt_bk);
                                end;
                            4: begin
                                    urut_pengarang(n,dt_bk);
                                    tampil_data_urut(n,dt_bk);
                                end;
                        end; //endcase
                    until(urut=0);
                end;
            3 : begin
                    repeat
                        menu_pencarian(cari);
                        case(cari)of
                            1: begin
                                    cari_Kode_bk(n,dt_bk);    
                                end;
                            2: begin
                                    cari_pengarang(n,dt_bk);
                                end;
                        end; //endcase
                    until(cari=0);    
                end;
            4 : begin
                    peminjaman(n,dt_bk);
                end;
            5 : begin
                    Pengembalian(dt_pinjam,dt_kembali,jumlah_kembali);         
                end;
        end; //endcase
    until(pilihan = 0);    
end.
