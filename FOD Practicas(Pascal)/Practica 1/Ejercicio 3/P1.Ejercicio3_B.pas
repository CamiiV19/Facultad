program ejercicio3b;
type
	Empleado = record
		nro_emp: integer;
		ape: string;
		nom: string;
		edad: integer;
		dni: integer;
	end;
	
	archivo_emp = file of Empleado;

procedure imprimirEmpleado(reg: Empleado);
begin
	with reg do
	begin
		writeln('Numero empleado: ', nro_emp);
		writeln('Nombre: ', nom, ' ', ape);
		writeln('Edad: ', edad, ' - DNI: ', dni);
		writeln('--------------------------------------');
	end;
end;

procedure seleccionarBusqueda (var arch: archivo_emp; opc: integer);
var
	buscar: string;
	reg: Empleado;
begin
	if (opc = 1) then begin
		write('Ingrese el nombre del empleado a buscar: ');
		readln(buscar);
	end
	else begin
		Write('Ingrese el apellido del empleado a buscar: ');
		Readln(buscar);
	end;
	
	while (not EOF(arch)) do begin
		Read(arch, reg);
		
		if ((opc = 1) and (reg.nom = buscar)) or ((opc = 2) and (reg.ape = buscar)) then begin
			imprimirEmpleado(reg);
		end;
	end;
end;

procedure listarEmpleados(var arch: archivo_emp);
var
	reg: Empleado;
begin
	while (not EOF(arch)) do begin
		Read(arch, reg);
		imprimirEmpleado(reg);
	end;
end;

procedure listarProximosJubilacion(var arch: archivo_emp);
var
	reg: Empleado;
begin
	while (not EOF(arch)) do begin
		Read(arch, reg);
		if (reg.edad > 70) then
			imprimirEmpleado(reg);
	end;
end;

var
	arch: archivo_emp;
	opc: integer;
	nomArch: string;
begin
	write('Ingresar el nombre del archivo a leer: ');
	readln(nomArch);
	Assign(arch, nomArch + '.dat');
	reset(arch);
	
	Writeln('Seleccione una opcion:');
	Writeln('1 - Buscar empleado por nombre');
	Writeln('2 - Buscar empleado por apellido');
	Writeln('3 - Listar todos los empleados');
	Writeln('4 - Listar empleados proximos a jubilarse');
	Readln(opc);
	
	case opc of
		1, 2: seleccionarBusqueda(arch, opc);
		3: listarEmpleados(arch);
		4: listarProximosJubilacion(arch);
	else
		Writeln('Opción no válida.');
	end;

	close(arch);
end.
