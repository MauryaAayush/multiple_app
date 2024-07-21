import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: loginController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.elliptical(150, 150)),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/pexels-photo-807598.jpeg',
                            ),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Welcome Back',
                    style: GoogleFonts.ubuntu(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF40744D),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Login to your account',
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    child: TextFormField(
                      controller: loginController.emailController,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: Color(0xFF40744D),),
                        prefixIcon: Icon(Icons.person, color: Color(0xFF40744D),),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        return loginController.validateEmail(value);
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      child: TextFormField(
                        controller: loginController.passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Color(0xFF40744D)),
                          prefixIcon: Icon(Icons.lock, color: Color(0xFF40744D)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              loginController.isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color(0xFF40744D),
                            ),
                            onPressed: () {
                              loginController.isPasswordVisible.value =
                                  !loginController.isPasswordVisible.value;
                            },
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        obscureText: !loginController.isPasswordVisible.value,
                        validator: (value) {
                          return loginController.validatePassword(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              value: loginController.rememberMe.value,
                              onChanged: (value) {
                                loginController.rememberMe.value = value!;
                              },
                              activeColor: Color(0xFF40744D),
                            ),
                          ),
                          Text(
                            'Remember Me',
                            style: TextStyle(color: Color(0xFF40744D),),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Add your forgot password functionality here
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Color(0xFF40744D),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    child: ElevatedButton(
                      onPressed: () {
                        loginController.login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF40744D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Color(0xFF40744D),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
