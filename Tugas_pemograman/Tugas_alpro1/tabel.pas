program tabel;
uses crt;
var
    nama,nim,indeks:string;
    i,nilai:integer;

function idx(na:integer):char;
{i.s:}
{f.s:}

{kamus}

{algoritma}
begin
    case(na)of
        80..100:idx:='a';
        70..79 :idx:='b';
        60..69 :idx:='c';
        50..59 :idx:='d';
        0..49  :idx:='e';
    end;
end;

begin


    writeln('---------------------------------');
    gotoxy(1,2);write('|No');
    gotoxy(4,2);write('|Nama');
    gotoxy(20,2);write('|Nim');
    gotoxy(27,2);write('|Nilai');
    gotoxy(33,2);write('|Indeks');
    gotoxy(40,2);write('|');
    for i:= 1 to 10 do
    begin
    gotoxy(1,2+i);write('|');writeln(i);
    gotoxy(4,2+i);write('|');readln(Nama);
    gotoxy(20,2+i);write('|');readln(nim);
    gotoxy(27,2+i);write('|');readln(Nilai);
    indeks:=idx(nilai);
    gotoxy(33,2+i);write('|');writeln(indeks);
    gotoxy(40,2+i);write('|');
    end;

    
end.