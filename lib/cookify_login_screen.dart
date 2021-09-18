import 'package:quikcook/AppTheme.dart';
import './cookify_forgot_password_screen.dart';
import './cookify_full_app.dart';
import 'package:flutter/material.dart';
import 'package:flutx/icons/two_tone/two_tone_icon.dart';
import 'package:flutx/icons/two_tone/two_tone_mdi_icons.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';

import 'cookify_register_screen.dart';

class CookifyLoginScreen extends StatefulWidget {
  @override
  _CookifyLoginScreenState createState() => _CookifyLoginScreenState();
}

class _CookifyLoginScreenState extends State<CookifyLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme.copyWith(
              secondary: AppTheme.customTheme.cookifyPrimary.withAlpha(80))),
      child: Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(24, 100, 24, 0),
          children: [
            FxTwoToneIcon(
              FxTwoToneMdiIcons.menu_book,
              color: AppTheme.customTheme.cookifyPrimary,
              size: 64,
            ),
            FxSpacing.height(16),
            Center(
              child: FxText.h5("Log In",
                  color: AppTheme.customTheme.cookifyPrimary, fontWeight: 800),
            ),
            FxSpacing.height(32),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.email,
              filled: true,
              fillColor: AppTheme.customTheme.cookifyPrimary.withAlpha(40),
              enabledBorderColor: AppTheme.customTheme.cookifyPrimary,
              focusedBorderColor: AppTheme.customTheme.cookifyPrimary,
              prefixIconColor: AppTheme.customTheme.cookifyPrimary,
              labelTextColor: AppTheme.customTheme.cookifyPrimary,
              cursorColor: AppTheme.customTheme.cookifyPrimary,
            ),
            FxSpacing.height(24),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.password,
              filled: true,
              fillColor: AppTheme.customTheme.cookifyPrimary.withAlpha(40),
              enabledBorderColor: AppTheme.customTheme.cookifyPrimary,
              focusedBorderColor: AppTheme.customTheme.cookifyPrimary,
              prefixIconColor: AppTheme.customTheme.cookifyPrimary,
              labelTextColor: AppTheme.customTheme.cookifyPrimary,
              cursorColor: AppTheme.customTheme.cookifyPrimary,
            ),
            FxSpacing.height(16),
            Align(
              alignment: Alignment.centerRight,
              child: FxButton.text(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CookifyForgotPasswordScreen()),
                    );
                  },
                  padding: FxSpacing.zero,
                  splashColor:
                      AppTheme.customTheme.cookifyPrimary.withAlpha(40),
                  child: FxText.caption("Forgot Password?",
                      color: AppTheme.customTheme.cookifyPrimary)),
            ),
            FxSpacing.height(16),
            FxButton.block(
                borderRadiusAll: 8,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CookifyFullApp()),
                  );
                },
                backgroundColor: AppTheme.customTheme.cookifyPrimary,
                child: FxText.b1(
                  "Log In",
                  color: AppTheme.customTheme.cookifyOnPrimary,
                  fontWeight: 600,
                  letterSpacing: 0.3,
                )),
            FxSpacing.height(16),
            FxButton.text(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CookifyRegisterScreen()),
                  );
                },
                splashColor: AppTheme.customTheme.cookifyPrimary.withAlpha(40),
                child: FxText.button("I haven\'t an account",
                    decoration: TextDecoration.underline,
                    color: AppTheme.customTheme.cookifyPrimary))
          ],
        ),
      ),
    );
  }
}
