program ej4;
const
	valorAlto = 99999;
	N = 30;
type
	producto = record
		cod,stock_dis,stock_in: integer;
		precio: real;
		nom,des: string;
	end;
	
	venta = record
		cod,cant_vendida: integer;
		
	end;
	
	maestro = file of producto;
	detalle = file of venta;
	
	vDetalle = array[1..N] of detalle;
	vRegistros = array[1..N] of venta;


procedure leer(var arch: detalle; var reg: venta);
begin
	if(not eof(arch)) then
		read(arch,reg)
	else
		reg.cod := valorAlto;
end;


procedure leerRegistros(var vD: vDetalle; var vR: vRegistros);
var
	i: integer;
begin
	for i := 1 to N do begin
		leer(vD[i],vR[i]);
	end;
end;	


procedure minimo(var vD: vDetalle; var vR: vRegistros; var min: venta); //vector de los leidos
var 
	i: integer;
begin
	for i := 1 to N do begin
		if (vR[i].cod <= min.cod) then begin
			min := vD[i];
			pos := i;
		end;
	end;
	
end;

procedure actualizarMaestro (var aM: maestro; var vD: vDetalle);
var
	vR: vRegistros;
	min: venta:
	regM: producto;
	totalVendidas, i: integer;
begin
	reset(aM);
	for i:= 1 to N do begin
		reset(vD[i]); // abro todos los archivos de vectorDetalle
	end;
	
	leerRegistros(vD, vR);
	minimo(vD, vR, min);
	
	while(min.cod <> valorAlto) do begin
		read(aM, regM);
		while(regM.cod <> min.cod) do
			read(aM, regM);
		totalVendidas := 0;
		while(regM.cod = min.cod) do begin
			totalVendidas := totalVendidas + min.cant_vendida;
			minimo(vD, vR, min);
		end;
		regM.stock_dis := regM.stock_dis + totalVendidas;
		seek(aM, filepos(aM)-1);
		write(aM, regM);
	end;
	close(aM);
	for i:= 1 to N do
		close(vD[i]);
end;


procedure generarInformeStockBajo(var aM: maestro);
var
	regM: producto;
	txt: Text;
begin
	reset(aM);
	assign(txt, 'stock_bajo.txt');
	rewrite(txt);

	while (not eof(aM)) do begin
		read(aM, regM);
		if (regM.stock_dis < regM.stock_min) then begin
			with regM do
			begin
				writeln(txt, 'Nombre: ', nom);
				writeln(txt, 'Descripción: ', des);
				writeln(txt, 'Stock Disponible: ', stock_dis);
				writeln(txt, 'Precio: $', precio:0:2);
				writeln(txt, '------------------------------');
			end;
		end;
	end;
	close(txt);
	close(aM);
end;

var
	aM: maestro;
	vD: vDetalle;
	i: integer;
	nom: string;
BEGIN
	assign(aM, 'maestro.dat');
	for i := 1 to N do begin
		str(i, nombre);
		assign(vD[i], 'detalle' + nombre + '.dat');
	end;
	actualizarMaestro(aM,vD);
	generarInformeStockBajo(aM);
	
END.

