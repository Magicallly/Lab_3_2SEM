program queens;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  N=8;

type
  TNumber = array [1..N] of boolean;
  MainDiag = array [2..N*2] of boolean;
  SideDiag = array[1-N..N-1] of boolean;
  QueensArr = array[1..N] of Integer;

var
  Col: TNumber;
  MD: MainDiag;
  SD: SideDiag;
  Q: QueensArr;
  Num: Byte;


procedure writeQ(QA: QueensArr);
var
   i,j:integer;

begin

  Writeln('Number ', Num);
  for i:=1 to N do
  begin
    for j := 1 to N do
    begin
      if (Q[i] = j) then
        write('Q':2)
      else
        write('-':2);
    end;
    writeln;
  end;
  writeln;
  Inc(num);
end;


procedure setQ(i,j:integer);
begin
  Q[i] := j;
  Col[j]:=false;
  MD[i+j]:=false;
  SD[i-j]:=false;
end;


procedure RemoveQ(i,j:integer);
begin
  Col[j]:=true;
  MD[i+j]:=true;
  SD[i-j]:=true;
end;


procedure tryQueen(i:integer);
var
    j:integer;
begin
  for j:=1 to N do
    if Col[j] and MD[i+j] and SD[i-j] then
      begin
        setQ(i,j);
        if i<N then
          tryQueen(i+1)
        else
          writeQ(Q);
        RemoveQ(i,j);
      end;
end;


procedure cleanArrays;
var
  i:integer;
begin
  for i:=1 to N do
    Col[i]:=true;
  for i:=2 to N*2 do
    MD[i]:=true;
  for i:= (1-N) to (N-1) do
    SD[i]:=true;
end;

begin
  Num := 1;
  cleanArrays;
  tryQueen(1);
   readln;
end.




