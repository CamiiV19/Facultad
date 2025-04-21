/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica1.Ejercicio8;

import java.util.*;

public class Queue <T> extends Sequence {
    protected List<T> data;
    
    public void Queue() { //constructor
        this.data = new ArrayList<T>();
    }
    
    public void enqueue(T dato) { //inserta el elemento al final de la cola
        data.add(dato);
    }
    
    public T dequeue() { /* Elimina el elemnto del frente de la cola y lo retorna.
                         si la cola esta vacia se produce un error*/   
        return data.remove(0);
    }
    
    public T head() { /* Retorna el elemnto del frente de la cola.
                         si la cola esta vacia se produce un error*/ 
        return data.get(0);
    }
    
    @Override
    public int size() { // Retorna la cantidad de elementos de la cola
        return data.size();
    }
    
    @Override
    public boolean isEmpty() { /* Retorna true si la cola no tiene elementos y 
                                false en caso contrario*/
        return data.size() == 0;
    }
    
    @Override
    public String toString() {
        String str = "[";
	for(T d: data)
            str = str + d +", ";
	str = str.substring(0, str.length()-2)+"]";
	return str;
    }
}