program ej3;
const
	valorAlto = 'ZZZZ';
type
	provincia = record
		nomProv: string[20];
		cantPersonasAlf: integer;
		cantEncuestados: integer;
	end;
	
	datos_Censo = record
		nomProv: string[20];
		codLoc: integer;
		cantPersonasAlf: integer;
		cantEncuestados: integer;
	end;
	
	maestro = file of provincia;
	detalle = file of datos_Censo;
	
procedure leer(var arch: detalle; var reg: datos_Censo);
begin
	if(not eof(arch)) then
		read(arch, reg);
	else
		reg.nomProv := valorAlto;
end;

procedure minimo (var d1, d2: detalle; var r1, r2, min: datos_Censo);
begin
	if (r1.nomProv <= r2.nomProv) then begin
		min:= r1;
		leer(d1,r1);
	end
	else begin
		min:= r2;
		leer(d2,r2);
	end;
end;

procedure actualizarMaestro(var aM: maestro; var d1,d2: detalle);
var
	regM: provincia;
	regD1, regD2, min: datos_Censo;
	totalAlf, totalEnc: integer;
begin
	reset(aM);
	reset(d1);
	reset(d2);
	
	leer(d1, regD1);
	leer(d2, regD2);
	minimo(d1, d2, regD1, regD2, min);
	
	while(min.nomProv <> valorAlto) do begin
		read(aM, regM);
		while(regM.nomProv <> min.nomProv) do 
			read(aM, regM);
		
		totalAlf := 0;
		totalEnc := 0;
		while(regM.nomProv = min.nomProv) do begin
			//acumular 
			totalAlf := totalAlf + min.cantPersonasAlf;
			totalEnc := totalEnc + min.cantEncuestados;
			minimo(d1, d2, regD1, regD2, min);
		end;
		//actualizar stock de ma
		regM.cantPersonasAlf := regM.cantPersonasAlf + totalAlf;
		regM.cantEncuestados := regM.cantEncuestados + totalEnc;
		
		seek(aM, filepos(aM)-1);
		write(aM,regM);
	end;
	close(aM);
	close(d1);	
	close(d2);	
end;
//pp
var
	aM: maestro;
	d1,d2: detalle;
begin
	assign(aM, 'maestro.dat');
	assign(d1, 'detalle1.dat');
	assign(d2, 'detalle2.dat');
	
	actualizarMaestro(aM, d1, d2);
	
	writeln('Archivo maestro actualizado correctamente.');
	
end.
