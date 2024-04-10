import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../blocs/blocs.dart';
import '../../injection.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
    required this.hideNavigationBar,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final bool hideNavigationBar;
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final accountBloc = Injector.getIt.get<AccountBloc>();
    final accountRegisterBloc = Injector.getIt.get<AccountRegisterBloc>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AccountBloc>(
          create: (context) => accountBloc..add(const AccountFetched()),
        ),
        BlocProvider<AccountRegisterBloc>(
          create: (context) => accountRegisterBloc,
        ),
      ],
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: hideNavigationBar
            ? null
            : NavigationBar(
                selectedIndex: navigationShell.currentIndex,
                destinations: const [
                  NavigationDestination(
                    label: 'Home',
                    icon: Icon(Icons.home),
                  ),
                  NavigationDestination(
                    label: 'Statistics',
                    icon: Icon(Iconsax.chart),
                  ),
                  NavigationDestination(
                    label: 'Settings',
                    icon: Icon(Icons.settings),
                  ),
                ],
                onDestinationSelected: _goBranch,
              ),
      ),
    );
  }
}
