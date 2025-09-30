class AuthModel {
  final String uid;
  final String email;
  final String? name;
  final String? photoUrl;
  final String? phone;
  final bool? isEmailVerified;
  final DateTime createdAt;

  AuthModel({
    required this.uid,
    required this.email,
    this.name,
    this.photoUrl,
    this.phone,
    this.isEmailVerified = false,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'phone': phone,
      'isEmailVerified' : isEmailVerified ?? false,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      photoUrl: map['photoUrl'],
      phone: map['phone'],
      isEmailVerified: map['isEmailVerified'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  @override
  String toString() {
    return 'AuthModel('
        'uid: $uid, '
        'email: $email, '
        'name: $name, '
        'photoUrl: $photoUrl, '
        'phone: $phone, '
        'isEmailVerified: $isEmailVerified'
        'createdAt: $createdAt'
        ')';
  }
}
