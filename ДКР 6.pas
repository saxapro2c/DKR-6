uses crt;
const
MAX_SIZE = 5;
type
List = array[1..MAX_SIZE] of record
next: integer;
data: integer;
end;

var
lit: List;
head, tail: integer;

procedure deleteNode;
begin
if head = tail then
writeln('List is empty')
else
begin
lit[head].data := 0;
head := lit[head].next;
end;
end;

procedure addNode(a: integer);
var
i: integer;
begin
if (tail + 1) mod MAX_SIZE = head then begin
deleteNode;
i:=i-1;
addNode(a);
end
else
begin
i := tail + 1;
if i = MAX_SIZE then 
begin
deleteNode;
i:=1;
end;
lit[i].data := a;
lit[tail].next := i;
tail := i;
end;
end;


procedure printList;
var
i: integer;
begin
writeln('List:');
i := head;
while i <> tail do
begin
write(lit[i].data, ' ');
i := lit[i].next;
end;
write(lit[i].data);
writeln;
end;

procedure printList1;
var
i: integer;
begin
writeln('List:');
i := head;
while i <> tail do
begin
write(lit[i].data, ' ');
i := lit[i].next;
end;
write(lit[i].data);
writeln;
end;

var
choice: integer;
a: integer;

begin
head := 1;
tail := 1;

repeat
writeln('1. Добавить узел');
writeln('2. Удалить узел');
writeln('3. Вывести');
writeln('4. Выйти');
write('Выбери на чьей стороне ты: ');
readln(choice);

case choice of
1: begin
write('Введите значение: ');
readln(a);
addNode(a);
{ClrScr;}
end;
2: begin deleteNode; {ClrScr;} end;
3: printList;
4: exit;
else writeln('Не тот выбор');
end;
until choice = 4;
end.
