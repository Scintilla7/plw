// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:PLW/screens/administrasi/pendataan_screen.dart';
import 'package:flutter/material.dart';

import 'surat_sktm_screen.dart';
// import 'package:flutter/services.dart';

// import 'package:daftar_page/screens/otp_screen.dart';
// import 'package:daftar_page/screens/registrasi/buat_profil_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SKTMScreen(),
      ),
    );
  }
}

class SKTMScreen extends StatefulWidget {
  const SKTMScreen({Key? key}) : super(key: key);

  @override
  _SKTMScreenState createState() => _SKTMScreenState();
}

class _SKTMScreenState extends State<SKTMScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const PendataanScreen()),
              );
            },
            color: Colors.white,
          ),
          title: Text(
            'SKTM', //* Ganti judul di sini
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
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33.0),
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      SizedBox(height: 16),
                      TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: "NIK",
                          hintText: "Masukkan NIK",
                          prefixIcon: const Icon(
                            Icons.credit_card,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mohon masukkan nama lengkap';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate the form before proceeding
                            //TODO if (_formKey.currentState!.validate())
                            {
                              // All fields are valid, navigate to the destination screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SuratSKTMScreen(),
                                ),
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
                            "AJUKAN",
                            style: TextStyle(
                              color: Color.fromARGB(255, 250, 250, 250),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: Text(
                          "*Silakan mendaftar menjadi penduduk tetap terlebih dahulu sebelum mendaftarkan SKTM",
                          style: TextStyle(
                            color: Color(0xFF242F9B),
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Inter',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ])))));
  }
}
