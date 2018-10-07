import "dart:async";

Stream<int> timeCounter(Duration interval, [int maxCount]) async* {
  int i = 0;
  while (true) {
    //thread sleep
    await Future.delayed(interval);

    yield i++;
    if (i == maxCount) break;
  }
}
