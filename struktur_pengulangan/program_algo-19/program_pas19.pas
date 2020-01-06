program penjumlahan_deret;
{i.s: user memasukan nilai n}
{f.s: mencetak jumlah hasil dari nilai n}

{kamus}
var
i,jumlah,n:integer;

{algoritma}
begin
    {input}
    write('masukan nilai n : '); readln(n);
    {proses}
    jumlah:= 0;
    for i:= 1 to n do
      begin
        write(i,' + ');
        jumlah:= jumlah + i;
      end;
    {output}
    writeln('jumlah : ',jumlah);
end.