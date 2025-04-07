/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica1.Ejercicio7;
//a)
import java.util.ArrayList;
import java.util.Scanner;
//import java.util.Iterator;

public class TestArrayList {
    public static void main(String[] args) {
        ArrayList<Integer> listaNumeros = new ArrayList();

        Scanner s = new Scanner(System.in);
        System.out.println("Ingrese números (0 para terminar):");

        int numero;
        do {
            numero = s.nextInt();
            if (numero != 0) {
                listaNumeros.add(numero);
            }
        } while (numero != 0);

        System.out.println("Contenido de la lista:");
        for (int n : listaNumeros) {
            System.out.println(n);
        }

        s.close();
        /*Iterator<Integer> it = listaNumeros.iterator();
        while (it.hasNext()) {
            Integer num = it.next();
            System.out.println(num);
        }*/
    }
}

