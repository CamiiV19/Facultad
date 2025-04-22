program empresa;
const
	valorAlto = 9999;
type 
	empleado = record
		cod: integer;
		nom: string;
		comision: real;
	end;
	
	archivo_Comisiones = file of empleado;

procedure leer(var arch: archivo_Comisiones; var reg: empleado);
begin
  if(not eof(arch)) then begin
    readln(arch,reg)
  end
  else
    reg.cod := valorAlto;
end;

{procedure crearArchivoBinario(var arch: archivo_comisiones; nombre: string);
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
end;}

procedure compactar(var arch: archivo_comisiones; var arch_Compactado: archivo_Comisiones);
var
	reg, aux: empleado;
begin
	reset(arch);
	rewrite(arch_Compactado);
	leer(arch,reg);
	while (reg.cod <> valorAlto) do begin
		aux.cod:= reg.cod; 
		aux.nom:= reg.nom;
		aux.comision:= 0; 
		while (reg.cod <> valorAlto) and (reg.cod = aux.cod) do begin
			aux.comision := aux.comision + reg.comision;
			leer(arch,reg);
		end;
		write(arch_Compactado, aux);
		end;
	end;
	close(arch);
	close(arch_Compactado);
end;

{procedure mostrarArchivo(var arch: archivo_comisiones);
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
end;}

var
	arch_Original, arch_Compactado: archivo_Comisiones;
	nomOriginal, nomCompactado: string;
begin
	write('Ingrese nombre del archivo binario original (ej: comisiones.dat): ');
	readln(nomOriginal);
	write('Ingrese nombre del archivo binario compactado (ej: comisiones_compactado.dat): ');
	readln(nomCompactado);
	
	assign(arch_Original, nomOriginal);
	assign(arch_Compactado, nomCompactado);
	
	compactar(arch_Original, arch_Compactado);
	
	writeln;
	//mostrarArchivo(arch_Compactado);
end.
	
