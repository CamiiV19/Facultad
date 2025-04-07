
package Parctica1.Ejercicio5;

class Resultado {
    public int max;
    public int min;
    public double promedio;
}

public class Calcular {
    // Método A: Usando return
    public static String withReturn(int[] arreglo) {
        int max = arreglo[0];
        int min = arreglo[0];
        int suma = 0;

        for (int num : arreglo) {
            if (num > max) max = num;
            if (num < min) min = num;
            suma += num;
        }

        double prom = (double) suma / arreglo.length;
        return "Máximo: " + max + ", Mínimo: " + min + ", Promedio: " + prom;
    }
//=====================================================================================================
     // Método B: Usando un parámetro tipo objeto
    public static void withParameters(int[] arreglo, Datos d) {
        int max = arreglo[0];
        int min = arreglo[0];
        int suma = 0;

        for (int num : arreglo) {
            if (num > max) max = num;
            if (num < min) min = num;
            suma += num;
        }

        d.setMax(max);
        d.setMin(min);
        d.setPromedio((double) suma / arreglo.length);
    }
//=====================================================================================================
    // Variables estáticas para estadisticaC
    static int maximo;
    static int minimo;
    static double promedio;
    
    // Método C: Sin return ni parámetros, usa variables de clase
    public static void estadisticaC(int[] arreglo) {
        maximo = arreglo[0];
        minimo = arreglo[0];
        int suma = 0;

        for (int num : arreglo) {
            if (num > maximo) maximo = num;
            if (num < minimo) minimo = num;
            suma += num;
        }

        promedio = (double) suma / arreglo.length;
    }
}

