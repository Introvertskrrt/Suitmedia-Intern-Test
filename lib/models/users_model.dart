// ignore_for_file: non_constant_identifier_names

class Users {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  Users({this.id, this.email, this.first_name, this.last_name, this.avatar});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
