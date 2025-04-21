/*6- Escribir un programa que defina una variable de tipo entero sin signo, y luego permita al
usuario ingresar un número entero por teclado para sumarse con la variable definida. El
programa debe imprimir el valor del número elevado al cuadrado.*/

use std::io;

fn main() {
    let nro_base: u32 = 22;

    println!("ingrese un numero:");
    let mut imput = String::new();
    io::stdin().read_line(&mut imput).expect("bad num");
    let nro_usuario : u32 = imput.trim().parse().expect("no es un entero");

    let suma = nro_base + nro_usuario;
    //let cuadrado = suma.pow(2);
    println!("El resultado de la suma elevado al cuadrado es: {}", suma.pow(2));
}
