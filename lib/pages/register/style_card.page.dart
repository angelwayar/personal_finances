import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../widgets/widgets.dart';

class StyleCard extends StatelessWidget {
  const StyleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 260.0,
        child: CardSwiper(
          cardsCount: 8,
          cardBuilder: (
            context,
            index,
            horizontalOffsetPercentage,
            verticalOffsetPercentage,
          ) {
            return AccountCardWidget(
              img: 'assets/background/card$index.jpg',
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
      ),
    );
  }
}
