{2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
creado en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el
promedio de los números ingresados. El nombre del archivo a procesar debe ser
proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
contenido del archivo en pantalla.}

program ejercicio2;
type
    archivo_entero = file of Integer;

var
    aEnteros: archivo_entero;
    nomArch: string;
    num, cantT, cantMenores, suma: integer;

Begin
    cantT := 0; suma := 0; cantMenores := 0;
    
    writeln('Ingrese el nombre del archivo (del ej1):');
    readln(nomArch);
    
    Assign(aEnteros, nomArch + '.dat'); {Vincular el archivo}
    Reset(aEnteros); {Abrir el archivo para lectura}
    writeln('Contenido del archivo:');
    
    while (not eof(aEnteros)) do 
    begin
        read(aEnteros, num);
        writeln(num); {Mostrar cada número en pantalla}
        
        { Contar cuántos son menores a 1500 }
        if (num < 1500) then 
            cantMenores := cantMenores + 1;
        
        { Contar el total de números y sumarlos para el promedio }
        cantT := cantT + 1;
        suma := suma + num;
    end;

    close(aEnteros); {Cerrar el archivo}

    if (cantT > 0) then 
    begin
        writeln('Cantidad de numeros menores a 1500: ', cantMenores);
        writeln('El promedio total: ', suma/cantT:0:2);
    end
    else
        writeln('No hay números menores a 1500.');
End.
	
