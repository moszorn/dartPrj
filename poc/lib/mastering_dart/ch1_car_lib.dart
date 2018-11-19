library car;

abstract class Car {
  String color;
  double speed;
  double carrying;
  Car(this.color, this.carrying);

  void move(double speed) {
    speed = speed;
  }

  void stop() {
    speed = 0.0;
  }
}

