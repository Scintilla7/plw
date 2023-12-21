// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:PLW/screens/registrasi/login_screen.dart';
import 'package:flutter/material.dart';

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

// import 'app.dart';
// import 'firebase_options.dart';

// import 'package:PLW/screens/registrasi/buat_profil_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BuatAkunScreen(),
      ),
    );
  }
}

class BuatAkunScreen extends StatefulWidget {
  const BuatAkunScreen({Key? key}) : super(key: key);

  @override
  _BuatAkunScreenState createState() => _BuatAkunScreenState();
}

class _BuatAkunScreenState extends State<BuatAkunScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordconfirmController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isPasswordConfirmVisible = false;
  bool _isCreateAccountInProgress = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordconfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Buat Akun',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Color(0xFF242F9B),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(45),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Masukkan Email",
                            prefixIcon: Icon(
                              Icons.mail,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
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
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordconfirmController,
                          maxLines: 1,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !_isPasswordConfirmVisible,
                          decoration: InputDecoration(
                            labelText: "Konfirmasi Password",
                            hintText: "Masukkan Ulang Password",
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordConfirmVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordConfirmVisible =
                                      !_isPasswordConfirmVisible;
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
                            onPressed: () => submit(
                              context,
                              _emailController.text,
                              _passwordController.text,
                              _passwordconfirmController.text,
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF242F9B),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(200, 50),
                              ),
                            ),
                            child: const Text(
                              "SIMPAN",
                              style: TextStyle(
                                color: Color.fromARGB(255, 250, 250, 250),
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void submit(BuildContext context, String email, String password,
      String confirmpassword) {
    if (email.isEmpty || password.isEmpty || confirmpassword.isEmpty) {
      final snackBar = SnackBar(
        duration: const Duration(seconds: 2),
        content: const Text(
            "Email, Password, dan Konfirmasi Password tidak boleh kosong!"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      return;
    }

    if (_passwordController.text != _passwordconfirmController.text) {
      final snackBar = SnackBar(
        duration: const Duration(seconds: 2),
        content: const Text("Password dan Konfirmasi Password harus sama!"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Simpan Akun"),
          content: const Text("Anda yakin?"),
          actions: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text(
                'TIDAK',
                style: TextStyle(
                  color: Color.fromARGB(255, 250, 250, 250),
                  fontFamily: 'Inter',
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF242F9B)),
              ),
              onPressed: _isCreateAccountInProgress == true
                  ? null
                  : () {
                      if (_formKey.currentState!.validate() == true) {
                        createUser(
                          // name: _nameController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _passwordController.text,
                        ).then((value) {
                          if (value == true) {
                            // Navigate to another screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );

                            // Clear form fields
                            _emailController.clear();
                            _passwordController.clear();
                            _passwordconfirmController.clear();
                          }
                        });
                      }
                    },
              child: const Text(
                'YA',
                style: TextStyle(
                  color: Color.fromARGB(255, 250, 250, 250),
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<bool> createUser({
    // required String name,
    required String email,
    required String password,
  }) async {
    _isCreateAccountInProgress = true;
    if (mounted) {
      setState(() {});
    }
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // log(userCredential.user.toString());
      _isCreateAccountInProgress = false;

      if (mounted) {
        setState(() {});
      }
      showToastMessage('Account create completed.');
      // await userCredential.user?.updateDisplayName(name);
      await userCredential.user?.sendEmailVerification();
      showToastMessage('Account activation URL has been sent to your email.');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code.contains('weak-password') == true) {
        // log('The password provided is too weak.');
        showToastMessage(
          'Password Anda terlalu lemah',
          color: Colors.red,
        );
      } else if (e.code.contains('email-already-in-use') == true) {
        // log('The account already exists for that email.');
        showToastMessage(
          'Email yang dimasukkan sudah terdaftar',
          color: Colors.red,
        );
      }
    } catch (e) {
      log(e.toString());
      showToastMessage(
        e.toString(),
        color: Colors.red,
      );
    }

    _isCreateAccountInProgress = false;
    if (mounted) {
      setState(() {});
    }
    return false;
  }

  void showToastMessage(String content, {Color color = Colors.green}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(content),
      ),
    );
  }
}
