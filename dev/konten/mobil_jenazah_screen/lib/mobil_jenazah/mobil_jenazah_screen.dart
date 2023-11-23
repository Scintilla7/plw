// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

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
        body: MobilJenazahScreen(),
      ),
    );
  }
}

class MobilJenazahScreen extends StatefulWidget {
  const MobilJenazahScreen({Key? key}) : super(key: key);

  @override
  _MobilJenazahScreenState createState() => _MobilJenazahScreenState();
}

class _MobilJenazahScreenState extends State<MobilJenazahScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Layanan Mobil Jenazah', //* Ganti judul di sini
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
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(),
          ),
        ),
      ),
    );
  }
}
