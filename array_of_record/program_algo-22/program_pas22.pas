program latihan_array;
{i.s: memberikan nilain harga pada nilai}
{f.s: menampilkan harga nilai}

{kamus}
    const
        max=10;
    type
        larik1=array[1..max]of integer;
    var
        nilai:larik1;
        

{algoritma}
begin
    nilai[1]:= 10;
    nilai[2]:= 20;
    nilai[3]:= 30;
    write('| nilai 1 = ',nilai[1],'| nilai 2 = ',nilai[2],'| nilai 3 = ',nilai[3]);
    readln;
end.