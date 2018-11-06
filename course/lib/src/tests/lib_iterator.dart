
class Process {
  // Represents a process...
}


//Process Iterator
class ProcessIterator implements Iterator<Process> {
  Process current;
  bool moveNext() {
    return false;
  }
}

// 一個可以遍歷所有 Process 的虛構類
// 繼承 Iterable 的一個子類。在 C#中稱為 Iterable<Process> 
// Process Iterable
class Processes extends Iterable<Process> {
  final Iterator<Process> iterator = new ProcessIterator();
}

/*
    for(var process in Process()){
      // process stuff ... action
    }
 */