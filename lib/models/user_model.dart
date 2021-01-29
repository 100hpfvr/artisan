enum UserType { PARTICULAR, PROFESSIONAL}

class User {
  User({this.name, this.email, this.phone, this.password, this.type = UserType.PARTICULAR, this.createdAt, String id});

  String id;
  String name;
  String email;
  String phone;
  String password;
  UserType type;
  DateTime createdAt;
}
