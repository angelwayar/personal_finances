import 'package:flutter/material.dart';

class StattisticsPage extends StatelessWidget {
  const StattisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Statistics Page',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
