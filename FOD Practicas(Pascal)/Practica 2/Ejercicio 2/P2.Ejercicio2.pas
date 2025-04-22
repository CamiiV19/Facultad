
program negocioLimpieza;
const
	valorAlto = 9999;
type
	producto = record
		cod: integer;
		nom: string;
		precio: real;
		stockAct: integer;
		stockMin: integer;
	end;
	
	ventas = record
		cod: integer;
		cantUV: integer;
	end;
	
	maestro = file of producto;
	detalle = file of ventas;

procedure leer(var archivo: detalle; var dato: ventas);
begin
	if (not (EOF(archivo))) then
	begin
		read(archivo, dato);
	end
	else
		dato.cod:= valoralto;
end;

procedure actualizarMaestro(var aM: maestro; var aD: detalle);
var
	regM: producto;
	regD: ventas;
	total: integer;
begin
	reset(aM);
	reset(aD);
	
	leer(aD, regD);
	while(regD.cod <> valorAlto) do begin
		read(aM, regM);
		while(regM.cod <> regD.cod) do 
			read(aM, regM);
		
		total := 0;
		while(regM.cod = regD.cod) do begin
			//acumular ventas
			total:= total + regD.cantUV;
			leer(aD,regD);
		end;
		//actualizar stock de ma
		regM.stockAct := regM.stockAct - total;
		
		seek(aM, filepos(aM)-1);
		write(aM,regM);
	end;
	close(aM);
	close(aD);	
end;

procedure listarStockMin(var aM: maestro);
var
	regM: producto;
	txt: Text;
begin
	reset(aM);
	assign(txt, 'stock_minimo.txt');
	rewrite(txt);
	
	writeln(txt, 'Productos con stock por debajo del mínimo:');
	writeln(txt, '------------------------------------------');
	
	while (not eof(aM)) do begin
		read(aM, regM);
		if (regM.stockAct < regM.stockMin) then begin
			with regM do
			begin
				writeln(txt, 'Cod: ', cod);
				writeln(txt, 'Nombre: ', nom);
				writeln(txt, 'Stock actual: ', stockAct);
				writeln(txt, 'Stock mínimo: ', stockMin);
			end;
		end;
	end;
	close(txt);
	close(aM);
end;

//pp
var
	aM: maestro;
	aD: detalle;

begin
	assign(aM, 'maestro.dat');
	assign(aD, 'detalle.dat');
	
	actualizarMaestro(aM, aD);
	listarStockMin(aM);
	
end.
