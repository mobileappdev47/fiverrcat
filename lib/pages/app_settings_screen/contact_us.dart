
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pokercat/constant.dart';
import 'package:pokercat/global/component/appbar.dart';
import 'package:pokercat/global/utils.dart';




class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pcScafoldColor,
      appBar: Appbar(
        titleStr: 'Contact Us',
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[

                      const TextSpan(
                        text: '\n\nHello there!',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppTheme.pcTextTertiaryColor,
                          height: 1.5,
                        ),
                      ),
                      const TextSpan(
                        text:
                        '''\n\nWe're thrilled to hear from you. If you have any questions, feedback, or suggestions related to the PokerCat app, please don't hesitate to get in touch. We appreciate your engagement and are dedicated to providing you with the best possible experience.''',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppTheme.pcTextTertiaryColor,
                          height: 1.5,
                        ),
                      ),
                      const TextSpan(
                        text: '\n\nContact Information:\n',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppTheme.pcTextTertiaryColor,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: '''Email: ''',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppTheme.pcTextTertiaryColor,
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: 'pokercat911@gmail.com',
                        style: const TextStyle(
                            color: AppTheme.pcTextLinkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            email();
                          },
                      ),


                      // const TextSpan(
                      //   text:
                      //   '''\n\nStay connected with us on social media to stay up-to-date with the latest tech news, app updates, and tech-related tips.''',
                      //   style: TextStyle(
                      //     fontSize: 13,
                      //     color: AppTheme.pcTextTertiaryColor,
                      //     height: 1.5,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                            ''''We're always here to assist you and provide you with the latest poker charts.\n\nThank you for being a part of the ''',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppTheme.pcTextTertiaryColor,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: 'Pokercat',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppTheme.pcTextTertiaryColor,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ''' universe\n\n''',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppTheme.pcTextTertiaryColor,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
