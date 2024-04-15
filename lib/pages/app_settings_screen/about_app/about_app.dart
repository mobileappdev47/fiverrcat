
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokercat/constant.dart';
import 'package:pokercat/global/component/appbar.dart';
import 'package:pokercat/pages/cashgame.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pcScafoldColor,
      appBar: Appbar(
        titleStr: 'About App',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                AppText.appName,
                style: TextStyle(
                    color: AppTheme.pcTextSecondayColor,
                    fontSize: 30,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                AppText.appVersion,
                style: TextStyle(
                    color: AppTheme.pcTextTertiaryColor, fontSize: 12),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'About this app\n\n',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppTheme.pcTextTertiaryColor,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: AppText.appName,
                          style: TextStyle(
                            fontSize: 13,
                            color: AppTheme.pcTextTertiaryColor,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text:
                              ' is a poker preflop application that helps players manage their poker preflop strategies effectively.\nWith ',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppTheme.pcTextTertiaryColor,
                            height: 1.5,
                          ),
                        ),
                        const TextSpan(
                          text: AppText.appName,
                          style: TextStyle(
                            fontSize: 13,
                            color: AppTheme.pcTextTertiaryColor,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text:
                              ', users also can track income, expenses and gain valuable insights into their spending habits and financial goals. Its User-friendly interface assists you in playing poker at the same level as professional poker players. It enables users to crush poker tables such as No-limit Holdem Regular tables of GGpoker. ',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppTheme.pcTextTertiaryColor,
                            height: 1.5,
                          ),
                        ),
                        const TextSpan(
                          text: AppText.appName,
                          style: TextStyle(
                            fontSize: 13,
                            color: AppTheme.pcTextTertiaryColor,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text:
                              ' strives to provide individuals with latest poker preflop charts and the most convinient bankroll management tools.',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppTheme.pcTextTertiaryColor,
                            height: 1.5,
                          ),
                        ),

                        TextSpan(
                          text: '\nPrivacy Policy\n',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppTheme.pcTextQuinaryColor,
                            height: 3,
                            fontWeight: FontWeight.bold,

                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              privacyPolicy();
                            },

                        ),
                        TextSpan(
                          text: '\nTerms & Conditions\n',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppTheme.pcTextQuinaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              termsAndConditions();
                            },
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
