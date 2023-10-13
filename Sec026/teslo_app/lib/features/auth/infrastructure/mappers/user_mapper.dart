import 'dart:convert';

import 'package:teslo_app/features/auth/domain/domain.dart';

class UserMapper {
  String toJson(User data) => json.encode(data.toJson());
  User fromJson(String str) => User.fromJson(json.decode(str));
}
