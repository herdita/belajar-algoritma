program menjumlahan_deret;
{i.s:}
{f.s:}

{kamus global}
var
i,n,jumlah:integer;


procedure versi_for;
{i.s: user memasukan nilai n}
{f.s: mencetak hasil dari nilai n}

{kamus lokal}

{algoritma}
begin
    write('masukan nilai n : '); readln(n);
    jumlah := 0;
    for i := 1 to n do
      begin
       write(i,' + ');
       jumlah:= jumlah + i;
      end;
    write(jumlah);
end;


procedure versi_while;
{i.s:}
{f.s:}

{kamus global}

{algoritma}
begin
    write('masukan nilai n : '); readln(n);
    jumlah:= 0;
    i:= 1;
    while(i <= n)do
      begin
        write(i,' + ');
        jumlah:= jumlah + i;
        i:= i + 1;
      end;
    write(jumlah);
end;


procedure versi_repeat;
{i.s:}
{f.s:}

{kamus lokal}

{algoritma}
begin
    write('masukan nilai n : '); readln(n);
    jumlah:= 0;
    i:= i + i;
    repeat
      begin 
        write(i,' + ');
        jumlah:= jumlah + i;
        i:= i + 1;
      end;
    until(i>n);
    write(jumlah);
end;

{algoritma utama}
begin
    versi_for;
    versi_while;
    versi_repeat;
end.