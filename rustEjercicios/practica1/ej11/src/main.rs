/*11- Escribir un programa que defina un arreglo de 5 cadenas, y luego permita al usuario
ingresar una cadena por teclado. El programa debe imprimir un mensaje si la cadena
ingresada por el usuario se encuentra en el arreglo.*/

use std::io;

fn main() {
    let arreglo = ["a", "b", "c", "d", "e"];
    
    println!("Ingresar una cadena:");
    let mut cadena = String::new();
    io::stdin().read_line(&mut cadena).expect("Error al leer");
    let cadena: &str = cadena.trim();

    println!("¿Está la cadena en el arreglo? {}", arreglo.contains(&cadena));
}
