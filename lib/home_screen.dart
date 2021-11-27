import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quikcook/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/icons/two_tone/two_tone_icon.dart';
import 'package:flutx/icons/two_tone/two_tone_mdi_icons.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:quikcook/models/singleRecipe.dart';
// import 'package:quikcook/models/user.dart';

import 'recipe_screen.dart';
import 'models/recipe.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Recipe recipe;
  late List<Recipe> trendingRecipe;

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    recipe = Recipe.getOne();
    trendingRecipe = Recipe.getList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: FxSpacing.top(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: FxSpacing.x(16),
                  child: FxText.h6("Hello, ${user?.email?.split("@")[0]}!",
                      color: AppTheme.customTheme.Primary, fontWeight: 800),
                ),
                Container(
                  margin: FxSpacing.x(16),
                  child: FxText.b2(
                    "Excited to cook something new today?",
                    color: AppTheme.theme.colorScheme.onBackground,
                    letterSpacing: 0,
                    xMuted: true,
                    fontWeight: 700,
                  ),
                ),
                FxSpacing.height(16),
                FxContainer(
                  margin: FxSpacing.x(16),
                  onTap: null,
                  splashColor: AppTheme.customTheme.Primary.withAlpha(40),
                  color: AppTheme.customTheme.Primary.withAlpha(30),
                  child: Row(
                    children: [
                      FxTwoToneIcon(
                        FxTwoToneMdiIcons.outdoor_grill,
                        color: AppTheme.customTheme.Primary,
                        size: 48,
                      ),
                      FxSpacing.width(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.caption(
                                "There are x recipes waiting for you!",
                                fontWeight: 700),
                            FxButton.text(
                              padding: FxSpacing.zero,
                              onPressed: () {},
                              splashColor:
                                  AppTheme.customTheme.Primary.withAlpha(40),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipeScreen(
                                          key:
                                              Key("${trendingRecipe.hashCode}"),
                                          singleRecipe: trendingRecipe),
                                    ),
                                  );
                                },
                                child: FxText("See Recipes",
                                    color: AppTheme.customTheme.Primary,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                FxSpacing.height(16),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('trendingRecipe')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppTheme.customTheme.Primary),
                                strokeWidth: 2),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      var trendingRecipe = snapshot.data!.docs[0];
                      return Container(
                        margin: FxSpacing.x(16),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RecipeScreen(
                                        key: Key("${trendingRecipe.hashCode}"),
                                        singleRecipe: trendingRecipe)));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Stack(
                              children: [
                                Container(
                                  child: trendingRecipe['imgSrc']
                                          .startsWith("http")
                                      ? Image.network(
                                          trendingRecipe['imgSrc'],
                                          width: 340,
                                          height: 350,
                                        )
                                      : Image(
                                          image: AssetImage(
                                              trendingRecipe['imgSrc']),
                                          width: 340,
                                          height: 350,
                                        ),
                                ),
                                Positioned(
                                    left: 16,
                                    top: 16,
                                    child: FxContainer(
                                      paddingAll: 8,
                                      color: AppTheme.customTheme.Primary
                                          .withAlpha(200),
                                      child: FxText.button(
                                          trendingRecipe['cuisine'],
                                          color: AppTheme.customTheme.OnPrimary,
                                          fontWeight: 600),
                                    )),
                                Positioned(
                                    right: 16,
                                    top: 16,
                                    child: Icon(
                                      recipe.favorite
                                          ? Icons.bookmark
                                          : Icons.bookmark_outline,
                                      color: AppTheme.customTheme.Primary,
                                      size: 28,
                                    )),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: FxSpacing.fromLTRB(16, 48, 16, 32),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                          AppTheme.customTheme.Primary
                                              .withAlpha(220),
                                          AppTheme.customTheme.Primary
                                              .withAlpha(180),
                                          AppTheme.customTheme.Primary
                                              .withAlpha(140),
                                          AppTheme.customTheme.Primary
                                              .withAlpha(100),
                                          Colors.transparent
                                        ],
                                            stops: [
                                          0.1,
                                          0.25,
                                          0.5,
                                          0.7,
                                          1
                                        ])),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FxText.h5(trendingRecipe['name'],
                                            color: Colors.white,
                                            fontWeight: 800),
                                        FxSpacing.height(16),
                                        FxText.caption(
                                            recipe.preparationTime.toString() +
                                                " Recipes | " +
                                                recipe.serving.toString() +
                                                " Serving",
                                            color: Colors.white,
                                            fontWeight: 600),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                FxSpacing.height(16),
                Container(
                    margin: FxSpacing.x(16),
                    child: FxText.sh1(
                      "Trending Recipe",
                      fontWeight: 800,
                    )),
                FxSpacing.height(16),
                SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('recipes')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      AppTheme.customTheme.Primary),
                                  strokeWidth: 2),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Row(
                          children: snapshot.data!.docs.map(
                            (r) {
                              return singleRecipe(
                                SingleRecipe(
                                  name: r['name'],
                                  cuisine: r['cuisine'],
                                  imgSrc: r['imgSrc'],
                                  calories: r['calories'],
                                  carbs: r['carbs'],
                                  category: r['category'],
                                  desc: r['desc'],
                                  ingredients: r['ingredients'],
                                  preparation: r['preparation'],
                                  protein: r['protein'],
                                ),
                              );
                            },
                          ).toList(),
                        );
                      },
                    )),
                FxSpacing.height(16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // List<Widget> recipeList() {
  //   List<Widget> list = [];
  //   list.add(FxSpacing.width(16));

  //   for (int i = 0; i < trendingRecipe.length; i++) {
  //     list.add(singleRecipe(trendingRecipe[i]));
  //     list.add(FxSpacing.width(16));
  //   }

  //   return list;
  // }

  Widget singleRecipe(SingleRecipe recipe) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeScreen(singleRecipe: recipe),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Stack(
          children: [
            Container(
              child: recipe.imgSrc.startsWith("http")
                  ? Image.network(
                      recipe.imgSrc,
                      width: 240,
                      height: 340,
                    )
                  : Image(
                      image: AssetImage(recipe.imgSrc),
                      width: 240,
                      height: 340,
                    ),
            ),
            Positioned(
                left: 16,
                top: 16,
                child: FxContainer(
                  paddingAll: 8,
                  color: Colors.black.withAlpha(200),
                  child: FxText.button(recipe.imgSrc,
                      color: AppTheme.customTheme.OnPrimary, fontWeight: 600),
                )),
            Positioned(
              bottom: 16,
              left: 12,
              right: 12,
              child: FxContainer(
                padding: FxSpacing.xy(12, 16),
                color:
                    Color.lerp(AppTheme.customTheme.Primary, Colors.black, 0.9)!
                        .withAlpha(160),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FxText.sh1(recipe.name,
                              color: Colors.white, fontWeight: 800),
                        ),
                        Icon(
                          true ? Icons.bookmark : Icons.bookmark_outline,
                          color: AppTheme.customTheme.Primary,
                          size: 18,
                        )
                      ],
                    ),
                    FxSpacing.height(16),
                    FxText.overline(
                        recipe.carbs.toString() +
                            " Carbs | " +
                            recipe.protein.toString() +
                            " Protein",
                        color: Colors.white,
                        fontWeight: 600),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
