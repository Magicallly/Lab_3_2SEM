program lab3;

{$APPTYPE CONSOLE}

const
  N = 2000;

Type
  Tmas = array [1 .. N] of integer;

var
  mas, mas1, mas2, mas3: Tmas;
  sravn_bubble, zamen_bubble, k, sravn_sort, zamen_sort, g, sravn_quick,zamen_quick: integer;

procedure Table(size: integer; arrtype: string; sravnB, zamenB, sravnS, zamenS, QC, QE: integer);
  begin
    Writeln('| ', size:4, ' эл. |', '':15, '|', '':15, '|', '':15, '|', '':15, '|', '':15, '|', '':15, '|');
    Writeln('| ', arrtype:9, '|', sravnB:10, '':5, '|', zamenB:10,'':5, '|', sravnS:10, '':5, '|', zamenS:10, '':5, '|',QC:10,'':5, '|',QE:10,'':5, '|');
    Writeln('|----------|---------------|---------------|---------------|---------------|---------------|---------------|');
  end;

Procedure NewAr(var M: Tmas; const size: integer);
var
  i: integer;
begin
  for i := 1 to size do // Цикл А (С параметром, простой, реализован с помощью оператора FOR)
      begin
          randomize;
          M[i] := Random(100);
      end;
end;

Procedure Swap(var A, B: integer); // Процедура замены одного элемента другим
var
  temp: integer;
begin
  temp := A;
  A := B;
  B := temp;
end;

procedure BubbleSort (var M1: Tmas; var  comparison, exchange: integer; const size: integer); // Пузырьковая сортировка с флажком
var
  i, j: integer;
  flag: boolean;
    begin
       flag := true;
       i := 1;
       exchange := 0;
       comparison := 0;
       while flag do // Цикл B (Итерационный, сложный, внешний с предусловием, реализован с помощью оператора WHILE)
         begin
            flag := false;
            for j := size - 1 downto i do // Цикл C (С параметром, простой, вложенный, реализован с помощью оператора FOR)
                begin
                  if M1[j] > M1[j + 1] then
                      begin
                        Swap(M1[j], M1[j + 1]);
                        flag := true;
                        inc(exchange,3);
                      end;
                  inc(comparison);
                 end;
          inc(i);
         end;
    end;

 procedure Sort2(var M2:Tmas; var  сomparison, exchange, Number:integer); // процедура сортировки прямым выбором
var
i,j,min:integer;
begin
  сomparison:=0;
  exchange:=0;
  for i := 1 to Number-1 do // Цикл D (С параметром, сложный, внешний(с предусловием), реализован с помощью оператора FOR)
    begin
      min:=i;
      for j := i+1 to Number do  // Цикл E (С параметром, простой, вложенный, реализован с помощью оператора FOR)
        begin
         inc(сomparison);
         if(M2[j]<M2[min])then min:=j;
        end;
      Swap(M2[i],M2[min]);
      inc(exchange,3);
    end;
end;

procedure QuickSort( var M:TMAS; var comparison, exchange: integer; const number: integer);
Procedure QSort(L,R: Integer);
var
  I,J,X:Integer;
begin
  I:=L;
  J:=R;
  X:=M[(L+R) div 2];
  repeat
    while M[I]<X do
    begin
      Inc (I);
      inc(comparison);
    end;

    while M[J]>X do
    begin
      Dec (J);
      Inc(Comparison);
    end;

    if I<=J then
    begin
      SWAP(M[i],M[j]);
      Inc(exchange);
      Inc (I);
      Dec (J);
    end;

  until I>J;
  if J>L then
    QSort(L,J);

  if I<R then
    QSort(I,R);

end;
begin
  Comparison:= 0;
   Exchange :=0;
  QSort (1,number);
end;

procedure Reverse(var M3: Tmas; size: integer);
var
  i, temp: integer;
begin
  for i := 1 to (size div 2) do   // Цикл F (С параметром, простой, реализован с помощью оператора FOR)
  begin
    temp := M3[i];
    M3[i] := M3[size - i + 1];
    M3[size - i + 1] := temp;
  end;
end;

begin
  Writeln('------------------------------------------------------------------------------------------------------------');
  Writeln('|          |      Улучшенный пузырек       |   Сортировка прямым выбором   |       Быстрая сортировка      |');
  Writeln('|    Тип   |---------------|---------------|---------------|---------------|---------------|---------------|');
  Writeln('|  массива |     Число     |     Число     |     Число     |     Число     |     Число     |     Число     |');
  Writeln('|          |   сравнений   |    обменов    |   сравнений   |    обменов    |   сравнений   |    обменов    |');
  Writeln('|----------|---------------|---------------|---------------|---------------|---------------|---------------|');

   for g := 1 to 3 do // Цикл G (С параметром, простой, реализован с помощью оператора FOR)
  begin
    k := 0;
    case g of
      1:
        k := 10;
      2:
        k := 100;
      3:
        k := 2000;
    end;

    NewAr(mas, k);
    mas1 := mas;
    mas2 := mas;
    mas3 := mas;

    BubbleSort(mas2, sravn_bubble, zamen_bubble, k);
    Sort2(mas1, sravn_sort, zamen_sort, k);
    QuickSort(mas3,sravn_quick,zamen_quick, k);

    Table(k, 'неотсорт.', sravn_bubble, zamen_bubble, sravn_sort, zamen_sort, sravn_quick ,zamen_quick);

    BubbleSort(mas2, sravn_bubble, zamen_bubble, k);
    Sort2(mas1, sravn_sort, zamen_sort, k);
    QuickSort(mas3,sravn_quick,zamen_quick, k);

    Table(k, 'отсорт.  ', sravn_bubble, zamen_bubble, sravn_sort, zamen_sort, sravn_quick,zamen_quick);

    Reverse(mas3, k);
    Reverse(mas2, k);
    Reverse(mas1, k);

    BubbleSort(mas2, sravn_bubble, zamen_bubble, k);
    Sort2(mas1,  sravn_sort, zamen_sort, k);
    QuickSort(mas3,sravn_quick,zamen_quick, k);

    Table(k, 'обр. пор.', sravn_bubble, zamen_bubble, sravn_sort, zamen_sort, sravn_quick,zamen_quick);

  end;

  readln;
end.
