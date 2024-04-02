import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        // color: Color.fromARGB(255, 213, 236, 255),
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(10.0),
        //   bottomRight: Radius.circular(10.0),
        // ),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: IconButtonWidget(
                  title: 'Ocio',
                  textColor: Colors.white,
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
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: IconButtonWidget(
                  title: 'Ocio',
                  textColor: Colors.white,
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
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: IconButtonWidget(
                  title: 'Ocio',
                  textColor: Colors.white,
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
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: IconButtonWidget(
                  title: 'Ocio',
                  textColor: Colors.white,
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
