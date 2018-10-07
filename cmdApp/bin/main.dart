/* import 'package:cmdApp/cmdMath.dart' as cmdApp;

main(List<String> arguments) {
  print('Hello world: ${cmdApp.calculate()}!');
}
 */
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:args/args.dart';

const lineNumber = 'line-number';

ArgResults argResults;

void main(List<String> args) {
  final ArgParser parser = ArgParser()
    ..addFlag(lineNumber, negatable: false, abbr: 'n');

  argResults = parser.parse(args);

  //The positional arguments go into ArgResults.rest.
  List<String> paths = argResults.rest;

  dcat(paths, argResults[lineNumber]);
}

Future dcat(List<String> paths, bool showLineNumbers) async {
  if (paths.isEmpty) {
    stdin.pipe(stdout);
    exitCode = 1;
  } else {
    for (String path in paths) {
      int lineNumber = 1;

      Stream lines = File(path)
          .openRead()
          .transform(utf8.decoder)
          .transform(const LineSplitter());
      /* ses two decoders that transform the data before making it available in the await for block. The UTF8 decoder converts the data into Dart strings. LineSplitter splits the data at newlines. */

      try {
        await for (var line in lines) {
          if (showLineNumbers) {
            stdout.write("${lineNumber++} ");
          }

          stdout.writeln(line);
        }
      } catch (_) {
        _handleError(path);
      }
    }
  }
}

Future _handleError(String path) async {
  if (await FileSystemEntity.isDirectory(path)) {
    stderr.writeln("error: $path is a directory");
  } else {
    exitCode = 2;
  }
}
