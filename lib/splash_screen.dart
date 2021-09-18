import 'dart:ui';

import 'package:quikcook/AppTheme.dart';
import './login_screen.dart';
import './register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FxTextStyle.changeFontFamily(GoogleFonts.mali);
    FxTextStyle.changeDefaultFontWeight({
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w400,
      500: FontWeight.w500,
      600: FontWeight.w600,
      700: FontWeight.w700,
      800: FontWeight.w800,
      900: FontWeight.w900,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.Primary)),
      child: Scaffold(
        body: Container(
          margin: FxSpacing.fromLTRB(24, 100, 24, 32),
          child: Column(
            children: [
              FxText.h5(
                "Welcome to ",
                color: AppTheme.customTheme.Primary,
              ),
              Expanded(
                child: Center(
                  child: Image(
                    image: AssetImage('./assets/images/quikcook/splash-1.png'),
                    width: 320,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: FxButton.text(
                    splashColor: AppTheme.customTheme.Primary.withAlpha(40),
                    padding: FxSpacing.y(12),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    child: FxText.b1(
                      "SIGN UP",
                      color: AppTheme.customTheme.Primary,
                      letterSpacing: 0.5,
                    ),
                  )),
                  Expanded(
                      child: FxButton(
                    elevation: 0,
                    padding: FxSpacing.y(12),
                    borderRadiusAll: 4,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: FxText.b1(
                      "LOG IN",
                      color: AppTheme.customTheme.OnPrimary,
                      letterSpacing: 0.5,
                    ),
                    backgroundColor: AppTheme.customTheme.Primary,
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
