
import 'option.dart';
import 'terminal.dart';

final Terminal _terminal = const Terminal();
class Prompter{
  ask(String prompt, List<Option> options) {
        _terminal.printPrompt(prompt);
        _terminal.printOptions(options);
  }
}

/*

Compile time constant variable , can be used to define other constant values

Compile time constant value, it will never change in any way, Diferent value types work differently with const
*/ 