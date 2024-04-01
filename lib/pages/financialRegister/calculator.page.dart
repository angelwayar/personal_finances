import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculator_buttons.dart';
import 'cubits/calculator/calculator_cubit.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorCubit>(
      create: (context) => CalculatorCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Spacer(),
              BlocBuilder<CalculatorCubit, CalculatorState>(
                builder: (context, state) {
                  return Text(
                    state.output,
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w300,
                    ),
                  );
                },
              ),
              const Divider(),
              const Expanded(child: CalculatorButtons()),
            ],
          ),
        ),
      ),
    );
  }
}
