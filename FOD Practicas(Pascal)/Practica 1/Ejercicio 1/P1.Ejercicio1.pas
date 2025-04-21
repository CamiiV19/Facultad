{1. Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita
incorporar datos al archivo. Los números son ingresados desde teclado. La carga finaliza
cuando se ingresa el número 30000, que no debe incorporarse al archivo. El nombre del
archivo debe ser proporcionado por el usuario desde teclado.
}

program ejercicio1;
type
    archivo_entero = file of Integer;
var
    aEnteros: archivo_entero;
    nomArchivo : String;
    numero : Integer;
BEGIN
    Write('Ingrese el nombre del archivo: ');
    ReadLn(nomArchivo);

    Assign(aEnteros, nomArchivo + '.dat');
    Rewrite(aEnteros);

    WriteLn('Ingrese un numero entero:');
    ReadLn(numero);
    while (numero <> 3000) do begin
        write(aEnteros, numero);
        writeLn('Ingrese un numero entero');
        readLn(numero);
    end;
    Close(aEnteros);
    //para verificar si se cargo correctamente
    WriteLn('Programa finalizado.');
    Reset(aEnteros);  // Abrir el archivo para lectura
    WriteLn('Contenido del archivo:');
    while (not EOF(aEnteros)) do begin
        Read(aEnteros, numero);
        WriteLn(numero);  // Mostrar el número leído
    end;
    Close(aEnteros);
END.
