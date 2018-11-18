import 'package:poc/poc.dart' ;

/*
   Windows: pub.bat run poc:main.dart
   Linux: pub run poc:main.dart
 */
main(List<String> arguments) {

  AssemblyLine<PassengerCar> passengerCarAwwembly = AssemblyLine();
  passengerCarAwwembly.add(PassengerCar());
  passengerCarAwwembly.add(PassengerCar());
  passengerCarAwwembly.add(PassengerCar());
  passengerCarAwwembly.add(PassengerCar());

  passengerCarAwwembly.contentInfo();

  Operation<PassengerCar> operation = Operation("washing ");
  passengerCarAwwembly.make(operation);

}
