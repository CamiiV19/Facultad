/*7- Escribir un programa que defina una variable de tipo arreglo que contenga seis números
enteros, y luego multiplique cada valor del arreglo por un valor constante definido,
modificando el contenido del arreglo.*/

fn main() {
    const NUM: u32 = 2;
    let mut arreglo = [1,7,2,6,3,5];

    arreglo[0] *= NUM;
    arreglo[1] *= NUM;
    arreglo[2] *= NUM;
    arreglo[3] *= NUM;
    arreglo[4] *= NUM;
    arreglo[5] *= NUM;

    println!("{:?}", arreglo);

}
