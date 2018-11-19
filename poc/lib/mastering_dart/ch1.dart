/** closure function */
import 'ch1_car_lib.dart';
import 'ch1_passenger_car_lib.dart';
import 'ch1_trailer_lib.dart';

class MasteringDartCh1 {
  static Function closure(base) {
    int counter = 0;
    return () => base + (counter++);
  }

  static car_issue(){
    Car car1 = PassengerCar('color', 21000.0 , 2, extraWeight: 18.3) ;
    print(car1.color);
    print(car1.carrying);
    
   

print('\n');


    var car2 = Trailer();
    car2.carry(10.78);
    print(car2.carrying);
  }


}


