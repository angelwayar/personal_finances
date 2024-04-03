import 'package:flutter/material.dart';

import '../core/theme/color_schemes.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({
    super.key,
  });

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  List<bool> tabSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 12.0),
      decoration: BoxDecoration(
        color: lightColorScheme.onSecondaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                tabSelected[0] = !tabSelected[0];
                tabSelected[1] = false;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Ingreso',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                AnimatedContainer(
                  height: 2.0,
                  width: tabSelected[0] ? 60.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          TextButton(
            onPressed: () {
              setState(() {
                tabSelected[1] = !tabSelected[1];
                tabSelected[0] = false;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Gasto',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                AnimatedContainer(
                  height: 2.0,
                  width: tabSelected[1] ? 60.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
