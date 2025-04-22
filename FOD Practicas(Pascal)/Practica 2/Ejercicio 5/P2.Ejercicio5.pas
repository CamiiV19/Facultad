program ej5;
type
	sesion = record
		cod_usuario: string;
		fecha: string;
		tiempo_sesion: integer;
	end;

	sesion_maestro = record
		cod_usuario: string;
		fecha: string;
		tiempo_total: integer;
	end;
	archivo_maestro = file of sesion_maestro;
	archivo_detalle = file of sesion;
	
procedure leer(var arch: archivo_detalle; var reg: sesion);
begin
	if (not eof(arch)) then
		read(arch, reg)
	else
		reg.cod_usuario := valorAlto;
end;


procedure minimo(var arch1, arch2, arch3, arch4, arch5: archivo_detalle;
                var reg1, reg2, reg3, reg4, reg5: sesion; var min: sesion);
begin
	min.cod_usuario := valorAlto;
	min.fecha := valorAlto;

	if (reg1.cod_usuario < min.cod_usuario) or ((reg1.cod_usuario = min.cod_usuario) and (reg1.fecha < min.fecha)) then begin
		min := reg1;
	end;

	if (reg2.cod_usuario < min.cod_usuario) or ((reg2.cod_usuario = min.cod_usuario) and (reg2.fecha < min.fecha)) then begin
		min := reg2;
	end;

	if (reg3.cod_usuario < min.cod_usuario) or ((reg3.cod_usuario = min.cod_usuario) and (reg3.fecha < min.fecha)) then begin
		min := reg3;
	end;

	if (reg4.cod_usuario < min.cod_usuario) or ((reg4.cod_usuario = min.cod_usuario) and (reg4.fecha < min.fecha)) then begin
		min := reg4;
	end;

	if (reg5.cod_usuario < min.cod_usuario) or ((reg5.cod_usuario = min.cod_usuario) and (reg5.fecha < min.fecha)) then begin
		min := reg5;
	end;
end;


procedure generarMaestro(var aM: archivo_maestro; var arch1, arch2, arch3, arch4, arch5: archivo_detalle);
var
	reg1, reg2, reg3, reg4, reg5, min: sesion;
	actual: sesion_maestro;
begin
  // Abrir los archivos detalle
	reset(arch1);
	reset(arch2);
	reset(arch3);
	reset(arch4);
	reset(arch5);
  
  // Leer el primer registro de cada archivo
	leer(arch1, reg1);
	leer(arch2, reg2);
	leer(arch3, reg3);
	leer(arch4, reg4);
	leer(arch5, reg5);

	rewrite(aM);  // Crear el archivo maestro vacío
	minimo(arch1, arch2, arch3, arch4, arch5, reg1, reg2, reg3, reg4, reg5, min);

  // Procesar todos los registros
	while (min.cod_usuario <> valorAlto) do begin
		actual.cod_usuario := min.cod_usuario;
		actual.fecha := min.fecha;
		actual.tiempo_total := 0;

    // Acumular el tiempo de sesión para el mismo usuario y fecha
		while (min.cod_usuario = actual.cod_usuario) and (min.fecha = actual.fecha) do begin
			actual.tiempo_total := actual.tiempo_total + min.tiempo_sesion;
			minimo(arch1, arch2, arch3, arch4, arch5, reg1, reg2, reg3, reg4, reg5, min);
		end;

    // Escribir el registro actualizado en el archivo maestro
		write(aM, actual);
	end;

  // Cerrar archivos
	close(aM);
	close(arch1);
	close(arch2);
	close(arch3);
	close(arch4);
	close(arch5);
end;

//pp
var
	maestro: archivo_maestro;
	detalle1, detalle2, detalle3, detalle4, detalle5: archivo_detalle;
	i: integer;
begin
	assign(maestro, 'maestro.dat');
	assign(detalle1, 'detalle1.dat');
	assign(detalle2, 'detalle2.dat');
	assign(detalle3, 'detalle3.dat');
	assign(detalle4, 'detalle4.dat');
	assign(detalle5, 'detalle5.dat');

	generarMaestro(maestro, detalle1, detalle2, detalle3, detalle4, detalle5);
end.

