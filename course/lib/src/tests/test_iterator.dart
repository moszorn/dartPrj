
import 'package:test/test.dart';

/*
main() {
  var iter = [1,5,10].iterator;
  while(iter.moveNext()) {
    print(iter.current);
  }

  var iterable = new Iterable.generate(3);
  var iter2 = iterable.map((n) => n*2).iterator;
  while(iter2.moveNext()) {
    print(iter2.current);
  }
}
 */


class Process {
  int id;
  int memory;
  String name;
  Process(id,emmoey,name);
}


//Process Iterator
class ProcessIterator implements Iterator<Process> {
  
  
  List<Process> list;
  int _currentIndex = -1;

  ProcessIterator(this.list){
     print(this.list.length);
     print(this.list[0].name);
  }

  reset(){
    _currentIndex = -1;
  }

  Process get current => list[_currentIndex];

  bool moveNext() {
    ++_currentIndex;
    return _currentIndex < list.length;
  }
}


final _process =  <Process>[
   Process(1,1000, ' process - 1'),
   Process(2,2000, ' process - 2'),
   Process(3,31000, ' process - 3'),
   Process(4,4000, ' process - 4'),
   Process(5,51000, ' process - 5'),
   Process(6,61000, ' process - 6'),
];
// 一個可以遍歷所有 Process 的虛構類
// 繼承 Iterable 的一個子類。在 C#中稱為 Iterable<Process> 
// Process Iterable
class Processes extends Iterable<Process> {
  final Iterator<Process> iterator = new ProcessIterator(_process);
}

/*
    for(var process in Process()){
      // process stuff ... action
    }
 */

void testIterator() {

  Processes processes = Processes();

  setUp(){
    //Testing Environment goes here
    print('Environment preparation');
  }
  group("測試Iterator", (){
    test('', (){

  
      processes.forEach((p)=>print(p.name));
     // int i = 0;
      // processes.forEach((process)=> expect(process == _process[i++], true));
      
     // processes.forEach((process)=> expec);
    });
  });
}