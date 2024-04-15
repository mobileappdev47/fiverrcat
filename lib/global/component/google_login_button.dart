import 'package:flutter/material.dart';
import '../component/base_button.dart';

const double defaultBorderRadius = 3.0;

class GoogleSignInButton extends StatelessWidget {
  final String text;
  final double borderRadius;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? splashColor;
  final bool centered;

  /// Creates a new button. Set [darkMode] to `true` to use the dark
  /// black background variant with white text, otherwise an all-white background
  /// with dark text is used.
  const GoogleSignInButton(
      {this.onPressed,

        this.text = 'Sign in with Google',
        this.textStyle,
        this.splashColor,

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
        buttonColor: Colors.white,
        borderRadius: borderRadius,
        splashColor: splashColor,
        buttonBorderColor: null,
        onPressed: onPressed,
        buttonPadding: 0.0,
        centered: centered,
        children: <Widget>[
          Center(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 0.0, bottom: 0.0,right: 0.0,top: 0.0),
                  child: Container(
                    height: 50.0,
                    width: 32.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4))
                        ]
                    ),
                    child: const Center(
                      child: Image(
                        image: AssetImage(
                          "assets/images/login/google-logo.png",
                        ),
                        height: 17.0,
                        width: 17.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8.0, 0.0, 8.0),
                  child: Text(
                    text,
                    style: textStyle ??
                        TextStyle(
                            fontSize: 17.0,
                            fontFamily: "SF Pro",
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.78)
                          // color: Colors.black.withOpacity(0.44),
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
