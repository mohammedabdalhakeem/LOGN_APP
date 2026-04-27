import 'package:logine_app/model.dart';


class AuthController {
  // بيانات وهمية
  final List<User> _users = [
    User(email: "yahia@gmail.com", password: "123456"),
    User(email: "admin@gmail.com", password: "admin123"),
  ];

  // التحقق من تسجيل الدخول
  bool login(String email, String password) {
    return _users.any((user) =>
        user.email == email && user.password == password);
  }

  // تحقق من صحة البريد
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "البريد الإلكتروني مطلوب";
    }
    if (!value.contains("@")) {
      return "بريد غير صالح";
    }
    return null;
  }

  // تحقق من كلمة المرور
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "كلمة المرور مطلوبة";
    }
    if (value.length < 6) {
      return "يجب أن تكون 6 أحرف على الأقل";
    }
    return null;
  }
}