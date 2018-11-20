/*
  LinkList is efficient when it comes to the insertion and deletion of elements of a complex structure.


  All the elements in LinkedList are based on LinkedListEntry and connected through pointers. 

  Each LinkedListEntry class has a pointer field pointing to the next and previous elements in the list. and 
  It contains the link of the LinkedList instance it belongs to. 

  Before adding the element to another LinkedList class, it must be removed from the current one. If it is not, StateError is thrown.

  Each element of the LinkedList class knows its own position, so we can use methods such as addBefore, addAfter, or unlink of LinkedListEntry to manipulate them


 LinkedList 優點缺點
  . it is not necessary to know the number of elements in advance, and it does not allocate more memory than necessary.
  . Operation such as insertion and deletion have a constant time and handle memory efficienty, especially when the element is inserted in the miffle of a list
  . It uses the exact amount of memoey needed for an underlying element and wrapper.

  x. It doesn`t support random access to any element.
  x. element search can be done only via iteration
  x. it uses more memory to store pointers on linked elements than the list uses
   
 */
import 'dart:collection';


//create a wrapper class based on LinkedListEntry to keep your elements 'Node"
class Node<E> extends LinkedListEntry<Node> {
     final E value;
     Node(this.value);
     @override
     String toString() => value != null ? value.toString() : null;
   }



class LibCollectionLinkList {

  static void run1(){
    LinkedList<Node> list = new LinkedList<Node>();
     Node a = Node("A");
     Node b = Node("B");
     Node c = Node("C");

    //將節點加入 list
    list.add(b);

     b.insertAfter(a);
     b.insertBefore(c);
     print(list);// ( C,B,A)

     b.unlink();
     print(list); // (C,A)
  }
}