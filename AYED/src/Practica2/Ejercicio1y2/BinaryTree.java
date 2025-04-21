/* Ejercicio 1
Considere la siguiente especificación de la clase Java BinatyTree(con la representación hijo
izquierdo e hijo derecho).
● El constructor BinaryTree(T data) inicializa un árbol con el dato pasado como parámetro y
ambos hijos nulos.
● Los métodos getLeftChild():BinaryTree<T> y getRightChild():BinaryTree<T>, retornan
los hijos izquierdo y derecho respectivamente del árbol. Si no tiene el hijo tira error.
● El método addLeftChild(BinaryTree<T> child) y addRightChild(BinaryTree<T> child)
agrega un hijo como hijo izquierdo o derecho del árbol.
● El método removeLeftChild() y removeRightChild(), eliminan el hijo correspondiente.
● El método isEmpty() indica si el árbol está vacío y el método isLeaf() indica si no tiene
hijos.
● El método hasLeftChild() y hasRightChild() devuelve un booleano indicando si tiene
dicho hijo el árbol receptor del mensaje.
a) Analice la implementación en JAVA de la clase BinaryTree brindada por la cátedra. */

package Practica2.Ejercicio1y2;

import java.util.*;

public class BinaryTree <T> {
	
    private T data;// arbol generico
    private BinaryTree<T> leftChild; //hijo izquierdo
    private BinaryTree<T> rightChild; // hijo derecho

    /*public BinaryTree() {
        super();
    }*/

    public BinaryTree(T data) {/*Inicializa el arbol con el dato pasado por 
                                parametro y ambos hijos nulos*/ 
        this.data = data;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
    /**
     * Preguntar antes de invocar si hasLeftChild()
     * @return
     */
    public BinaryTree<T> getLeftChild() {//retorna hijo izquierdo, sino tiene da error
        return leftChild;
    }
    /**
     * Preguntar antes de invocar si hasRightChild()
     * @return
     */
    public BinaryTree<T> getRightChild() {//retorna hijo derecho, sino tiene da error
        return rightChild;
    }

    public void addLeftChild(BinaryTree<T> child) {//agrega hijo izquierdo al arbol
        this.leftChild = child;
    }

    public void addRightChild(BinaryTree<T> child) {//agrega hijo derecho al arbol
        this.rightChild = child;
    }

    public void removeLeftChild() {//elimina hijo izquierdo al arbol
        this.leftChild = null;
    }

    public void removeRightChild() {//elimina hijo derecho al arbol
        this.rightChild = null;
    }

    public boolean isEmpty(){//indica si el arbol esta vacio
        return (this.isLeaf() && this.getData() == null);
    }

    public boolean isLeaf() {//indica si es hoja, no tiene hijos
        return (!this.hasLeftChild() && !this.hasRightChild());
    }

    public boolean hasLeftChild() {// indica si tiene hijo isquierdo, devuelve true
        return this.leftChild!=null;
    }

    public boolean hasRightChild() {// indica si tiene hijo derecho, devuelve true
        return this.rightChild!=null;
    }
    @Override
    public String toString() {
        return this.getData().toString();
    }

/* Ejercicio 2
Agregue a la clase BinaryTree los siguientes métodos:
a) contarHojas():int Devuelve la cantidad de árbol/subárbol hojas del árbol receptor.
b) espejo(): BinaryTree<T> Devuelve el árbol binario espejo del árbol receptor.
c) entreNiveles(int n, m) Imprime el recorrido por niveles de los elementos del árbol
receptor entre los niveles n y m (ambos inclusive). (0≤n<m≤altura del árbol) */    
    
    public int contarHojas() {
        int leftC = 0; 
        int rightC = 0;
        if (this.isEmpty()) 
            return 0;
        else if(this.isLeaf()) 
            return 1;
        else {
            if(this.hasLeftChild()) 
                leftC = this.getLeftChild().contarHojas();
            if(this.hasRightChild()) 
                rightC = this.getRightChild().contarHojas();
            return leftC + rightC;
        }
    }	
    	 
    public BinaryTree<T> espejo(){
        BinaryTree<T> arbEspejo = new BinaryTree<T>(this.getData());
        if(this.hasLeftChild()) {
            arbEspejo.addRightChild(this.getLeftChild().espejo());
        }
        if(this.hasRightChild()) {
            arbEspejo.addLeftChild(this.getRightChild().espejo());
        }
        return arbEspejo;
    }
    
    public void entreNiveles(int n, int m) {
        if (this.isEmpty() || n < 0 || m < n) return; 
        Queue<BinaryTree<T>> cola = new LinkedList();
        cola.add(this);//Se encola la raíz del árbol

        int nivelActual = 0;//contador del nivel actual del arbol.
        //Empezamos desde la raíz, que es el nivel 0.
        
        while(!cola.isEmpty()) {
            int nodoNivel = cola.size();//guardamos cantidad de nodos q hay en ese nivel.
            if(nivelActual >=n && nivelActual <= m) {//si esta dentro del rango
                for(int i=0; i < nodoNivel; i++) {
                    //desencola
                    BinaryTree<T> nodo = cola.poll();//.remove()
                    System.out.print(nodo.getData() + " | ");
                    if(nodo.hasLeftChild()) cola.add(nodo.getLeftChild());
                    if(nodo.hasRightChild()) cola.add(nodo.getRightChild());
                }
            } else {
                for(int i=0; i < nodoNivel; i++) {
                    cola.remove();
                }
            }
            nivelActual++;
            System.out.println("");
        }
    }
    
    public void imprimirArbol() {
        if(this.hasLeftChild()) this.getLeftChild().imprimirArbol();
        System.out.print(this.getData() + " ");
        if(this.hasRightChild()) this.getRightChild().imprimirArbol();
    }
    
    public static void main (String[] args) {
        System.out.println("Test metodos Arboles");
        BinaryTree<Integer> ab = new BinaryTree<Integer>(1);// creo raiz arbol
        
        BinaryTree<Integer> hi = new BinaryTree<Integer>(2);// hi de la raiz
        hi.addLeftChild(new BinaryTree<Integer>(4));// hi de 2
        hi.addRightChild(new BinaryTree<Integer>(5));// hd de 2
        
        BinaryTree<Integer> hd = new BinaryTree<Integer>(3);// hi de la raiz
        hd.addLeftChild(new BinaryTree<Integer>(6));// hi de 3
        
        /* pido que me devuelva el hi y agrege otro hijo a ese
        ab.getLeftChild().addLeftChild(new BinaryTree<Integer>(1));
        ab.getLeftChild().addRightChild(new BinaryTree<Integer>(3));
        ab.getRightChild().addLeftChild(new BinaryTree<Integer>(5));*/
        
        System.out.println(ab.contarHojas());
        System.out.println("Arbol original: ");
        ab.imprimirArbol();
        System.out.println("Arbol espejo: ");
        BinaryTree<Integer> abEspejo = ab.espejo();
        abEspejo.imprimirArbol();
        System.out.println("Impresion Arbol por niveles 0 y 1");
        ab.entreNiveles(0, 2);
    }
}
    
