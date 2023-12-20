// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

// import 'package:daftar_page/screens/otp_screen.dart';
import 'package:PLW/screens/registrasi/buat_profil_screen.dart';

void main() => runApp(MyApp());

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
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordconfirmController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isPasswordConfirmVisible = false;

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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 0),
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

  void submit(BuildContext context, String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      final snackBar = SnackBar(
        duration: const Duration(seconds: 2),
        content:
            const Text("Password dan Konfirmasi Password tidak boleh kosong!"),
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
              child: const Text(
                'YA',
                style: TextStyle(
                  color: Color.fromARGB(255, 250, 250, 250),
                  fontFamily: 'Inter',
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BuatProfilScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
