import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../widgets/widgets.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.0,
      child: CardSwiper(
        cardsCount: 4,
        cardBuilder: (
          context,
          index,
          horizontalOffsetPercentage,
          verticalOffsetPercentage,
        ) {
          return const AccountCardWidget();
        },
        onSwipe: (
          int previousIndex,
          int? currentIndex,
          CardSwiperDirection direction,
        ) {
          return true;
        },
        isLoop: true,
        numberOfCardsDisplayed: 4,
        scale: 0.95,
        backCardOffset: const Offset(10, -15),
        allowedSwipeDirection: const AllowedSwipeDirection.only(
          left: true,
          right: true,
        ),
      ),
    );
  }
}
