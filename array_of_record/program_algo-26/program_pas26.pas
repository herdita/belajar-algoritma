program array_dua_dimensi;
{i.s:}
{f.s:}
uses crt;

{kamus}
    const
        maks_colom= 4;
        maks_baris= 4;
    type
        data = array[1..maks_baris,1..maks_colom] of string;
    var
        nama      :data;
        i,j,n,m   :integer;

{algoritma}
begin
    write('masukan data baris : '); readln(n);
    write('masukan data colom : '); readln(m);
    writeln('--------------------------------------------');
    for i := 1 to n do
    begin
        writeln('Nama  :      |       |       |');
        for j := 1 to m do
        begin
            gotoxy(8*j,3+i); readln(nama[i,j]);
        end; {endprocedure}
    end; {endprocedure}

    for i := 1 to maks_baris do
    begin;
        for j := 1 to maks_colom do
        begin
            write(nama[i,j]);
        end;
    end;
end.