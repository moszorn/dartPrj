

class AssemblyLine<E extends Car>{
  List<E> _items = [];
  add(E item){
    _items.insert(0,item);
  }
  make(operation){
    _items.forEach((E item){
      operation(item);
    });
  }
  contentInfo(){
    print('length of _tiems: ${_items.length}');    
  }
}

abstract class Car{ String color;}
class PassengerCar extends Car{ static int counter = 1 ;String toString()=>"Passenger Car ${counter++}";}
class Truck extends Car{String toString()=>"Truck";}

//Operation 類別實作 Function ( call ),表示這個類別可以當作function 用
class Operation<E extends Car> implements Function{
  final String name;
  Operation(this.name);

  call(E car){
    print('Make $name on $car');
  }
}
