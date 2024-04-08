import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/blocs.dart';
import '../../core/theme/color_schemes.dart';
import '../../injection.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';
import 'card/card_cubit.dart';
import 'form/form.dart';

class RegisterAccountPage extends StatelessWidget {
  const RegisterAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    Account account = const Account();
    final accountController = TextEditingController();
    final totalBalanceController = TextEditingController();
    final currencyController = TextEditingController();
    final descriptionController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final accountRegisterBloc = Injector.getIt.get<AccountRegisterBloc>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AccountRegisterBloc>(
          create: (context) => accountRegisterBloc,
        ),
        BlocProvider<CardCubit>(create: (context) => CardCubit()),
      ],
      child: BlocListener<AccountRegisterBloc, AccountRegisterState>(
        listener: (context, state) {
          if (state is AccountRegisterSuccess) {
            context.pop();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: lightColorScheme.onSecondaryContainer,
          ),
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        height: 260.0,
                        margin: const EdgeInsets.only(bottom: 20.0),
                        decoration: BoxDecoration(
                          color: lightColorScheme.onSecondaryContainer,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24.0),
                            bottomRight: Radius.circular(24.0),
                          ),
                        ),
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
                                    callback: (value) {
                                      account = account.copyWith(
                                        imageBg: value,
                                      );
                                    },
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: AccountForm(
                          formKey: formKey,
                          accountController: accountController,
                          totalBalanceController: totalBalanceController,
                          currencyController: currencyController,
                          descriptionController: descriptionController,
                        ),
                      ),
                      const SizedBox(height: 28.0),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                    bottom: 24.0,
                  ),
                  child: BlocBuilder<AccountRegisterBloc, AccountRegisterState>(
                    bloc: accountRegisterBloc,
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state is AccountRegisterInProgress
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  account = account.copyWith(
                                    total: double.parse(accountController.text),
                                    divisa: currencyController.text,
                                    accountNumber:
                                        int.parse(accountController.text),
                                    description: descriptionController.text,
                                  );
                                  accountRegisterBloc.add(
                                    AccountRegisterSaved(
                                      account: account,
                                    ),
                                  );
                                }
                              },
                        child: state is AccountRegisterInProgress
                            ? const CircularProgressIndicator()
                            : const Text('Save new Account'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
