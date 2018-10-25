import "dart:async";
import "dart:convert";
import "dart:io";

Future<String> processFuture() async {
  await Future.delayed(Duration(seconds: 3));
  //return "Success";
  throw new Exception("Original future error");
}

Future<String> processFuture2() async {
  await Future.delayed(Duration(seconds: 3));
  return "Success";
}
