// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:PLW/screens/administrasi/pendataan_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
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
        body: TamuWajibLaporScreen(),
      ),
    );
  }
}

class TamuWajibLaporScreen extends StatefulWidget {
  const TamuWajibLaporScreen({Key? key}) : super(key: key);

  @override
  _TamuWajibLaporScreenState createState() => _TamuWajibLaporScreenState();
}

class _TamuWajibLaporScreenState extends State<TamuWajibLaporScreen> {
  File? _ktpImage;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _ktpImage = File(pickedFile.path);
      } else {
        if (kDebugMode) {
          print('No image selected.');
        }
      }
    });
  }

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
            'Tamu Wajib Lapor', //* Ganti judul di sini
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
                      GestureDetector(
                        onTap: () => _getImageFromGallery(), // For KTP Image
                        child: Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: _ktpImage != null
                                ? Image.file(_ktpImage!, fit: BoxFit.cover)
                                : Center(
                                    child: Container(
                                      padding: EdgeInsets.all(50.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.camera_alt, size: 50),
                                          Text("Foto KTP"),
                                        ],
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: "Alamat Rumah",
                          hintText: "Masukkan Alamat Rumah",
                          prefixIcon: const Icon(
                            Icons.home,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mohon masukkan alamat rumah';
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
                            // TODO if (_formKey.currentState!.validate())
                            {
                              // All fields are valid, show the success dialog
                              _showSuccessDialog(context);
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
                      const SizedBox(height: 16),
                    ])))));
  }
}

void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Pengajuan Berhasil"),
        content: const Text("Data Anda sudah terkirim"),
        actions: [
          TextButton(
            onPressed: () {
              // You can add additional actions here if needed
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
