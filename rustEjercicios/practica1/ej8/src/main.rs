/*8- Escribir un programa que defina una constante de tipo cadena, y luego imprima el
número de veces que un caracter específico ingresado por el usuario aparece en la cadena.
Se debe imprimir el resultado.*/

use std::io;

fn main() {
    const CADENA: &str = "holaaa";

    // Solicitar al usuario un caracter
    println!("Ingrese un caracter para contar:");
    let mut caracter = String::new();
    io::stdin().read_line(&mut caracter).expect("Error al leer el caracter");
    let caracter: char = caracter.trim().parse().expect("No es un caracter");

    let cant = CADENA.chars().filter(|&c| c == caracter).count();
    println!("El caracter '{}' aparece {} veces.", caracter, cant);

}
