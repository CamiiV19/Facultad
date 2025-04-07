package Practica1.Ejercicio2;

import java.util.Scanner;

public class Ejercicio2 {
    
    public static int [] multiplosVectorN(int n) { //lo hago aca es necesito otra clase??
        int [] arreglo = new int[n];
        for (int i=0; i < n; i++) {
            arreglo[i] = n*(i+1);
        }
        return arreglo;
    }
    
    public static void main(String[] args) {
	Scanner s = new Scanner(System.in);
	System.out.println("Ingrese el numero");
	int num = s.nextInt();
	int [] arreglo = multiplosVectorN(num); //puedo poner s.nextInt(), no es necesario el num
        System.out.println("Su arreglo de multiplos quedaria: ");
	for(int i : arreglo) {
            System.out.println(i);
		}        
        s.close(); //es necesario cerrarlo?
    }
    
}
