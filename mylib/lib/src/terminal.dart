import "dart:io";

//引入同一個 package 的 src目錄,因為 terminal.dart與 option.dart同一層,所以就直接 import
import "option.dart";



/* import "";
import "";
import ""; */

class Terminal {

  const Terminal();

  void printPrompt(String prompt){

    stdout.writeln(prompt);

  }

  void callOption(String str){
    libOption(str);
  }

  String collectInput(){
    return stdin.readLineSync();
  }

  void clearScreen(){
    if(Platform.isWindows){
      stdout.write('\x1B[2J\x1B[0f');
    } else {
      stdout.write('\x1B[2J\x1B[3J\x1B[H');
    }
  }

  void printOptions(List<Option> options){

    options.asMap().forEach((index, option){
      stdout.writeln('[$index] - ${option.label}');
    });

    stdout.writeln('Enter a choice');
    stdout.write('>');
  }
}