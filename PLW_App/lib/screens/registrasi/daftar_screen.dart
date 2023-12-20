// ignore_for_file: library_private_types_in_public_api

import 'package:PLW/screens/registrasi/buat_akun_screen.dart';
import 'package:flutter/material.dart';

import 'package:PLW/screens/registrasi/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DaftarPage(),
    );
  }
}

class DaftarPage extends StatefulWidget {
  const DaftarPage({Key? key}) : super(key: key);

  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        SizedBox(
                          width: 0.4 * constraints.maxWidth,
                          height: 0.2 * constraints.maxHeight,
                          child: Image.asset(
                            'asset/logo_pwl.png', //*Ganti path file disini
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Selamat Datang',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                            color: Color(0xFF242F9B),
                          ),
                        ),
                        SizedBox(height: 0.1 * constraints.maxHeight),
                        const Text(
                          'Masukkan Email Anda',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: Color(0xFF242F9B),
                          ),
                        ),
                        SizedBox(height: 0.05 * constraints.maxHeight),
                        Flexible(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Masukkan Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(),
                              ),
                              prefixIcon: const Icon(
                                  Icons.email), // Add prefix email icon
                            ),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Mohon masukkan email';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(height: 0.07 * constraints.maxHeight),
                        SizedBox(
                          width: 0.8 * constraints.maxWidth,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState != null &&
                                  _formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BuatAkunScreen()),
                                );
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF242F9B),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size(200, 50),
                              ),
                            ),
                            child: const Text(
                              "DAFTAR",
                              style: TextStyle(
                                color: Color.fromARGB(255, 250, 250,
                                    250), // Change the color of the text
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 0.1 * constraints.maxHeight),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                  );
                                },
                                child: const Text(
                                  'Sudah punya akun',
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
              ),
            ),
          );
        },
      ),
    );
  }
}
