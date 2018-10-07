import 'dart:async';

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;

  await for (var value in stream) {
    sum += value;
  }
  return sum;
}
