abstract class Car {
  String get color;
  set color(String color);
}

class PassengerCar extends Car {
  static int counter = 0;
  String toString()=> "PassengerCar $color";
  
  String get color => "Passenger color";
  set color(String color) { 
     color = color;    

    // 底下會出現 Maximum call stack size exceeded
    // this.color = color
 }
}  

class Truck extends Car{
  String toString() => "Truck ";
  String get color => "Truck color";
  set color(String color) { 
    color = color;
  }
}

class CarAssemblyLine<E extends Car>{  
  List<E> items = [];  
  void add(e)=> items.insert(0,e);
  make(Function operate)=> items.map((c)=> operate(c));
  log(operate)=> items.forEach((c)=>operate(c));
}

class Operation<E extends Car> implements Function {
  call(E car){
    print('operate ${car}');
  }
}

/*
void main()=> {
   CarAssemblyLine line = CarAssemblyLine();
  
   var o1 = PassengerCar();
  o1.color = "Blue";
    var o2 = PassengerCar();
  o2.color = "Pink";
  
   line.add(o1);
   line.add(o2);
  
   line.log(Operation());
};
 */