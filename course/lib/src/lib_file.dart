


import 'dart:io';
import 'dart:async';
import 'dart:convert';

//引入同一個 package 的 src目錄,因為 console.dart與 file.dart同一層,所以就直接 import
import "lib_console.dart";
import "utils.dart";

class FileInfo {
  String fileName;
  String path;
  FileInfo(this.fileName,this.path);
}

class LibFile {
  static fileInCurrentDirList(){    
   RegExp regx = new RegExp(r'\.(dart|html|js)');  
   List<FileInfo> list = 
    Directory.current
     .listSync()
     .where((entity)=> FileSystemEntity.isFileSync(entity.path) && entity.path.contains(regx))
     .map((entity){
       var fileName = entity.path.split(Platform.pathSeparator).last;
       return FileInfo(fileName, entity.path);
     }).toList();

      for(var i = 0 ; i < list.length ; i++)
        stdout.writeln("${list[i].fileName}  ${list[i].path}");
  }

  static fileInCurrentDirectoryMap() {   
   RegExp regx = new RegExp(r'\.(dart|js|html)');  
   Iterable<FileInfo> maps =  
   Directory.current
     .listSync()
     .where((entity)=> FileSystemEntity.isFileSync(entity.path) && entity.path.contains(regx))
     .map((entity){
       var fileName = entity.path.split(Platform.pathSeparator).last;
       return FileInfo(fileName, entity.path);
     });

    for(var m in maps)
      stdout.writeln('${m.path}   ${m.fileName}'); 
  }

  static Future readFile(String path) async{
    if(path.isEmpty){
      exitCode = 1;
    }
    int n = 1;
    Stream lines = File(path).openRead().transform(utf8.decoder).transform(const LineSplitter());
    try{
        await for(var line in lines){
          stdout.writeln('${n++} $line');
        }
    } catch(_) {
      _handleError(path);
    }
  }

 static Future _handleError(String path) async {
    if(await FileSystemEntity.isDirectory(path)) {
      stderr.writeln("error: $path 是一個目錄");
    } else {
      exitCode = 2;
    }
  }
}


