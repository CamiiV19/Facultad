{3. a. Crear un archivo de registros no ordenados de empleados y completarlo con
datos ingresados desde teclado. De cada empleado se registra: número de
empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con
DNI 00. La carga finaliza cuando se ingresa el String ‘fin’ como apellido.}

program ejercicio3a;
type
	Empleado = record
		nro_emp: integer;
		ape: string;
		nom: string;
		edad: integer;
		dni: integer;
	end;
	
	archivo_emp = file of Empleado;

procedure leer (var reg: Empleado);
begin
	write('Ingrese apellido: ');
	readln(reg.ape);
	if(reg.ape <> 'fin') then begin 
		write('Ingrese nombre: ');
		read(reg.nom);
		write('Ingrese edad: ');
		readln(reg.edad);
		write('Ingrese dni: ');
		readln(reg.dni);
		write('Ingrese codigo empleado: ');
		readln(reg.nro_emp); 
	end;    
end;

var
	arch: archivo_emp;
	reg: Empleado;
	nomArch: string;
begin
	write('Ingrese el nombre del archivo ');
	readln(nomArch);
	Assign(arch, nomArch + '.dat');
	rewrite(arch);
	leer(reg);
	while(reg.ape <> 'fin') do begin
		write(arch, reg);
		leer(reg);
	end;
	close(arch);
end.
