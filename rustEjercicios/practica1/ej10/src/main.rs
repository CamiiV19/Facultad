/*10- Escribir un programa que defina dos arreglos de 5 números enteros cada uno, y luego
cree un tercer arreglo que contenga la suma de los elementos de los dos arreglos
originales*/

fn main() {
    let arreglo1 = [1,2,3,4,5];
    let arreglo2 = [6,7,8,9,10];

    let mut arreglo3 = [0,0,0,0,0];

    arreglo3[0] = arreglo1[0] + arreglo2[0];
    arreglo3[1] = arreglo1[1] + arreglo2[1];
    arreglo3[2] = arreglo1[2] + arreglo2[2];
    arreglo3[3] = arreglo1[3] + arreglo2[3];
    arreglo3[4] = arreglo1[4] + arreglo2[4];

    println!("{:?}", arreglo3);
}
