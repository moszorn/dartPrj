abstract class Car {
  String color;
}

class PassengerCar extends Car {
  PassengerCar(String color){ this.color = color;}
  @override
  String toString() { return '$color PassengerCar';}
}

class Truck extends Car {
  Truck(String color){ this.color = color;}
  @override
  String toString() =>  '$color Truck';
}


class AssemblyLine<E extends Car> {
  List<E> _items = [];
  add(E e) => _items.add(e);
  make(operation)=> _items.forEach((car)=> operation(car));
}

class Operation<E extends Car> implements Function {
  final String opName;
  Operation(this.opName);
  call(E car) => print('$opName $car');
}

class LibOo {
  static void car_extend_generic_function(){
    print('\tCar , PassengerCar , \n\tTruck , AssemblyLine<E extends Car> , \n\tOperation<E extends Car> Class');
   
    AssemblyLine line = AssemblyLine();
      line.add(Truck('Blue'));
      line.add(PassengerCar('Pink'));
      line.add(Truck('Yellow'));
      line.add(PassengerCar('Green'));

    line.make(Operation('watching ...'));
    line.make(Operation('drying ..'));
  }
}