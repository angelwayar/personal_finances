import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    this.onTap,
    this.title,
    this.height = 80.0,
    this.width = 80.0,
    required this.child,
    required this.backgroundColor,
  });

  final double? height;
  final double? width;
  final void Function()? onTap;
  final Color backgroundColor;
  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(4.0),
            height: height,
            width: width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
            ),
            child: child,
          ),
          if (title != null)
            Text(
              title!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12.0),
            ),
        ],
      ),
    );
  }
}
