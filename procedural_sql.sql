
-- on oracle live server, you cannot take user input, so don't give &values.
-- program to find the sum of two numbers

declare
a int;
b int;
c int;

begin
a:= &a;
b:= &b;
c:= a + b;
dbms_output.put_line('Sum of a and b : ' || c);
end;







-- Greatest of two numbers

declare 
a int;
b int;

begin

a:= &a;
b:= &b;

if (a > b) 
then 
dbms_output.put_line('a is greater : ' || a);
else 
dbms_output.put_line('b is greater : ' || b);
end if;

end;







-- for loop

-- Set serveroutput on  -- (for oracle server)

declare

a number(2);

begin

for a in 0..10
loop
dbms_output.put_line(a);
end loop;

end;








-- while loop

declare 

a int;
b int;

begin

a:= 0;
b:= &b;

while a<b 
loop
a := a + 1;
dbms_output.put_line(a);
end loop;

end;