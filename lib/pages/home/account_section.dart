import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../core/theme/color_schemes.dart';
import '../../widgets/widgets.dart';

//TODO: Se debe de parametrizar un initial card
class AccountSection extends StatelessWidget {
  const AccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.0,
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: lightColorScheme.onSecondaryContainer,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24.0),
          bottomRight: Radius.circular(24.0),
        ),
      ),
      child: CardSwiper(
        cardsCount: 4,
        cardBuilder: (
          context,
          index,
          horizontalOffsetPercentage,
          verticalOffsetPercentage,
        ) {
          return const AccountCardWidget(
            img: 'assets/background/card3.jpg',
          );
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
