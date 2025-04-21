program ej7;
type
	novela = record
		cod: integer;
		nombre: string;
		genero: string;
		precio: real;
	end;

	arch_novelas = file of novela;

procedure crearArchivoDesdeTexto(var arch: arch_novelas; nombreArch: string);
var
	txt: text;
	n: novela;
begin
	assign(arch, nombreArch);
	assign(txt, 'novelas.txt');
	reset(txt);
	rewrite(arch);

	while (not eof(txt)) do begin
		with n do
		begin
			readln(txt, cod, precio, genero);  // Línea 1: código, precio, género
			readln(txt, nombre);               // Línea 2: nombre de la novela
			write(arch, n);
		end;
		
	end;

	close(txt);
	close(arch);
	writeln('Archivo binario creado correctamente.');
end;

procedure agregarNovela(var arch: arch_novelas);
var
	n: novela;
begin
	reset(arch);
	seek(arch, filesize(arch));//me posiciono a lo ultimo

	writeln('--- Agregar novela ---');
	with n do 
	begin
		write('Codigo: '); readln(cod);
		write('Nombre: '); readln(nombre);
		write('Genero: '); readln(genero);
		write('Precio: '); readln(precio);
	end;
	write(arch, n);
	close(arch);
	writeln('Novela agregada exitosamente.');
end;

procedure modificarNovela(var arch: arch_novelas);
var
	codBuscar: integer;
	n: novela;
	encontrado: boolean;
begin
	reset(arch);
	encontrado := false;

	write('Ingrese codigo de novela a modificar: ');
	readln(codBuscar);

	while ((not eof(arch)) and (not encontrado)) do begin
		read(arch, n);
		with n do 
		begin
			if (cod = codBuscar) then begin
				encontrado := true;
				writeln('Novela encontrada:');
				writeln('Nombre: ', nombre);
				writeln('Genero: ', genero);
				writeln('Precio: ', precio:0:2);

				writeln('--- Ingrese los nuevos datos ---');
				write('Nuevo nombre: '); readln(nombre);
				write('Nuevo genero: '); readln(genero);
				write('Nuevo precio: '); readln(precio);

				seek(arch, filepos(arch) - 1);
				write(arch, n);
				writeln('Novela modificada correctamente.');
			end;
		end;
	end;

	if (not encontrado) then
		writeln('No se encontro una novela con ese codigo.');

	close(arch);
end;

//pp
var
  arch: arch_novelas;
  nombreArch: string;
  opcion: char;
begin
  write('Ingrese nombre del archivo binario (ej: novelas.dat): ');
  readln(nombreArch);
  assign(arch, nombreArch);

  repeat
    writeln;
    writeln('====== MENU ======');
    writeln('a. Crear archivo desde novelas.txt');
    writeln('b. Agregar una novela');
    writeln('c. Modificar una novela');
    writeln('x. Salir');
    write('Seleccione una opcion: ');
    readln(opcion);

    case opcion of
      'a': crearArchivoDesdeTexto(arch, nombreArch);
      'b': agregarNovela(arch);
      'c': modificarNovela(arch);
      'x': writeln('Saliendo...');
    else
      writeln('Opcion invalida.');
    end;
  until (opcion = 'x');
end.
