library trailer;

// Mix Object
// no declared constructor
// superclass of a mixin can only be an Object
// do not contain calls to super

class Trailer {
  double carrying = 0.0;
  void carry(double weight) {
    carrying += weight;
  }
}
