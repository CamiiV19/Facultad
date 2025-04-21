program empresa;
type 
	empleado = record
		cod: integer;
		nom: string;
		comision: real;
	end;
	
	archivo_Comisiones = file of empleado;


procedure crearArchivoBinario(var arch: archivo_comisiones; nombre: string);
var
	txt: Text;
	emp: empleado;
begin
	assign(arch, nombre);
	assign(txt, 'comisiones.txt');
	rewrite(arch);
	reset(txt);
	while (not eof(txt)) do begin
		readln(txt, emp.cod, emp.nombre, emp.comision);
		write(arch, emp);
	end;
	close(txt);
	close(arch);
end;

procedure compactar(var arch: archivo_comisiones; var arch_Compactado: archivo_comisiones);
var
	actual, aux: empleado;
begin
	reset(arch);
	rewrite(arch_Compactado);

	if (not eof(arch)) then begin
		read(arch, aux);
		while (not eof(arch)) do begin
			actual := aux;
			actual.comision := 0;
			while (aux.cod = actual.cod) do begin
				actual.nombre := aux.nombre;
				actual.comision := actual.comision + aux.comision;
				if (not eof(arch)) then
					read(arch, aux)
				else
					break;
			end;
			write(arch_Compactado, actual);
		end;
	end;

	//Para escribir el último empleado si fue el único o quedó sin escribir
	if (aux.cod = actual.cod) then begin
		actual.comision := actual.comision + aux.comision;
		write(arch_Compactado, actual);
	end;

	close(arch);
	close(archCompactado);
end;

procedure mostrarArchivo(var arch: archivo_comisiones);
var
  emp: empleado;
begin
	reset(arch);
	writeln('Archivo de empleados:');
	while (not eof(arch)) do begin
		with emp do
		begin
			read(arch, emp);
			writeln('Cod: ', cod, ', Nombre: ', nom, ', Total comisiones: ', comision:0:2);
		end;
	end;
	close(arch);
end;

var
	arch_Original, arch_Compactado: archivo_Comisiones;
	nomOriginal, nomCompactado: string;
begin
	write('Ingrese nombre del archivo binario original (ej: comisiones.dat): ');
	readln(nomOriginal);
	write('Ingrese nombre del archivo binario compactado (ej: comisiones_compactado.dat): ');
	readln(nomCompactado);

	crearArchivoBinario(arch_Original, nomOriginal);
	compactar(arch_Original, arch_Compactado);
	assign(arch_Compactado, nomCompactado);
	writeln;
	mostrarArchivo(arch_Compactado);
end.
	
