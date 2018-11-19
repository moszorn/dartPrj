library passenger_car;

import 'ch1_car_lib.dart';
import 'ch1_trailer_lib.dart';

class PassengerCar extends Car with Trailer {
  int maxPassengers;
  
  PassengerCar(
    String color,
    double carrying,
    this.maxPassengers,
    {double extraWeight:0.0}): super(color,carrying){
      carry(extraWeight);
    }
}
