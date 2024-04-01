import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:personal_finances/pages/register/card/card_cubit.dart';

import '../../widgets/widgets.dart';
import 'categories_section.dart';
import 'form/form.dart';

class RegisterAccountPage extends StatelessWidget {
  const RegisterAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final accountController = TextEditingController();
    final totalBalanceController = TextEditingController();
    return BlocProvider<CardCubit>(
      create: (context) => CardCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    // physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 260.0,
                        child: BlocBuilder<CardCubit, CardState>(
                          builder: (context, state) {
                            return CardSwiper(
                              cardsCount: 8,
                              cardBuilder: (
                                context,
                                index,
                                horizontalOffsetPercentage,
                                verticalOffsetPercentage,
                              ) {
                                if (index == 0) {
                                  return AccountCardWidget(
                                    account: state.account,
                                    totalBalance: state.totalBalance,
                                  );
                                }
                                return AccountCardWidget(
                                  account: state.account,
                                  totalBalance: state.totalBalance,
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
                              allowedSwipeDirection:
                                  const AllowedSwipeDirection.only(
                                left: true,
                                right: true,
                              ),
                            );
                          },
                        ),
                      ),
                      AccountForm(
                        accountController: accountController,
                        totalBalanceController: totalBalanceController,
                      ),
                      const SizedBox(height: 28.0),
                      const Text('Selecciona una Categoría'),
                      const SizedBox(height: 8.0),
                      const CategoriesSection(),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save new Account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
