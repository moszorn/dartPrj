import 'dart:io';
import 'dart:async';
import 'dart:convert';


const String txtfile = 'txtfile.txt';

class FileInfo {
  String fileName;
  String path;
  FileInfo(this.fileName,this.path);
}


/*
I/O 庫可以讓命令行應用讀寫文件和瀏覽目錄。 有兩種讀取文件的方式：一次讀完Future，或者用 stream 流讀取。 
一次讀完一個文件需要消耗一些內存。如果文件非常大，或者你想邊讀取邊 處理，則可以用 Stream
 */
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

  static checkSpecifiedDirectory() {
     String dirName = '../lib';
     Directory dir = Directory(dirName);
     Stream<FileSystemEntity> dirStream = dir.list(recursive: true);
     dirStream.listen(
       (FileSystemEntity f) {
         if(f is File) print('\t ${f.path}');
         else print('${f.path}');
       },
       onError: print,
     );
  }

  static writeLog(){
    //檔案若不存在,會當前目錄建立 lib_file.log檔案
    IOSink logFile = File("lib_file.log")
                      .openWrite(mode:FileMode.append);
   
    ['main git:(master)','Person','because','once','enough.','Mae']
     .forEach((String str)=> logFile.writeln(str));
     logFile.close();
  }

  //openRead 讀行
  static Future readFile(String path) async{
    
    if(path.isEmpty){
      print('path not velid');
      exitCode = 1;
    }
    int n = 1;

    //openRead 讀行, 返回 Stream<List<int>>
    //Stream<List<int>> inputStream = File(path).openRead(); 
    Stream lines = 
      File(path).openRead()
        .transform(utf8.decoder)  //把 UTF-8 字符轉換為一個 Dart string，用 UTF8.decoder 
        .transform(const LineSplitter());

    try{
        await for(var line in lines){
          stdout.writeln('${n++} $line');
        }
    } catch(_) {
      _handleError(path);
    }
  }

  static listenFileRead(){

      final showComplete = ()=> print('read file stream done .');

      //openRead 讀行, 返回 Stream<List<int>>
      Stream<List<int>> contents = File(txtfile).openRead();
      contents
       .transform(utf8.decoder)
       .transform(const LineSplitter())
       .listen(print,  onDone: showComplete, onError: print);
  }

 static Future _handleError(String path) async {
    if(await FileSystemEntity.isDirectory(path)) {
      stderr.writeln("error: $path 是一個目錄");
    } else {
      exitCode = 2;
    }
  }

  //讀取當前目錄下的檔案 txtfile
  //一次讀完文件, File.readAsString() 返回Future
  static readAsString(){
    //預設的 encoding 就會是 utf8
    Future<String> contents = 
      File(txtfile).readAsString();

     contents
      .then((String content)=> print(content));
  }

  //讀取當前目錄下的檔案 txtfile
  //一次讀一行, File.readAsLines() 返回Future
  static readAsLines(){
    //預設的 encoding 就會是 utf8
    Future<List<String>> contents = File(txtfile).readAsLines();

    contents
    .then((List<String> list){
      list.forEach((line)=> print(line));
    });
  }

   //讀取當前目錄下的檔案 txtfile
  //一次讀一行, File.readAsBytes() 返回Future
  static readAsBytes(){
    Future<List<int>> contents = File(txtfile).readAsBytes();

    contents.then((List<int> list){
      list.forEach((byte)=> print("$byte = ${String.fromCharCode(byte)}"));
    });
  }

  //讀取當前目錄下的檔案 txtfile
  //一次讀完文件, File.readAsString() 返回Future
  static readRaiseError(){
    //預設的 encoding 就會是 utf8
    Future<String> contents = File('沒有這個檔案').readAsString(encoding: utf8);

     contents
      .then((String content)=> print(content))
      .catchError((e){

        //直接將 e dump出來就可以知道是哪種形態的 Exception
        print(e);

        FileSystemException err = e as FileSystemException;        
        print('讀取 ${err.path}');
        print('錯誤 : ${err.message}');
      });
  }


}


