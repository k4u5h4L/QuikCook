import 'package:quikcook/AppTheme.dart';
import './home_screen.dart';
import './meal_plan_screen.dart';
import './profile_screen.dart';
import './showcase_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/icons/two_tone/two_tone_icon.dart';
import 'package:flutx/icons/two_tone/two_tone_mdi_icons.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:flutx/widgets/bottom_navigation_bar/bottom_navigation_bar_item.dart';

class FullApp extends StatefulWidget {
  @override
  _FullAppState createState() => _FullAppState();
}

class _FullAppState extends State<FullApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.Primary)),
      child: Scaffold(
        body: FxBottomNavigationBar(
          activeTitleStyle: FxTextStyle.caption(
              color: AppTheme.customTheme.Primary, fontWeight: 800),
          itemList: [
            FxBottomNavigationBarItem(
              page: HomeScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.home,
                color: AppTheme.customTheme.Primary.withAlpha(240),
                size: 24,
              ),
              activeIcon: Icon(
                Icons.cottage,
                color: AppTheme.customTheme.Primary,
                size: 24,
              ),
              title: "Home",
              activeIconColor: AppTheme.customTheme.Primary,
            ),
            FxBottomNavigationBarItem(
              page: ShowcaseScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.import_contacts,
                color: AppTheme.customTheme.Primary.withAlpha(240),
                size: 24,
              ),
              activeIcon: Icon(
                Icons.menu_book,
                color: AppTheme.customTheme.Primary.withAlpha(240),
                size: 24,
              ),
              title: "Showcase",
              activeIconColor: AppTheme.customTheme.Primary,
              activeTitleColor: AppTheme.customTheme.Primary,
            ),
            FxBottomNavigationBarItem(
              page: MealPlanScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.fastfood,
                color: AppTheme.customTheme.Primary.withAlpha(240),
                size: 24,
              ),
              activeIcon: Icon(
                Icons.lunch_dining,
                color: AppTheme.customTheme.Primary,
                size: 24,
              ),
              title: "Meal",
              activeIconColor: AppTheme.customTheme.Primary,
              activeTitleColor: AppTheme.customTheme.Primary,
            ),
            FxBottomNavigationBarItem(
              page: ProfileScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.person,
                color: AppTheme.customTheme.Primary.withAlpha(240),
                size: 24,
              ),
              activeIcon: Icon(
                Icons.person,
                color: AppTheme.customTheme.Primary,
                size: 24,
              ),
              title: "Setting",
              activeIconColor: AppTheme.customTheme.Primary,
              activeTitleColor: AppTheme.customTheme.Primary,
            ),
          ],
          activeContainerColor: FxAppTheme.theme.primaryColor.withAlpha(100),
          fxBottomNavigationBarType: FxBottomNavigationBarType.normal,
          backgroundColor: FxAppTheme.customTheme.bgLayer2,
          showLabel: false,
          labelSpacing: 8,
          initialIndex: 0,
          labelDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
