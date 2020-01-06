program array_satu_dimensi;
{i.s:}
{f.s:}

{kamus}
    const 
        max=20;
    type
        larik= array[1..max] of string;
    var
        nama:larik;
        n,i: integer;
    
{algoritma}
begin
    write('Masukan banyak data :'); readln(n);
    for i:= 1 to n do
    begin
        write('masukan nama : '); readln(nama[i]);
    end;
    for i:= 1 to n do
        writeln('namanya adalah : ',nama[i]);
    readln;
end.