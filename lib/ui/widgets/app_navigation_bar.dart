import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/constants/string_constant.dart';

import '../../app/constants/app_constant.dart';

class AppNavigationBar extends ConsumerWidget {
  final TabsRouter tabsRouter;
  const AppNavigationBar({super.key, required this.tabsRouter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoTabBar(
      activeColor: AC.appPrimaryDarkColor,
      inactiveColor: AC.navBarDisabledColor,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_dash), label: SC.pokemonList),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart_solid), label: SC.favorites),
      ],
      onTap: tabsRouter.setActiveIndex,
      currentIndex: tabsRouter.activeIndex,
    );
  }
}
