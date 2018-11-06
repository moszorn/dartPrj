import 'dart:io';

enum BloodType {
  O,A,B,AB
}

class Person {

  String firstName;
  String lastName;
  final int fingerPrint;
  final BloodType blood;

   Person(this.firstName,this.lastName,{ BloodType blood,num fingerPrint})
    : blood = (blood??=BloodType.O),
      fingerPrint = (fingerPrint??=0);  
  Person.o(String firstName, String lastName):this(firstName, lastName, blood: null, fingerPrint:null);
  Person.a(String firstName, String lastName):this(firstName, lastName, blood: BloodType.A, fingerPrint:1);
  Person.b(String firstName, String lastName):this(firstName, lastName, blood: BloodType.B, fingerPrint:2);
  Person.ab(String firstName, String lastName):this(firstName, lastName, blood: BloodType.AB, fingerPrint:3);

  //Overwrite hashCode
  int get hashCode {
    int result = fingerPrint;
    result += firstName.hashCode ;
    result += fingerPrint + lastName.hashCode;
    result += fingerPrint + blood.hashCode;
    return result;
  }

  // Overwrite hashCode 則需要同時重寫 operator == 
  bool operator == (other) {
    if(other is! Person) return false;

    //先將 Object轉型為 Person物件
    Person person = other;
    return person.firstName == firstName &&
           person.lastName == lastName &&
           person.blood.index == blood.index &&
           person.fingerPrint - fingerPrint == 0 ;
  }
}

class LibOverwriteHashCode {
  static void use(){
     
     var p1 = Person("O","o");
     var p2 = Person("O","o");

    print('p1 = Person("O","o") == p2 = Person("O","o") -> ${p1 == p2}' );
    var p3 = Person("A","o");
    print('p3 = Person("A","o") == p2 = Person("O","o") -> ${p3 == p2}' );
  }
}