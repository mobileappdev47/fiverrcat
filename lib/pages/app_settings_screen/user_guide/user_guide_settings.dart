
import 'package:flutter/material.dart';
import 'package:pokercat/global/component/appbar.dart';

import '../../../constant.dart';

class UserGuide extends StatefulWidget {
  const UserGuide({super.key});

  @override
  State<UserGuide> createState() => _UserGuideState();
}

class _UserGuideState extends State<UserGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pcScafoldColor,
      appBar: Appbar(
        titleStr: 'User Guide Settings',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Column(),
        ),
      ),
    );
  }
}
