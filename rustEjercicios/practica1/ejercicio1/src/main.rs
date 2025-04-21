/*1- Escribir un programa que defina una variable de tipo flotante con algún valor, y luego
permita al usuario ingresar un número decimal por teclado para multiplicar, dividir, sumar y
restar su valor. Se deben imprimir los resultados.*/

use std::io; //para ingresar x tecclado

fn main() -> io::Results <()> {
    let f: f32 = 3.16;
    
    println("Ingrese numero: ");
    let mut buf = string::new();//"string::new()" una cadena vacia que ingresa la entrada del dato
    io::stdin().read_Line(&mut buf).expect("Error");//lee la linea ingresada y la almacena en buf
    let num: f32 = buf.trim().parse().expect("No es f32");// ".trim()" elimina espacios y saltos de linea
    //".parse()" convierte la cadena a un f32
    //".expect()" muestra un error si la conversion falla

    // Operaciones matemáticas
    let suma = f + num;
    let resta = f - num;
    let multiplicacion = f * num;
    let division = f / num;

    // Imprimir resultados
    println!("Resultados:");
    println!("Suma: {} + {} = {}", f, num, suma);
    println!("Resta: {} - {} = {}", f, num, resta);
    println!("Multiplicación: {} * {} = {}", f, num, multiplicacion);
    println!("División: {} / {} = {}", f, num, division);
}
