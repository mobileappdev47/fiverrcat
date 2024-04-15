


import 'package:flutter/foundation.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../imports.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;


import '../../global/utils.dart';
import 'localdb.dart';
import 'register.dart';
import 'user_repository.dart';
// Needed because we can't import `dart:html` into a mobile app,
// while on the flip-side access to `dart:io` throws at runtime (hence the `kIsWeb` check below)


class SnsAuthWithFirebase {


  Future<void> signInWithGoogle() async {

      BotToast.showLoading();
      //indicator 돈다
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final OAuthCredential credential;
      try {
        // Create a new credential
        credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
      } on AssertionError {
        BotToast.showText(text: 'Cancelled');
        BotToast.closeAllLoading();

        // 취소되었습니다.
        return;
      }
      // Once signed in, return the UserCredential
      UserCredential userresult ;

      userresult = await FirebaseAuth.instance.signInWithCredential(credential);

      Map<String, dynamic> userData={
        "displayName":userresult.user!.displayName,
        "email":userresult.user!.email,
        "emailVerified":userresult.user!.emailVerified,
        "phoneNumber":userresult.user!.phoneNumber,
        "photoURL":userresult.user!.photoURL,
        "uid":userresult.user!.uid,
        "authMethod": 'google',
      };
      final user = await UserRepository.fetchUser();
      if (user != null) {
        await authProvider.login();
      } else {
        String username = userData['displayName'];
        //만약 username이 겹치면 random 값을 자동으로 할당 한다.
        while(true){
          if (await RegisterRepository.checkIfUsernameTaken(username)) {

            username='${username}_${getRandomString(3)}';
          } else {
            break;
          }
        }
        await RegisterRepository.createNewUser(
          username: username,
          authMethod: 'google',
          email: userData['email'].toString().trim(),
          gender: 'Male',
          phoneNumber:userData['phoneNumber'].toString().replaceAll("-", ""),
          photoURL:userData['photoURL'].toString(),
        );
        BotToast.closeAllLoading();
        await authProvider.login();

      }
      //CHECKING IS ON

      LocalDataSaver.saveLoginData(true);
      LocalDataSaver.saveName(userresult.user!.displayName.toString());
      LocalDataSaver.saveMail(userresult.user!.email.toString());
      LocalDataSaver.saveImg(userresult.user!.photoURL.toString());

    BotToast.closeAllLoading();
}



