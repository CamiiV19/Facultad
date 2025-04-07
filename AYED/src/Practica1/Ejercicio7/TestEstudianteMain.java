
package Practica1.Ejercicio7;

import java.util.*;

public class TestEstudianteMain {
    public static void main(String[] args) {
    //INCISO D
        List <Estudiante> listaOriginal = new LinkedList <Estudiante>();
        Estudiante e1 = new Estudiante("Guaymas", "Matias", "matutemail", "Facultad de Informatica");
        listaOriginal.add(e1);
        
        Estudiante e2 = new Estudiante("Lima", "Francisco", "panchitomail", "Facultad de Informatica");
        listaOriginal.add(e2);
        
        Estudiante e3 = new Estudiante("Fischer", "Matias", "matifimail", "Facultad de Informatica");
        listaOriginal.add(e3);
        
        System.out.println("Estudiantes de la Facultad de Informatica:");
        for(Estudiante est: listaOriginal)
            System.out.println(est.toString());
        
        List <Estudiante> listaCopia = new LinkedList <Estudiante>(listaOriginal); //Crea una copia independiente del original
        System.out.print("Estudiantes copiados(LinkedList): ");
        System.out.println(listaCopia);
        
        System.out.println("======================");
        
   //   e1.setNombre("Matute"); Se modifica en todas las listas, porque se copian las direcciones a los objetos y lo que se modifico fue el objeto
        listaOriginal.set(0, new Estudiante("Prueba", "Prueba", "pruebamail", "Facultad de Informatica"));
        System.out.print("Estudiantes: ");
        for(Estudiante est: listaOriginal)
            System.out.println(est.toString()); //En este caso este cambio solo se ve en esta lista y no en la copiada, porque se cambio la referencia al objeto Estudiante
        System.out.print("Estudiantes copiados: ");
        System.out.println(listaCopia);
        
        System.out.println("======================");
        
        //Otra forma de copiar una lista es con el metodo addAll(): Crear un nuevo LinkedList y agregar todos los elementos del original usando este metodo
        List <Estudiante> listaCopiadosAdd = new LinkedList <Estudiante>();
        listaCopiadosAdd.addAll(listaOriginal);
        System.out.print("Estudiantes copiados V2: ");
        System.out.println(listaCopiadosAdd);
        
        System.out.println("======================");
        
        //INCISO E
        Estudiante e4 = new Estudiante("Guerrero", "Justina", "justimail", "Facultad de Informatica");
        if(!listaOriginal.contains(e4)) {
            listaOriginal.add(e4);
            System.out.println("Se agrego al alumno correctamente");
        } else {
            System.out.println("El alumno se encuentra repetido");
        }
        System.out.print("Listado con alumnos: ");
        System.out.println(listaOriginal);
        
    }
}
