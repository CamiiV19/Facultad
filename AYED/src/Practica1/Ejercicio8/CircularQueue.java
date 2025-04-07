/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica1.Ejercicio8;

public class CircularQueue<T> extends Queue<T> {
    public T shift() {
        T data = dequeue();
        enqueue(data);
        return data;
    }
}
