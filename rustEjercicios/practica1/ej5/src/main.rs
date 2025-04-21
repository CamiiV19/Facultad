/*5- Escribir un programa que defina una variable de tipo cadena, y luego permita al usuario
ingresar una cadena por teclado para concatenar su valor. El programa debe imprimir la
cadena en mayúsculas.*/

use std::io;

fn main() {
    let cadena1 = String::from("hola bruno ");

    println!("ingrese una cadena para concatenar:");
    let mut entrada = String::new();
    io::stdin().read_line(&mut entrada).expect("mal cadenaU");
    let cad_u: String = entrada.trim().parse().expect("no es una cadena");

    println!("Resultado en mayúsculas: {}", (cadena1 + &cad_u).to_uppercase());
}
