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

//6)
procedure agregarCelulares(var arch: arch_Cel);
var
	cel: celular;
	seguir: char;
begin
	reset(arch);
	seek(arch, FileSize(arch)); // me posiciono al final del archivo
	repeat
		with cel do
		begin
			writeln('Ingrese los datos del celular:');
			write('Código: '); readln(codCel);
			write('Nombre: '); readln(nom);
			write('Descripción: '); readln(desc);
			write('Marca: '); readln(marca);
			write('Precio: '); readln(precio);
			write('Stock mínimo: '); readln(stockMin);
			write('Stock disponible: '); readln(stockDisp);
		end;
		write(arch, cel);
		write('¿agregar otro celular? (s/n): '); readln(seguir);
	until (seguir <> 's');
	close(arch);
end;

procedure modificarStock(var arch: arch_Cel);
var
	nomBuscar: string;
	cel: celular;
	nuevoStock: integer;
	encontrado: boolean;
begin
	reset(arch);
	write('Ingrese el nombre del celular a modificar: ');
	readln(nomBuscar);
	encontrado := false;

	while ((not eof(arch)) and (not encontrado)) do begin
		read(arch, cel);
		if (cel.nom = nomBuscar) then begin
			encontrado := true;
			write('Ingrese el nuevo stock disponible: ');
			readln(nuevoStock);
			cel.stockDisp := nuevoStock;
			seek(arch, filepos(arch)-1);
			write(arch, cel);
			writeln('Stock actualizado.');
		end;
	end;

	if (not encontrado) then
		writeln('Celular no encontrado.');
	close(arch);
end;

procedure exportarSinStock(var arch: arch_Cel);
var
	txt: Text;
	cel: celular;
begin
	assign(txt, 'SinStock.txt');
	rewrite(txt);
	reset(arch);

	while (not eof(arch)) do begin
		read(arch, cel);
		with cel do 
		begin 
			if (stockDisp = 0) then begin
			  writeln(txt, 'Cod: ', codCel, ', Nombre: ', nom);
			  writeln(txt, 'Marca: ', marca, ', Precio: ', precio);
			  writeln(txt, 'Stock mínimo: ', stockMin, ', Descripción: ', desc);
			  writeln(txt, '-----------------------------');
			end;
		end;
	end;
	close(txt);
	close(arch);
	writeln('Exportación finalizada en "SinStock.txt".');
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
		//ej 6
		writeln('e. Añadir celulares');
		writeln('f. Modificar stock de un celular');
		writeln('g. Exportar celulares sin stock a "SinStock.txt"');
		writeln('x. Salir.');
		write('Seleccione una opcion: ');
		readln(opc);
		case opc of
			'a': crearArchivoDesdeTexto(arch, nomArch);
			'b': listarStockBajo(arch);
			'c': buscarPorDescripcion(arch);
			'd': exportarATexto(arch);
			//6)
			'e': agregarCelulares(arch);
			'f': modificarStock(arch);
			'g': exportarSinStock(arch);
			'x': writeln('Saliendo..');
		else
			writeln('Opción inválida. Intente de nuevo.');
		end;
	until (opc = 'x');
END.	
