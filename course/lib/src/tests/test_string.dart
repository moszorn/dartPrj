import 'dart:io';
import 'package:test/test.dart';


void testString() {
  stdout.writeln("String");
  test('codeUnitAt(0)', (){
     expect("a".codeUnitAt(0)==97, true);
     expect("A".codeUnitAt(0)==65, true);
  });

  test('codeUnits',(){
    var list = <int>[87,88,89,90];    
    var codeUnits = 'WXYZ'.codeUnits;

    expect(codeUnits[0] == list[0], true);
    expect(codeUnits[1] == list[1], true);
    expect(codeUnits[2] == list[2], true);
    expect(codeUnits[3] == list[3], true);
    expect(codeUnits == list , false);
  });
  test('fromCharCodes ${Iterable.generate(4,(i)=> 87+i)} -> ${String.fromCharCodes([87,88,89,90])}',(){
    Iterable<int> codes = Iterable.generate(4,(i)=> 87+i);
    expect(String.fromCharCodes(codes) == "WXYZ", true);
  });

  

   test('isEmpty', () {
    //expect(calculate(), 42);
    expect('  hello  '.trim() == 'hello', true);
    // 正確: 檢測字符串是否為空
    expect(''.isEmpty, true);
    //錯誤: 檢測字符串是否為空   
    //expect(!'  '.isEmpty, false);
  });

  test('replaceAll', () {
    var greetingTemplate = 'Hello, NAME!';
    var greeting = greetingTemplate.replaceAll(new RegExp('NAME'), 'Bob');
    expect(greetingTemplate != greeting, true);
  });

  test('StringBuffer',(){
    //注意是 StringBuffer 不是 StringBuilder
    var sb = StringBuffer()
              ..write('use StringBuffer ')
              ..writeAll([
                'a','b','A','B'
              ],'/')
              ..write('.');
        expect(sb.toString() == 'use StringBuffer a/b/A/B.', true);
  });


  test('RegExp',(){
    var mary = '我今年十歲',john='my birthday is 20/7';
    var checker = RegExp(r'\d+');
    expect(mary.contains(checker) , false);
    expect(john.contains(checker), true);

    //將所有數字文字用 NN這兩個字母 取代
    expect(john.replaceAll(checker, 'NN') == 'my birthday is NN/NN', true);

    //檢測字符串中是否有匹配的項
    expect(checker.hasMatch('Luna live 15 to 20 years'), true);

    //取出字串中所有匹配的項目
    Iterable<Match> matchs = checker.allMatches('Luna live 15 to 20 years');
    expect(matchs.length,2);
     expect(matchs.first.group(0), '15');
     expect(matchs.last.group(0), '20');
  });
}
