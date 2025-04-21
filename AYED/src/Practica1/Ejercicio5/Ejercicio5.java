/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parctica1.Ejercicio5;

/**
 *
 * @author Usuario
 */
public class Ejercicio5 {
    public static void main(String[] args) {
        int[] numeros = {10, 5, 8, 20, 2};

        // A: usando return
        String resultadoA = Calcular.withReturn(numeros);
        System.out.println("Resultado A -> " + resultadoA);

        // B: usando parámetro objeto
        Datos r = new Datos();
        Calcular.withParameters(numeros, r);
        System.out.println("Resultado B -> Máximo: " + r.getMax() + ", Mínimo: " + r.getMin() + ", Promedio: " + r.getPromedio());

        // C: sin return ni parámetros
        Calcular.estadisticaC(numeros);
        System.out.println("Resultado C -> Máximo: " + Calcular.maximo + ", Mínimo: " + Calcular.minimo + ", Promedio: " + Calcular.promedio);
    }
       
}
