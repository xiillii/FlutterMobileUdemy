import 'dart:convert';

import 'package:teslo_app/features/auth/domain/domain.dart';

class UserMapper {
  static String toJson(User data) => json.encode(data.toJson());
  static User fromJson(Map<String, dynamic> data) => User.fromJson(data);
}
