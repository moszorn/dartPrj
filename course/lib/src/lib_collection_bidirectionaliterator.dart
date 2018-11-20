
class BiListIterator<E> implements BidirectionalIterator<E> {

  final Iterable<E> _iterable;
  final int _length;
  int _index;
  E _current;

  //constructor has an extra otional back parameter that defines the direction of the iteration
  BiListIterator(Iterable<E> iterable, {bool back:false}) :
    _iterable = iterable,
    _length = iterable.length,
    _index = back ? iterable.length - 1 : 0 ;

  @override
  E get current => _current;


  //回傳布林
  @override
  bool moveNext() {
    int length = _iterable.length;
    if(_length != length){
      throw new ConcurrentModificationError(_iterable);
    }
    if(_index >= length){
      _current = null;
      return false;
    }
    _current = _iterable.elementAt(_index);
    _index++;
    return true;
  }

  //回傳布林
  @override
  bool movePrevious() {
    int length = _iterable.length;
    if(_length != length){
      throw new ConcurrentModificationError(_iterable);
    }
    if( _index < 0){
      _current = null;
      return false;
    }
    _current = _iterable.elementAt(_index);
    _index--;
    return true;
  }
}

class LibCollectionBidirection {

  static void forward(){
    // created an instance ot List , but it might be Set or Queue or any other collectio that implements the Iterable interface .
    var list = List.from([1,2,3,4]);
    BiListIterator iter = BiListIterator(list);
    while(iter.moveNext())
      print(iter.current);
  }

  static void backward(){
    var list = List.from([1,2,3,4]);
    BiListIterator iter = BiListIterator(list , back: true);
    while(iter.movePrevious())
      print(iter.current);
  }
}