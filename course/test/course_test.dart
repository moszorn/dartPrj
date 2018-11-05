import 'package:course/course.dart';
import 'package:test/test.dart';

void main() {
  test('poc', () {
    //expect(calculate(), 42);


    expect('  hello  '.trim() == 'hello', true);

    // 正確: 檢測字符串是否為空
    expect(''.isEmpty, true);

    //錯誤: 檢測字符串是否為空   
    //expect(!'  '.isEmpty, false);
  });

  test('String 是不可變對象，所以你只能創建 String 對象而無法修改他們', () {
    var greetingTemplate = 'Hello, NAME!';
    var greeting = greetingTemplate.replaceAll(new RegExp('NAME'), 'Bob');
    expect(greetingTemplate != greeting, true);
  });

  test('StringBuffer',(){
    var sb = StringBuffer()
              ..write('use StringBuffer ')
              ..writeAll([
                'a','b','A','B'
              ],'/')
              ..write('.');
        expect(sb.toString() == 'use StringBuffer a/b/A/B.', true);
  });

  test('regexp',(){
    var mary = '我今年十歲',john='my birthday is 20/7';
    var checker = RegExp(r'\d+');
    expect(mary.contains(checker) , false);
    expect(john.contains(checker), true);

    //將所有數字文字用NN取代
    expect(john.replaceAll(checker, 'NN') == 'my birthday is NN/NN', true);

    //檢測字符串中是否有匹配的項
    expect(checker.hasMatch('Luna live 15 to 20 years'), true);

    Iterable<Match> matchs = checker.allMatches('Luna live 15 to 20 years');
    expect(matchs.length,2);
     expect(matchs.first.group(0), '15');
     expect(matchs.last.group(0), '20');
  });
}


