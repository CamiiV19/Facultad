/*3- Escribir un programa que defina una variable de tipo booleano, y luego permita al usuario
ingresar un valor booleano por teclado para actualizar su valor haciendo las operaciones
and y or. Se deben imprimir ambos resultados.*/

use std::io;

fn main() {
    //variable booleana
    let valor_base: bool = false;
    
    //valor booleano ingresado x teclado
    println!("Ingrese un valor booleano (true/false):");
    let mut entrada = String::new();
    io::stdin().read_line(&mut entrada).expect("Error al leer la entrada");
    let valor_usuario: bool = entrada.trim().parse().expect("No es bolleano");
        
    // Operaciones AND y OR
    let resultado_and = valor_base && valor_usuario;
    let resultado_or = valor_base || valor_usuario;
    
    // Imprimir resultados
    println!("Resultados:");
    println!("AND: {} && {} = {}", valor_base, valor_usuario, resultado_and);
    println!("OR: {} || {} = {}", valor_base, valor_usuario, resultado_or);
}
