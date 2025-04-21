program tienda;
type
	celular = record
		codCel: integer;
		nom: string;
		desc: string;
		marca: string;
		precio: real;
		stockMin: integer;
		stockDisp: integer;
	end;

	arch_Cel = file of celular;
	

procedure crearArchivoDesdeTexto(var arch: arch_Cel; nomArch: string);
var
	carga: Text;
	cel: celular;
begin
	assign(carga, 'celulares.txt');//lo tengo en la carpeta
	assign(arch, nomArch);
	rewrite(arch);// creo archivo binario
	reset(carga);// abro el archivo carga
	
	while(not eof(carga)) do begin
		with cel do 
		begin
			readln(carga, codCel, precio, marca);
			readln(carga, stockDisp, stockMin, desc);
			readln(carga, nom);
			write(arch, cel);
		end;
	end;
	close(carga);
	close(arch);
	
end;

procedure imprimir(cel: celular);
begin
	with cel do
	begin
		writeln('Cod: ', codCel, ', Nombre: ', nom, ', Stock disponible: ', stockDisp, ', Stock minimo: ', stockMin, ', Descripcion: ', desc);
	end;
end;

procedure listarStockBajo(var arch: arch_Cel);
var
	cel: celular;
begin
	reset(arch);
	writeln;
	writeln('Celulares con stock menor al minimo:');
	while (not eof(arch)) do begin
		read(arch, cel);
		if (cel.stockDisp < cel.stockMin) then 
				imprimir(cel);
				//riteln('Cod: ', codCel, ', Nombre: ', nom, ', Stock disponible: ', stockDisp, ', Stock minimo: ', stockMin, ', Descripcion: ', desc);
	end;
	close(arch);
end;

procedure buscarPorDescripcion(var arch: arch_Cel);
var
	cadena: string;
	cel: celular;
begin
	write('Ingrese cadena a buscar en la descripcion: ');
	readln(cadena);
	reset(arch);
	while (not eof(arch)) do begin
		read(arch, cel);
		if (pos(cadena, cel.desc)>0) then 
			{function pos(sub: string; str: string): integer;
			Devuelve la posición en la que se encuentra sub dentro de str. 
			Si no se encuentra, devuelve 0. Por eso se compara con > 0}
			imprimir(cel);
	end;
	close(arch);
end;

procedure exportarATexto(var arch: arch_Cel);
var
	txt: Text;
	cel: celular;
begin
	assign(txt, 'celulares2.txt');
	rewrite(txt);
	reset(arch);
	while (not eof(arch)) do begin
		read(arch, cel);
		with cel do
		begin
			writeln(txt,codCel,' ',precio,marca);
			writeln(txt,stockDisp,' ',stockMin,desc);
			writeln(txt,nom);
		end;
	end;
	close(txt);
	close(arch);
end;

//pp
var 
	arch: arch_Cel;
	nomArch: string;
	opc: char;
BEGIN
	write('Ingrese nombre del archivo binario (ej: celulares.dat):');
	readln(nomArch);
	repeat 
		writeln;
		writeln('====== Menu ======');
		writeln('a. Crear archivo binario desde celulares.txt');
		writeln('b. Listar celulares con stock bajo');
		writeln('c. Buscar celulares por descripcion');
		writeln('d. Exportar binario a celulares.txt');
		writeln('x. Salir.');
		write('Seleccione una opcion: ');
		readln(opc);
		case opc of
			'a': crearArchivoDesdeTexto(arch, nomArch);
			'b': listarStockBajo(arch);
			'c': buscarPorDescripcion(arch);
			'd': exportarATexto(arch);
			'x': writeln('Saliendo..');
		else
			writeln('Opción inválida. Intente de nuevo.');
		end;
	until (opc = 'x');
END.	
