import 'package:flutter/material.dart';
import 'package:logine_app/controller.dart';
import 'package:logine_app/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final AuthController _controller = AuthController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      bool success = _controller.login(
        emailController.text,
        passwordController.text,
      );

      if (success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("بيانات غير صحيحة")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6A1B9A),
              Color(0xFF8E24AA),
              Color(0xFFBA68C8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    /// 🔥 أيقونة التطبيق
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.purple.shade100,
                      child: Icon(
                        Icons.lock_outline,
                        size: 40,
                        color: Colors.purple,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20),

                    /// 📧 Email
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: _controller.validateEmail,
                    ),

                    SizedBox(height: 15),

                    /// 🔑 Password
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Password",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: _controller.validatePassword,
                    ),

                    SizedBox(height: 20),

                    /// 🚀 زر تسجيل الدخول
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),

                    SizedBox(height: 20),

                    Text("Or continue with"),

                    SizedBox(height: 15),

                    /// 🌐 Social Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        /// Google
                        _socialButton(
                          icon: Icons.g_mobiledata,
                          color: Colors.red,
                        ),

                        SizedBox(width: 15),

                        /// Facebook
                        _socialButton(
                          icon: Icons.facebook,
                          color: Colors.blue,
                        ),

                        SizedBox(width: 15),

                        /// Twitter
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton({required IconData icon, required Color color}) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 30),
    );
  }
}