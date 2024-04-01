part of 'calculator_cubit.dart';

sealed class CalculatorState extends Equatable {
  const CalculatorState({required this.output});

  final String output;

  @override
  List<Object> get props => [output];
}

final class CalculatorInitial extends CalculatorState {
  const CalculatorInitial() : super(output: '0.00');
}

final class CalculatorSuccess extends CalculatorState {
  const CalculatorSuccess({required super.output});
}
