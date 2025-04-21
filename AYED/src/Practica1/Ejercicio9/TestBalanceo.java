/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica1.Ejercicio9;

import java.util.*;

public class TestBalanceo {

    private static boolean esBalanceado(String expr) {
        List<Character> cierre = new LinkedList<Character>();
        cierre.add(')');
        cierre.add(']');
        cierre.add('}');
        boolean ok = true;
        
        if((expr.length() %2 !=0) || (expr.length() > 0 && cierre.contains(expr.charAt(0)))) ok = false; //(1)
        else {
            List<Character> apertura = new LinkedList<Character>();
            apertura.add('(');
            apertura.add('[');
            apertura.add('{');
            
            Stack<Character> pila = new Stack<Character>();
            Character actual, elem;
            int i = 0;
            while(i < expr.length() && ok) {
                actual = expr.charAt(i);
                if(apertura.contains(actual))
                    pila.push(actual);
                else {
                    if(!pila.isEmpty()) {
                        elem = pila.pop();
                        if(apertura.indexOf(elem) != cierre.indexOf(actual)) ok = false; //(2)
                    }
                }
                i++;
            }
            if(!pila.isEmpty()) ok = false; //(3)
        }
        return ok;
    }
    
    //(1) Si el String no es par ya se que la pila nunca va a quedar vacia. Si el primer caracter del String es de cierre ya se que va a dar error, porque se va a intentar un POP. Descarto esos casos y devuelvo false directamente.
    //(2) Tomo el caracter actual, verifico si es de apertura o cierre. En caso de que sea cierre en elem me guardo el elemento popeado, y verifico si la posicion donde esta ubicado el caracter de apertura coincide con la posicion del caracter de cierre. 
    //En caso que no coincida la posicion significa que son distintos, esto es asi por como los guarde en las listas. En caso de que sean iguales sigo procesando.
    //(3) El unico caso donde el String esta balanceado es cuando al finalizar el modulo la pila quedo vacia, en caso contrario no esta balanceado el String.
    
    public static void main(String[] args) {
        Scanner consola = new Scanner(System.in);
        System.out.println("Ingrese un String");
        String s = consola.nextLine();
        consola.close(); //No se va a leer mas datos de teclado. Cierro el objeto Scanner, libero el recurso.
        if(esBalanceado(s))
            System.out.println("La expresion " + s + " esta balanceada");
        else System.out.println("La expresion " + s + " no esta balanceada");
    }
    
}
