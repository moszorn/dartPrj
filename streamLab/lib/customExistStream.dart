import "dart:async";
import "dart:io";

final List<String> src = [
  """
1. Transforming existing streams. 
2. Creating a stream from scratch 
   by using an async* function. 
3 Creating a stream by using a 
  StreamController.
  
  """
];

void source_dump() {
  src.forEach((entry) {
    stdout.write(entry);
  });
  stdout.writeln();
  stdout.writeln();
}

// /eate a new stream is with an asynchronous generator (async*) function.
Stream<String> source() async* {
  source_dump();
  int len = src.length;
  for (int i = 0; i < len; i++) {
    yield src[i];
  }
}

Stream<String> lines(Stream<String> source) async* {
  var partial = '';

  await for (var chunk in source) {
    var lines = chunk.split('\n');

    lines[0] = partial + lines[0];
    partial = lines.removeLast();

    for (var line in lines) {
      yield line;
    }
  }
  if (partial.isNotEmpty) yield partial;
}
