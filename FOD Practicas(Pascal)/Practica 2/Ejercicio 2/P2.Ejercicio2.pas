program negocioLimpieza;
const
	valorAlto = '9999';
type
	producto = record
		cod: integer;
		nom: string;
		precio: real;
		stockAct: integer;
		stockMin: integer;
	end;
	
	venta = record
		cod: integer;
		cantUV: integer;
	end;
	
	maestro = file of producto;
	detalle = file of venta;

procedure actualizar;
begin
	
end;

//pp
var
	archMa: maestro;
	archDe: detalle;
	regM: producto;
	regD: venta;
	total: integer;
begin
	assign(archMa, 'maestro');
	assign(archDe, 'detalle');
	reset(archMa);
	reset(archDe);
	while(not eof(archDe)) do begin
		read(archMa, regM);
		read(archDe, regD);
		while(regM.cod <> regD.cod) do 
			read(archMa,regM);
		while(not eof(archDe) and (regM.cod = regD.cod)) do begin
			regM.precio
			//actualizar
			//leo
			read(archDe, regDe);
		end;
		if(not eof(archDe)) then 
			seek(archDe, filePos(archDe)-1);
		seek(archMa, filePos(archMa)-1);
		write(archMa, regM)
		
end.
