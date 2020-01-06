program data_buku;
{i.s:}
{f.s:}
uses crt;

{kamus}
const
    user= 'herdita';
    pass= '10116136';


procedure login;
{i.s:}
{f.s:}

{kamus}
var
    pengguna:string;
    sandi   :string;
    n       :integer;

{algortima}
begin
    n:=0;
    repeat
        gotoxy(20,5); writeln('----------------L O G I N----------------');
        gotoxy(20,6); writeln('=========================================');
        gotoxy(33,8); write('User : '); readln(pengguna);
        gotoxy(33,10); write('Pass : '); readln(sandi);
        gotoxy(20,12); writeln('========================================='); 
        
        
        if(sandi=pass) and (pengguna=user) then
        begin
            gotoxy(33,8); clreol;
            gotoxy(33,10); clreol;
            gotoxy(33,9); writeln('Akses Di terima');
            gotoxy(26,10); write('Selamat datang di Program kami');
            n:=4;
        end;

        if(sandi<>pass) or (pengguna<>user) then
        begin
            clrscr;
            gotoxy(20,5); writeln('----------------L O G I N----------------');
            gotoxy(20,6); writeln('=========================================');
            gotoxy(20,12); writeln('=========================================');
            gotoxy(28,9); write('Maaf User dan sandi salah !');
            gotoxy(28,10); write('Kesempatan Anda ',3-n,' kali lagi'); readln;
            gotoxy(28,9); clreol;
            gotoxy(28,10); clreol;
            n:=n+1;            
        end;
    until n>3;
end;

{algortima utama}
begin
    login;
    readln;
end.
