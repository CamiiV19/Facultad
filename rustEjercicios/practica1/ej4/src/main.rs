/*4- Escribir un programa que defina una tupla que contenga una cadena, un número entero
con signo y un valor booleano, y luego imprima cada valor de la tupla*/

fn main() {
    let tupla: (String, i32, bool) = ("hola".to_string(), -19, true);
    println!("{:?}", tupla);
}
