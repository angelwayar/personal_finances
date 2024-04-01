import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(const CalculatorInitial());

  calculatorButtonPressed({required String value}) {
    final String currentOutput = state.output;
    final String buttonText = value;

    if (buttonText == 'C') {
      emit(const CalculatorInitial());
    } else if (buttonText == '=') {
      final String result = _evaluateExpression(expression: currentOutput);

      emit(CalculatorSuccess(output: result));
    } else {
      String newOutput = '';
      if (currentOutput == '0.00') {
        newOutput = buttonText;
      } else {
        newOutput = currentOutput + buttonText;
      }
      emit(CalculatorSuccess(output: newOutput));
    }
  }

  String _evaluateExpression({required String expression}) {
    expression.contains('other');

    // final String text = '12 + 3 - 6 × 2 ÷ 4 + 2';

    return '';
  }
}
