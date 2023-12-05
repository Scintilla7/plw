// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
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
        body: PendataanScreen(),
      ),
    );
  }
}

class PendataanScreen extends StatefulWidget {
  const PendataanScreen({Key? key}) : super(key: key);

  @override
  _PendataanScreenState createState() => _PendataanScreenState();
}

class _PendataanScreenState extends State<PendataanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pendataan', //* Ganti judul di sini
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
          child: Column(
            children: [
              SizedBox(height: 16),
            
            ]
          )
        )
      )
    );
  }
}
