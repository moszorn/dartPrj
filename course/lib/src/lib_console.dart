
import 'dart:io';
import 'dart:convert';
import 'dart:async';

//使用 args package
import 'package:args/args.dart';


ArgResults argResults;

class LibConsole {

  static clearScreen(){
    if(Platform.isWindows){
        stdout.write('\x1B[2J\x1B[0f');
      } else {
        stdout.write('\x1B[2J\x1B[3J\x1B[H');
      }
  }

  static stdinPipe2Stdout(){
    //等輸入按下Enter後,直接dump到 console
    stdin.pipe(stdout);
  }

  //執行時輸入 dart main.dart -n txtfile.txt
  //  輸入：  dart main.dart -n ~/project   讀入目錄,但會照成 File().openRead() Exception
  static argHandlerForRadFileWithLineNumber(List<String> args){
    const lineNumber = 'line-number';
    final parser = ArgParser() ..addFlag(lineNumber, negatable: false, abbr: 'n');
    argResults = parser.parse(args);

    //The positional arguments go into ArgResults.rest.
    List<String> paths = argResults.rest;

    _readFileWithLineNumber(paths, argResults[lineNumber]);
  }


}

Future _readFileWithLineNumber(List<String> paths, bool useLineNumber) async{
 
  if(paths.isEmpty){ 
    exitCode = 0;
    stdout.writeln('輸入： dart main.dart -n txtfile.txt   讀入檔案');
    stdout.writeln('輸入： dart main.dart -n ~/project   讀入目錄,但會照成 File().openRead() Exception');
  } 

  var lineNumber = 1;
  for(String path in paths){
     try{

     Stream content = File(path).openRead().transform(utf8.decoder).transform(const LineSplitter());
     
        await for(var line in content){ 
          if(useLineNumber) stdout.write('${lineNumber++} ');
          stdout.writeln('$line');
        }
     } catch (_){
       _handleError(path);
     }
  }
}

Future<void> _handleError(String path) async{
  if(await FileSystemEntity.isDirectory(path)){
    stderr.writeln('錯誤參數： $path 是目錄');
  } else {
    exitCode = 2;
  }
}