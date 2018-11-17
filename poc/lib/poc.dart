import "dart:io";
import "dart:async";
import "dart:convert";

enum Color {red,black,green,blue}

class Point {
  num x,y;
  Point(this.x,this.y);

  num get distance {
    print('get distance');
    return x+y;
  }

  num get to => x-y;

  set bottom(num v) => x+v;

  @override
  String toString(){
   return '$x,$y';
  }
}


void execute() {
   var p = Point(2,4);
   print(p.distance);
   print(p.to);
   p.bottom = 2;
   print(p.toString());
}
