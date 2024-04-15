
import 'package:firebase_auth/firebase_auth.dart' hide User;
import '../../../imports.dart';
import 'user_repository.dart';

mixin RegisterRepository {
  static Future<void> createNewUser({
    required String username,
    required String authMethod, //같은 이메일로 여러 provider를 통해 가입하는 것을 방지 하기 위해, 인증 제공자를 저장한다. naver,kakao,email 등
    required String phoneNumber,//추가
    String? email,
    String? photoURL,
    String? gender,
    String? password,
  }) async {


      // await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: email!,
      //   password: password!,
      // );
      if(authMethod == 'sns' && email !=null && password != null){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      }

    final doc = await UserRepository.userDoc().get();
    if (doc.exists) return;

      final fUser = FirebaseAuth.instance.currentUser!;// fUser는 authentication을 받은 현재유저의 정보가 담기는것.

    final user = User.createNew(
      uid: fUser.uid,
      username: username,
      authMethod: authMethod,
      phone: phoneNumber,
      email: email,
      photoURL: photoURL ?? fUser.photoURL,
      gender: gender,
    );

    if (!doc.exists) await doc.reference.set(user);
    fUser
      ..updatePhotoURL(user.photoURL)
      ..updateDisplayName(user.username);

    if (user.email.isNotEmpty) {
      fUser.updateEmail(user.email);
    }
  }

  static Future<String> login(String email, String password) async {
    final fUser = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return fUser.user!.uid;}


  static Future<bool> checkIfUsernameTaken(String username) async {
    final result = await UserRepository.usersCol
        .where('username', isEqualTo: username)
        .get();
    return result.docs.isNotEmpty;
  }


}
