import 'package:quikcook/AppTheme.dart';
import './full_app.dart';
import 'package:flutter/material.dart';
import 'package:flutx/icons/two_tone/two_tone_icon.dart';
import 'package:flutx/icons/two_tone/two_tone_mdi_icons.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';

import 'register_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.Primary.withAlpha(80))),
      child: Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(24, 200, 24, 0),
          children: [
            FxTwoToneIcon(
              FxTwoToneMdiIcons.menu_book,
              color: AppTheme.customTheme.Primary,
              size: 64,
            ),
            FxSpacing.height(16),
            FxText.h5(
              "Forgot Password",
              color: AppTheme.customTheme.Primary,
              fontWeight: 800,
              textAlign: TextAlign.center,
            ),
            FxSpacing.height(32),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.email,
              filled: true,
              fillColor: AppTheme.customTheme.Primary.withAlpha(40),
              enabledBorderColor: AppTheme.customTheme.Primary,
              focusedBorderColor: AppTheme.customTheme.Primary,
              prefixIconColor: AppTheme.customTheme.Primary,
              labelTextColor: AppTheme.customTheme.Primary,
              cursorColor: AppTheme.customTheme.Primary,
            ),
            FxSpacing.height(32),
            FxButton.block(
                borderRadiusAll: 8,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FullApp()),
                  );
                },
                backgroundColor: AppTheme.customTheme.Primary,
                child: FxText.b1(
                  "Forgot Password",
                  color: AppTheme.customTheme.OnPrimary,
                  fontWeight: 600,
                  letterSpacing: 0.3,
                )),
            FxSpacing.height(16),
            FxButton.text(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                splashColor: AppTheme.customTheme.Primary.withAlpha(40),
                child: FxText.button("I haven\'t an account",
                    decoration: TextDecoration.underline,
                    color: AppTheme.customTheme.Primary))
          ],
        ),
      ),
    );
  }
}
