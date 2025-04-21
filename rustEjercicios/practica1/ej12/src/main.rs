/*12- Escribir un programa que defina una tupla que contenga una cadena y un arreglo de
enteros, y luego imprima la cadena y la suma de los valores en el arreglo.*/

fn main() {
    let tupla = ("abcde", [10, 2, 3, 4, 20]);

    println!("Cadena de la tupla: {}", tupla.0);

    let suma = tupla.1[0] + tupla.1[1] + tupla.1[2] + tupla.1[3] + tupla.1[4];

    println!("La suma de los valores es: {}", suma);
}
