program ejercicio4a;
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

procedure controlUnidad(var arch: archivo_emp; var esta: boolean; dato: integer);
var
	reg: Empleado;
begin	
	while (not EOF(arch)) do begin
		Read(arch, reg);
		if (reg.nro_emp = dato) then begin
			esta := true;
		end;
	end;
end;

procedure agregarEmpleado(var arch: archivo_emp);
var
	dato: integer;
	esta: boolean;
	reg: Empleado;
begin
	esta:= false;
	Write('Ingrese el numero del nuevo empleado: ');
	Readln(dato);
	controlUnidad(arch, esta, dato);
	
	if (esta = true) then begin
		Writeln('El usuario ya se encuentra registrado');
		writeln();
	end
	else begin
		with reg do begin
			nro_emp := dato;
			Write('Ingrese el apellido del empleado: ');
			Readln(ape);
			Write('Ingrese el nombre del empleado: ');
			Readln(nom);
			Write('Ingrese la edad del empleado: ');
			Readln(edad);
			Write('Ingrese el DNI del empleado: ');
			Readln(dni);
		end;
		Write(arch, reg);
		Writeln('Usuario agregado correctamente');
	end;
end;

procedure menu(var arch: archivo_emp);
var
	opc: integer;
begin
	opc:= 0;
	writeln();
	while (opc <> 6) do	begin
		Writeln('Seleccione una opcion:');
		Writeln('1 - Buscar empleado por nombre');
		Writeln('2 - Buscar empleado por apellido');
		Writeln('3 - Listar todos los empleados');
		Writeln('4 - Listar empleados proximos a jubilarse');
		Writeln('5 - Agregar un nuevo empleado');
		Writeln('6 - FINALIZAR');
		Readln(opc);
		writeln();

		case opc of
			1, 2: seleccionarBusqueda(arch, opc);
			3: listarEmpleados(arch);
			4: listarProximosJubilacion(arch);
			5: agregarEmpleado(arch);
			6: Writeln('Programa finalizado');
		else
			Writeln('Opcion no valida.');
		end;
	end;
end;

var
	arch: archivo_emp;
	nomArch: String;
BEGIN
	
	Write('Ingrese el nombre del archivo a leer: ');
	Readln(nomArch);
	assign(arch, nomArch + '.dat');
	reset(arch);
	menu(arch);
	close(arch);
END.
