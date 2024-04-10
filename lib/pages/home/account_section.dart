import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../core/theme/color_schemes.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({
    super.key,
    required this.accounts,
  });

  final List<Account> accounts;

  int numberOfCardsDisplayed(int length) {
    if (length > 3) {
      return 4;
    }
    return length;
  }

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
        cardsCount: accounts.length,
        cardBuilder: (
          context,
          index,
          horizontalOffsetPercentage,
          verticalOffsetPercentage,
        ) {
          final account = accounts[index];
          return AccountCardWidget(
            img: account.image,
            totalBalance: account.total!.toStringAsFixed(2),
            account: account.accountNumber.toString(),
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
        numberOfCardsDisplayed: numberOfCardsDisplayed(accounts.length),
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
