import 'package:quikcook/AppTheme.dart';
import 'package:quikcook/models/singleRecipe.dart';
import './models/date_time.dart';
import './models/meal_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';

import 'recipe_screen.dart';

class MealPlanScreen extends StatefulWidget {
  @override
  _MealPlanScreenState createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  int _selectedDate = 0;
  late List<DateTime> _listDateTime;
  late List<MealPlan> _listMealPlan;

  @override
  void initState() {
    super.initState();
    _listDateTime = DateTime.getList();
    _listMealPlan = MealPlan.getList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: FxAppTheme.theme.copyWith(
            colorScheme: AppTheme.theme.colorScheme.copyWith(
                secondary: AppTheme.customTheme.Primary.withAlpha(80))),
        child: Scaffold(
          body: ListView(padding: FxSpacing.all(24), children: [
            FxText.h5("Today\'s Plan", fontWeight: 700, letterSpacing: -0.2),
            FxSpacing.height(16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: buildDateTime(),
              ),
            ),
            FxSpacing.height(24),
            FxContainer(
              color: AppTheme.customTheme.Primary.withAlpha(40),
              child: Column(
                children: [
                  Center(
                      child: FxText.h6(
                    "Vitamins & Minerals",
                    color: AppTheme.customTheme.Primary,
                    fontWeight: 600,
                  )),
                  FxSpacing.height(4),
                  Center(
                      child: FxText.caption(
                    "How Much Should You Take?",
                    color: AppTheme.theme.colorScheme.onBackground,
                    xMuted: true,
                    letterSpacing: 0,
                  )),
                  FxSpacing.height(16),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            FxText.h4(
                              "80",
                              fontWeight: 800,
                              color: AppTheme.customTheme.Primary,
                            ),
                            FxText.overline(
                              "Vitamin A",
                              xMuted: true,
                              letterSpacing: 0,
                            )
                          ],
                        )),
                        VerticalDivider(
                          thickness: 1,
                          color: AppTheme.customTheme.Primary.withAlpha(200),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            FxText.h4(
                              "16",
                              fontWeight: 800,
                              color: AppTheme.customTheme.Primary,
                            ),
                            FxText.overline(
                              "Vitamin B",
                              xMuted: true,
                              letterSpacing: 0,
                            )
                          ],
                        )),
                        VerticalDivider(
                          thickness: 1,
                          color: AppTheme.customTheme.Primary.withAlpha(200),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            FxText.h4(
                              "97",
                              fontWeight: 800,
                              color: AppTheme.customTheme.Primary,
                            ),
                            FxText.overline(
                              "Water",
                              xMuted: true,
                              letterSpacing: 0,
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(24),
            Column(
              children: buildMealPlan(),
            )
          ]),
        ),
      ),
    );
  }

  List<Widget> buildDateTime() {
    List<Widget> list = [];

    for (int i = 0; i < _listDateTime.length; i++) {
      list.add(singleDateTime(i));
    }

    return list;
  }

  Widget singleDateTime(int index) {
    DateTime dateTime = _listDateTime[index];
    bool active = _selectedDate == index;

    return FxContainer.none(
      onTap: () {
        setState(() {
          _selectedDate = index;
        });
      },
      splashColor: AppTheme.customTheme.Primary.withAlpha(40),
      width: 40,
      margin: FxSpacing.x(2),
      padding: FxSpacing.y(8),
      borderRadiusAll: 4,
      color: active ? AppTheme.customTheme.Primary : Colors.transparent,
      child: Column(
        children: [
          FxText.button(dateTime.date,
              color: active
                  ? AppTheme.customTheme.OnPrimary
                  : AppTheme.theme.colorScheme.onBackground),
          FxSpacing.height(8),
          FxText.caption(dateTime.day,
              color: active
                  ? AppTheme.customTheme.OnPrimary
                  : AppTheme.theme.colorScheme.onBackground),
        ],
      ),
    );
  }

  List<Widget> buildMealPlan() {
    List<Widget> list = [];

    for (MealPlan mealPlan in _listMealPlan) {
      list.add(singleMealPlan(mealPlan));
    }

    return list;
  }

  Widget singleMealPlan(MealPlan mealPlan) {
    return InkWell(
      child: FxContainer.none(
        splashColor: AppTheme.customTheme.Primary.withAlpha(40),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeScreen(
                singleRecipe: SingleRecipe(name: "Potato"),
              ),
            ),
          );
        },
        color: Colors.transparent,
        margin: FxSpacing.bottom(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxText.b2(mealPlan.type, muted: true, letterSpacing: 0),
            FxSpacing.height(8),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage(mealPlan.image),
                    height: 56,
                    width: 56,
                  ),
                ),
                FxSpacing.width(8),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.b2(mealPlan.title,
                        fontWeight: 700, letterSpacing: 0),
                    FxSpacing.height(8),
                    FxText.button(mealPlan.time, muted: true, letterSpacing: 0),
                  ],
                )),
                Icon(
                  Icons.chevron_right,
                  color: AppTheme.theme.colorScheme.onBackground,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
