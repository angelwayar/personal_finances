import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';
import 'cubits/calculator/calculator_cubit.dart';

class CalculatorButtons extends StatelessWidget {
  const CalculatorButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ),
      children: [
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '1');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '1',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '2');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '2',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '3');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '3',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '+');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '+',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '4');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '4',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '5');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '5',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '6');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '6',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '-');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '-',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '7');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '7',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '8');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '8',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '9');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '9',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '×');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '×',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '·');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '·',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '0');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '0',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '=');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '=',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButtonWidget(
          onTap: () {
            context.read<CalculatorCubit>().calculatorButtonPressed(value: '÷');
          },
          backgroundColor: Colors.deepPurple,
          child: const Center(
            child: Text(
              '÷',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
