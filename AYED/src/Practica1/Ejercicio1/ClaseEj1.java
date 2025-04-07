/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica1.Ejercicio1;

public class ClaseEj1 {
    public static void conFor(int a, int b){
        for (int i = a; i <= b; i++) {
            System.out.println(i);
        }
    }
    public static void conWhile(int a, int b){
        while(a <= b){
            System.out.println(a++);
        }
    }
    public static void recursion(int a, int b){
        if (a <= b){
            System.out.println(a);
            recursion(a+1, b);
        }
    }
}
