import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../widgets/account_card.widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 12.0),
            SizedBox(
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
            ),
            const Center(
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
