import 'package:flutter/material.dart';
import 'package:pokercat/global/component/reusable_text.dart';
import '../../imports.dart';
import '../auth/data/constant.dart';
import '../auth/data/sns_firebase_auth.dart';
import '../global/common_size.dart';
import '../global/component/appbar.dart';
import '../global/widget/banner_ad.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isURL(String s) => RegExp(
        r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
      ).hasMatch(s);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  User? edited;
  User? get user => edited ?? authProvider.user;
  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _nameController.dispose();
  //
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pcScafoldColor,
      appBar: const Appbar(
        titleStr: 'Profile body',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isURL(Constant.img)
                ? CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(Constant.img),
                  )
                : const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/catpic3.png'),
                  ),
            const SizedBox(
              height: 10,
            ),
            _username(context),
            const SizedBox(
              height: 10,
            ),
            _userBio(),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppTheme.pcScafoldColor,
                boxShadow: const [
                  BoxShadow(
                    color: AppTheme.pcShadowColor,
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: TextButton(
                style: ElevatedButton.styleFrom(
                 fixedSize: Size(200,50),

                ),
                onPressed: () async {
                  await authProvider.logout();
                  await SnsAuthWithFirebase().googleLogout();

                  AppRoutes.moveToPage(AppLinks.signIn, getOffAll: true);
                },
                child: Center(
                  child: ReusableText(
                    fontWeight: FontWeight.w700,
                    text: 'Log Out',
                    textColor: Colors.white70,
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  Row _appbar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'headache',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Padding _editProfileBtn() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(
  //         horizontal: common_gap, vertical: common_xxs_gap),
  //     child: SizedBox(
  //       child: ElevatedButton(
  //         onPressed: () {
  //           AppRoutes.moveToPage(AppLinks.editProfileScreen, getOff: true);
  //         },
  //         child: Text(
  //           'Edit Profile',
  //           style: TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Padding _changePasswordBtn() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(
  //         horizontal: common_gap, vertical: common_xxs_gap),
  //     child: SizedBox(
  //       child: ElevatedButton(
  //         onPressed: () {
  //           AppRoutes.moveToPage(AppLinks.changePwScreen, getOff: true);
  //         },
  //         child: Text(
  //           'Change Password',
  //           style: TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _username(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: ReusableText(text: Constant.name
          // '${authProvider.user!.username}',
          ),
    );
  }

  Widget _userBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: ReusableText(
        text: Constant.email,
      ),
    );
  }
}

enum SelectedTab { left, right }
