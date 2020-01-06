program searching;

{kamus}
const
    max_arr= 10;
type
    v_arr= array[1..max_arr]of string;
var
    nama    : v_arr;
    n       : integer;
    data    : string;

procedure isi_data(var n:integer; var nama:v_arr);

{kamus}
var
    i :integer;

{algoritma}
begin
    write('Banyaknya data : '); readln(n);
    for i := 1 to n do
    begin
        write('Nama : '); readln(nama[i]);
    end; //endfor
end; // endprocedure


procedure tampil_data(n:integer; var nama:v_arr);

{kamus}
var
    i :integer;

{algoritma}
begin
    for i := 1 to n do
    begin
        write('Nama : '); writeln(nama[i]);
    end; //endfor
end; // endprocedure


procedure squensial(n:integer; data:string; nama:v_arr);

{kamus}
var

{algoritma}
begin
    i:=1;
    ketemu:= false;
    while(not ketemu)and(i<=n)do
    begin
        if(nama[i]=data)then
            
begin
    isi_data(n,nama);
    writeln('---------------------------------');
    tampil_data(n,nama);
    writeln('---------------------------------');
    repeat
        write('Cari data : '); readln(data);
        squensial(n,data,nama);
        readln;
    until(data='a');
end.