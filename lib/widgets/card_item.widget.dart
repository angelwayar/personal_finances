import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../core/theme/color_schemes.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: lightColorScheme.inversePrimary.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Row(
        children: [
          Container(
            height: 44.0,
            width: 44.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red[200],
            ),
            child: const Icon(Iconsax.bitcoin_card),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Electricidad',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: lightColorScheme.primary,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Iconsax.arrow_circle_down,
                      color: lightColorScheme.error,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      '30\$',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: lightColorScheme.primary,
                      ),
                    ),
                  ],
                ),
                Text(
                  'This is a Description, This is a DescriptionThis is a DescriptionThis is a DescriptionThis is a DescriptionThis is a Description',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: lightColorScheme.primary,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
