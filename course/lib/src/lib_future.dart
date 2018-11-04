import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'lib_console.dart';

//沒有 async
Future<String> _loadString2() {
  return Future.delayed(Duration(seconds: 2))
      .then((_) => '(loadString2) hello world');
}

Future<String> _loadString1() async {
  await Future.delayed(Duration(seconds: 2));
  return '(loadString1) hello world';
}

class LibFuture {
  static Future<Function> closureFun(int x) async {
    return (int y) async => x + y;
  }

  static void loadStringNonBlock() {
    LibConsole.clearScreen();
    print('[loadStringNonBlock] start load String ');
    _loadString1().then((o) => stdout.writeln('  ' + o));
    _loadString2().then((o) => stdout.writeln('  ' + o));
    print('[loadStringNonBlock] end load String');
  }

  static void loadStringBlock() async {
    LibConsole.clearScreen();
    print('[loadStringBlock] start load String......blocking');
    print('  ' + await _loadString1() + '......blocking');
    print('  ' + await _loadString2());
    print('[loadStringBlock] end load String');
  }
}