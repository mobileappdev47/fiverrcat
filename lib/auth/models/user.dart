import 'package:equatable/equatable.dart';

import '../../../global/utils.dart';
import '../data/auth_provider.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String authMethod; //같은 이메일로 여러 provider를 통해 가입하는 것을 방지 하기 위해, 인증 제공자를 저장한다. naver,kakao,email 등
  final String status;
  final String email;
  final String phone;
  final String photoURL;
  final String country;
  final String gender;
  final bool isBanned;
  final bool isAdmin;
  final bool isActive;
  final DateTime activeAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.id,
    required this.username,
    required this.authMethod,
    required this.status,
    required this.email,
    required this.phone,
    required this.photoURL,
    required this.country,
    required this.gender,
    required this.isBanned,
    required this.isAdmin,
    required this.isActive,
    required this.activeAt,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isOnline =>
      isActive && DateTime.now().difference(activeAt).inMinutes < 20;

  String get _uid => authProvider.uid;
  bool get isMe => id == _uid;


  factory User.createNew({
    required String uid,
    required String phone,
    required String username,
    required String authMethod,
    String? country,
    String? photoURL,
    String? email,
    String? status,
    String? gender,
  }) {
    return User(
      id: uid,
      username: username,
      authMethod:authMethod,
      email: email ?? '',
      photoURL: photoURL ?? '',
      status: status ?? '',
      phone: phone,
      country: country ?? '',
      gender: gender ?? '',
      isBanned: false,
      isAdmin: false,
      isActive: true,
      activeAt: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  List<String> get searchIndexes {
    final indices = <String>[];
    for (final s in [username]) {
      for (var i = 1; i <= s.length; i++) {
        indices.add(s.substring(0, i).toLowerCase());
      }
    }
    return indices;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'authMethod': authMethod,
      'status': status,
      'email': email,
      'phone': phone,
      'photoURL': photoURL,
      'country': country,
      'gender': gender,
      'isBanned': isBanned,
      'isAdmin': isAdmin,
      'isActive': isActive,
      'activeAt': activeAt,
      'createdAt': createdAt,
      'searchIndexes': searchIndexes,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: parseString(map['id']),
      username: parseString(map['username'] ?? map['name']),
      authMethod:parseString(map['authMethod'] ?? map['authMethod']),
      status: parseString(map['status']),
      email: parseString(map['email']),
      phone: parseString(map['phone'] ?? map['phoneNumber']),
      photoURL: parseString(map['photoURL'] ?? map['photoURL']),
      country: parseString(map['country']),
      gender: parseString(map['gender']),
      isBanned: parseBool(map['isBanned']),
      isAdmin: parseBool(map['isAdmin']),
      isActive: parseBool(map['isActive']),
      activeAt: parseDate(map['lastTimeSeen'] ?? map['activeAt']),
      createdAt: parseDate(map['createdAt']),
      updatedAt: parseDate(map['updatedAt']),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      username,
      status,
      email,
      phone,
      photoURL,
      country,
      gender,
      isBanned,
      isAdmin,
      isActive,
      activeAt,
      createdAt,
      updatedAt,
    ];
  }

  User copyWith({
    String? id,
    String? username,
    String? authMethod,
    String? status,
    String? email,
    String? phone,
    String? photoURL,
    String? country,
    String? gender,
    bool? isBanned,
    bool? isAdmin,
    bool? isActive,
    DateTime? activeAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      authMethod: authMethod ?? this.authMethod,
      status: status ?? this.status,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      photoURL: photoURL ?? this.photoURL,
      country: country ?? this.country,
      gender: gender ?? this.gender,
      isBanned: isBanned ?? this.isBanned,
      isAdmin: isAdmin ?? this.isAdmin,
      isActive: isActive ?? this.isActive,
      activeAt: activeAt ?? this.activeAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
