// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:PLW/screens/registrasi/daftar_screen.dart';
import 'package:PLW/screens/home_screen.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  late bool _isLoginInProgress;
  late GlobalKey<FormState> _formKey;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _isLoginInProgress = false;
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(45),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 145,
                    height: 160,
                    child: Image.asset(
                      'asset/logo_pwl.png',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: Color(0xFF242F9B),
                    ),
                  ),
                  const SizedBox(height: 108),
                  TextFormField(
                    controller: _emailController,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "contoh@email.com",
                      prefixIcon: Icon(
                        Icons.mail,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    maxLines: 1,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Masukkan Password",
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoginInProgress == true
                          ? null
                          : () {
                              if (_formKey.currentState!.validate() == true) {
                                loginUser(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text,
                                );
                              }
                            },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFF242F9B),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          Size(200,
                              50), // Set the width and height of the button
                        ),
                      ),
                      child: const Text(
                        "MASUK",
                        style: TextStyle(
                          color: Color.fromARGB(255, 250, 250,
                              250), // Change the color of the text
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 120),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun? ',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: Color(0xFF242F9B),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DaftarPage()),
                            );
                          },
                          child: Text(
                            'Daftar sekarang',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: Color(0xFF242F9B),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    _isLoginInProgress = true;
    if (mounted) {
      setState(() {});
    }
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user?.emailVerified == false) {
        _isLoginInProgress = false;
        showToastMessage(
          'Tolong konfirmasi akun anda.',
          color: Colors.red,
          actionLabel: 'SEND',
          action: () async {
            await userCredential.user?.sendEmailVerification();
            showToastMessage(
              'URL verifikasi telah terkirim ke email Anda.',
              color: Colors.green,
            );
          },
        );
      } else if (userCredential.user?.emailVerified == true) {
        log('login success');
        final UserModel user = UserModel(
          userEmail: email,
          userId: userCredential.user!.uid,
        );
        await UserAuth().saveUserAuth(user);

        // Check if the login was successful before showing the success dialog
        if (userCredential.user != null) {
          _isLoginInProgress = false;

          showLoginSuccessDialog(context);
        }
      }
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Exception: ${e.code}");
      showToastMessage('Email atau Password salah!', color: Colors.red);
    } catch (e) {
      print("General Exception: $e");
      showToastMessage(e.toString(), color: Colors.red);
    }

    _isLoginInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  void showToastMessage(String content,
      {Color color = Colors.green, VoidCallback? action, String? actionLabel}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(content),
        duration: const Duration(seconds: 1), // Set the duration to 2 seconds
        action: actionLabel == null
            ? null
            : SnackBarAction(
                onPressed: () {
                  if (action != null) {
                    action();
                  }
                },
                label: actionLabel,
                textColor: Colors.white,
                backgroundColor: Colors.black38,
              ),
      ),
    );
  }

  void showLoginSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Login Berhasil"),
          content: const Text("Anda berhasil login"),
          actions: [
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF242F9B)),
              ),
              child: const Text(
                'OKE',
                style: TextStyle(
                  color: Color.fromARGB(255, 250, 250, 250),
                  fontFamily: 'Inter',
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
