import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.deepPurple,
          width: 2.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButtonWidget(
                title: 'Ocio',
                height: 40.0,
                width: 40.0,
                backgroundColor: Colors.red[200]!,
                child: const Center(
                  child: Text(
                    '🍸️',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                onTap: () {},
              ),
              const Spacer(),
              Text(
                'Ver todo',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.blue[400]!,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          const Text('Seleccionados'),
          Row(
            children: [
              IconButtonWidget(
                title: 'Ocio',
                height: 40.0,
                width: 40.0,
                backgroundColor: Colors.red,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red[200]!,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '🍸️',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ),
                onTap: () {},
              ),
              IconButtonWidget(
                title: 'Ocio',
                height: 40.0,
                width: 40.0,
                backgroundColor: Colors.red[200]!,
                child: const Center(
                  child: Text(
                    '🍸️',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                onTap: () {},
              ),
              IconButtonWidget(
                title: 'Ocio',
                height: 40.0,
                width: 40.0,
                backgroundColor: Colors.red[200]!,
                child: const Center(
                  child: Text(
                    '🍸️',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                onTap: () {},
              ),
              IconButtonWidget(
                title: 'Ocio',
                height: 40.0,
                width: 40.0,
                backgroundColor: Colors.red[200]!,
                child: const Center(
                  child: Text(
                    '🍸️',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
