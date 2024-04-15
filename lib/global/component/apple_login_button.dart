import 'package:flutter/material.dart';
import './base_button.dart';

const double defaultBorderRadius = 3.0;

enum AppleButtonStyle { white, whiteOutline, black }

/// A sign in button that matches Apple's design guidelines.
class AppleSignInButton extends StatelessWidget {
  final String text;
  final AppleButtonStyle style;
  final double borderRadius;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? splashColor;
  final bool centered;

  /// Creates a new button. Set [darkMode] to `true` to use the dark
  /// black background variant with white text, otherwise an all-white background
  /// with dark text is used.
  const AppleSignInButton(
      {this.onPressed,
      // 'Continue with Apple' is also an available variant depdening on App's sign-in experience.
      this.text = 'Sign in with Apple',
      this.textStyle,
      this.splashColor,
      this.style = AppleButtonStyle.black,
      // Apple doesn't specify a border radius, but this looks about right.
      this.borderRadius = defaultBorderRadius,
      this.centered = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(11.0, 8.0, 11.0, 8.0),
      child: StretchableButton(
        buttonColor:
            style == AppleButtonStyle.black ? Colors.black : Colors.white,
        borderRadius: borderRadius,
        splashColor: splashColor,
        buttonBorderColor:
            style == AppleButtonStyle.whiteOutline ? Colors.black : null,
        onPressed: onPressed,
        buttonPadding: 0.0,
        centered: centered,
        children: <Widget>[
          Center(
            child: Row(
              children: <Widget>[
                Container(
                  height: 50.0,
                  width: 32.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.35),
                            blurRadius: 8,
                            offset: const Offset(0, 4))
                      ]),
                  child: Center(
                    child: Image(
                      image: AssetImage(
                        "assets/images/login/apple_logo_${style == AppleButtonStyle.black ? "white" : "black"}.png",
                      ),
                      height: 17.0,
                      width: 17.0,
                    ),
                  ),
                ),
                Text(
                  text,
                  style: textStyle ??
                      TextStyle(
                          fontSize: 17.0,
                          fontFamily: "SF Pro",
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.88)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
