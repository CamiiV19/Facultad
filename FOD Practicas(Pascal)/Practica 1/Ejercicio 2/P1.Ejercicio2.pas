{2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
creado en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el
promedio de los números ingresados. El nombre del archivo a procesar debe ser
proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
contenido del archivo en pantalla.}

program ejercicio2;
type
	archivo_entero = file of Integer;
var
	aEnteros : archivo_entero;
	nomArch : String;
	num, cant, suma : integer;
	promedio: real;
Begin
	num:= 0; cant:= 0; suma:= 0; promedio:= 0;
	writeln('Ingrese el nombre del archivo');
	readln(nomArch);
	Assign(aEnteros, nomArch + '.dat');//vinculo
	Reset(aEnteros);//abro para leer
	WriteLn('Contenido del archivo:');
	while (not eof(aEnteros)) do begin
		read(aEnteros, num);
		WriteLn(num);// Mostrar el número en pantalla
		if(num < 1500) then begin
			cant:= cant + 1;
			suma:= suma + num;
		end;
	end;
	close(aEnteros);
	if (cant > 0) then begin
		promedio:= suma/cant;
		writeln('El promedio de los nros menores a 1500 es: ', promedio:0:2);
	end
	else
		writeln('No hay nros menores a 1500.');
End.
	
