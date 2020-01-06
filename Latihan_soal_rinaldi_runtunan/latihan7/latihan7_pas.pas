program menampilkan_suku_n;
{i.s : user mendefinisikan suku ke n}
{f.s : menampilkan hasil suku ke n}

{Kamus Global}
var
n:integer;


// input
procedure input_suku;
{i.s: user mamasukan nilai n}
{f.s: mengeluarkan  nilai n}

{kamus}

{algoritma}
begin
   write('masukan suku ke n : '); readln(n);
end;

// proses
function suku_n(n:integer):integer;
{i.s: nilai n sudah terdefinisi}
{f.s: menampilkan suku ke n}

{kamus}

{algoritma}
begin
    if(n=1)
      then
        suku_n:= 3
      else
        if(n=2)
          then
            suku_n:=5
          else 
            if(n mod 2=1)
              then
                suku_n:= suku_n(n-2)*suku_n(n-1)
              else
                suku_n:= suku_n(n-2)+suku_n(n-1);

              
end;


//proses
procedure tampil_suku(n:integer);
{i.s :}
{f.s :}

{kamus}

{algoritma}
begin
    writeln('suku ke n : ',suku_n(n));
end;


{algoritma utama}
begin

    input_suku;
    tampil_suku(n);
    readln;
end.
