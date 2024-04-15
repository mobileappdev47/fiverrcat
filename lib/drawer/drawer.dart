
import 'package:flutter/material.dart';
import '../imports.dart';



class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width*0.7,
        child: const HomeDrawer2(),
      );
  }
}

class HomeDrawer2 extends StatefulWidget {
  const HomeDrawer2({Key? key}) : super(key: key);


  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer2> {
  List<DrawerList>? drawerList;
  User? _firebaseUser;
  @override
  void initState() {

    setDrawerListArray();
    super.initState();
  }

  void setDrawerListArray() {
    drawerList = <DrawerList>[
      DrawerList(
        
        labelName: 'Home',
        routeName: '/home',
        icon: const Icon(Icons.home),
      ),
      DrawerList(
        labelName: authProvider.isLoggedIn()?'Edit Profile':'Login',
        routeName: authProvider.isLoggedIn()?'/edit_profile_screen':'/sign_in',
        isAssetsImage: true,
        imageName: 'assets/images/supportIcon.png',
      ),
      DrawerList(
        labelName: 'FeedBack',
        icon: const Icon(Icons.help),
      ),
      DrawerList(
        
        labelName: 'Invite Friend',
        icon: const Icon(Icons.group),
      ),
      DrawerList(
        
        labelName: 'Rate the app',
        icon: const Icon(Icons.share),
      ),
      DrawerList(
        
        labelName: 'About Us',
        icon: const Icon(Icons.info),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.notWhite.withOpacity(1.0),
      body: Container(

          decoration: BoxDecoration(
            color: AppTheme.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppTheme.nearlyBlack.withOpacity(1.0), 
                blurRadius: 24),
            ],
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(color: AppTheme.grey.withOpacity(0.6), offset: const Offset(2.0, 4.0), blurRadius: 8),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                                child: Image.asset('assets/images/userImage.png'),
                              ),
                            ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 4),
                      child: Text(
                        'Chris Hemsworth',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Divider(
              height: 1,
              color: AppTheme.grey.withOpacity(0.6),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0.0),
                itemCount: drawerList?.length,
                itemBuilder: (BuildContext context, int index) {

                  return inkwell(drawerList![index]);
                },
              ),
            ),
            Divider(
              height: 1,
              color: AppTheme.grey.withOpacity(0.6),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text(
                    'Sign Out',
                    style: TextStyle(
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppTheme.darkText,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  trailing: const Icon(
                    Icons.power_settings_new,
                    color: Colors.red,
                  ),
                  onTap: () {
                    signOut();
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  void signOut() async{
    BotToast.showLoading();
      await authProvider.logout();
      BotToast.closeAllLoading();
      AppRoutes.moveToPage(AppLinks.signIn, getOff: true);
      if (_firebaseUser != null) {
        _firebaseUser = null;
        await authProvider.logout();
      } else {
        BotToast.closeAllLoading();
      }
    print('Doing Something...'); // Print to console.
  }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          if(listData.routeName != null){
            print('route: ${listData.routeName}');
            AppRoutes.moveToPage(listData.routeName!,getOffAll:true);
          }
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 6.0,
                    height: 46.0,
                    // decoration: BoxDecoration(
                    //   color: widget.screenIndex == listData.index
                    //       ? Colors.blue
                    //       : Colors.transparent,
                    //   borderRadius: new BorderRadius.only(
                    //     topLeft: Radius.circular(0),
                    //     topRight: Radius.circular(16),
                    //     bottomLeft: Radius.circular(0),
                    //     bottomRight: Radius.circular(16),
                    //   ),
                    // ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  listData.isAssetsImage
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset(listData.imageName, color: Get.currentRoute == listData.routeName ? Colors.blue : AppTheme.nearlyBlack),
                        )
                      : Icon(listData.icon?.icon, color: Get.currentRoute == listData.routeName ? Colors.blue : AppTheme.nearlyBlack),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Text(
                    listData.labelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Get.currentRoute == listData.routeName ? Colors.blue : AppTheme.nearlyBlack,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            if(Get.currentRoute == listData.routeName)
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75 - 64,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(28),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(28),
                      ),
                    ),
                  ),
                ),
                
          ],
        ),
      ),
    );
  }
}


class DrawerList {
  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    this.icon,
    
    this.imageName = '',
    this.routeName ='',
  });

  String labelName;
  Icon? icon;
  bool isAssetsImage;
  String imageName;
  
  String? routeName;
}