  Future<void> signInWithApple() async {
    BotToast.showLoading();

    final AuthorizationCredentialAppleID credential;

    try {
      credential= await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],

        webAuthenticationOptions: WebAuthenticationOptions(
          // TODO: Set the `clientId` and `redirectUri` arguments to the values you entered in the Apple Developer portal during the setup
          clientId: 'snsauth.example.com',
          redirectUri:
          // For web your redirect URI needs to be the host of the "current page",
          // while for Android you will be using the API server that redirects back into your app via a deep link
          // deep link 이해 필요
          kIsWeb
              ? Uri.parse(
              'https://modoocodefactoryforsales.firebaseapp.com/__/auth/handler')
              : Uri.parse(
              'https://modoocodefactoryforsales.firebaseapp.com/__/auth/handler'),
          //이부분은 이해가 높지않아서 100점은 아니다
        ),
      );



    } on SignInWithAppleAuthorizationException catch(e){

      switch (e.code) {
        case AuthorizationErrorCode.canceled:
          BotToast.showText(text: '취소되었습니다');
          BotToast.closeAllLoading();
          break;
        case AuthorizationErrorCode.failed:
          BotToast.showText(text: '인증에 실패했습니다');
          BotToast.closeAllLoading();
          break;
        case AuthorizationErrorCode.invalidResponse:
          BotToast.showText(text: '적절하지 않은 응답입니다');
          BotToast.closeAllLoading();
          break;
        case AuthorizationErrorCode.notHandled:
          BotToast.showText(text: '인증되지 않았습니다');
          BotToast.closeAllLoading();
          break;
        case AuthorizationErrorCode.notInteractive:
          BotToast.showText(text: '응답이 없습니다');
          BotToast.closeAllLoading();
          break;
        default:
          BotToast.showText(text: '알 수 없는 문제가 발생했습니다');
          BotToast.closeAllLoading();
      //알수없는 에러
      }
      //코드에 맞게 적절한 메시지 보내기.
      return;
    }catch(e){
      BotToast.showText(text: '인증에 실패했습니다. 잠시 후 다시 시도해주세요');
      BotToast.closeAllLoading();
      //toast message
      //인증실패 다시 시도 하세요.
      return;
    }

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: credential.identityToken,
      accessToken: credential.authorizationCode,
    );

    UserCredential userresult ;



    userresult = await FirebaseAuth.instance.signInWithCredential(oauthCredential);

    Map<String, dynamic> userData={
      "displayName":'${credential.givenName}${credential.familyName}',
      "email":userresult.user!.email??'',
      "emailVerified":userresult.user!.emailVerified,
      "phoneNumber":'',
      "photoURL":userresult.user!.photoURL,
      "uid":userresult.user!.uid,
      "authMethod": 'apple'
    };
    print('credential=$credential');
    print('userresult=$userresult');
    print('credential familyName:${credential.familyName} givenName:${credential.givenName}');

    LocalDataSaver.saveLoginData(true);
    LocalDataSaver.saveName('${credential.givenName??'${'user'}${getRandomString(5)}'}');
    LocalDataSaver.saveMail(userresult.user!.email??'');

    final user = await UserRepository.fetchUser();

    if (user != null) {
      await authProvider.login();
    } else {
      String username = userData['displayName'];

      //만약 username이 겹치면 random 값을 자동으로 할당 한다.
      while(true){
        if (await RegisterRepository.checkIfUsernameTaken(username)) {
          username='${username}_${getRandomString(3)}';
        } else {
          break;
        }
      }
      await RegisterRepository.createNewUser(
        username: username,
        authMethod: 'apple',
        email: userData['email'].toString(),
        gender: 'Male',
        phoneNumber:userData['phoneNumber'].toString().replaceAll("-", ""),
        photoURL:userData['photoURL'].toString(),
      );
      BotToast.closeAllLoading();
      await authProvider.login();
    }

    BotToast.closeAllLoading();
  }

  Future<void> signInWithFirebase(Map<String, dynamic>? body) async {

    UserCredential userresult;
    
    try{
      String token=body?['token'].toString()??'emptytoken';
      userresult =await FirebaseAuth.instance.signInWithCustomToken(token);

      Map<String, dynamic> userData={
        "displayName":userresult.user!.displayName,
        "email":userresult.user!.email??body?['data']['email']??'',
        "emailVerified":userresult.user!.emailVerified,
        "phoneNumber":userresult.user!.phoneNumber??body?['data']['phone_number']??'',
        "photoURL":userresult.user!.photoURL,
        "uid":userresult.user!.uid,
        "authMethod":body?['data']['authMethod']??'none'
      };

      final user = await UserRepository.fetchUser();
      if (user != null) {
        await authProvider.login();
      }else{
        String username=userData['displayName'].toString();

        //만약 username이 겹치면 random 값을 자동으로 할당 한다. 
        while(true){
          if (await RegisterRepository.checkIfUsernameTaken(username)) {
            username='${username}_${getRandomString(3)}';
          }else{
            break;
          }
        }

        await RegisterRepository.createNewUser(
          username: username,
          authMethod: userData['authMethod'].toString(),
          email: userData['email'].toString(),
          gender: 'Male',
          phoneNumber:userData['phoneNumber'].toString().replaceAll("-", ""),
          photoURL:userData['photoURL'].toString(),
          
        );
        BotToast.closeAllLoading();
        await authProvider.login();
      }
      
    }catch(e){
      //returnData={"result":false,"message":e.toString(),"data":""};
      print(e.toString());
      BotToast.showText(text:e.toString());

    }
  }




  Future<void> googleLogout() async {
    await GoogleSignIn().disconnect();
    LocalDataSaver.saveLoginData(false);
    FirebaseAuth.instance.signOut();
  }

}