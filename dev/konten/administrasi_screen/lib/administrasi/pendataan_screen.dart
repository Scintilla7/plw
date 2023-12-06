// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:administrasi_screen/administrasi/penduduk_tetap_screen.dart';
import 'package:administrasi_screen/administrasi/penduduk_tidak_tetap_screen.dart';
import 'package:administrasi_screen/administrasi/tamu_wajib_lapor_screen.dart';
import 'package:administrasi_screen/administrasi/penduduk_pindah_screen.dart';
import 'package:administrasi_screen/administrasi/daftar_keluarga_screen.dart';
import 'package:administrasi_screen/administrasi/sktm_screen.dart';
import 'package:administrasi_screen/administrasi/laporan_screen.dart';

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
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PendudukTetapScreen()),
                  );
                  print("Button pressed!");
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 77,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          height: 145,
                          color: Color(0xFF242F9B),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 7,
                        child: Container(
                          width: 63,
                          height: 63,
                          decoration: BoxDecoration(
                            color: Color(0xFFdbdffd),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ClipRRect(
                              child: Image.asset(
                                'asset/logo_administrasi/penduduk_tetap.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 90,
                        top: 8,
                        child: SizedBox(
                          height: 63,
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Penduduk Tetap',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PendudukTidakTetapScreen()),
                  );
                  print("Button pressed!");
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 77,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          height: 145,
                          color: Color(0xFF242F9B),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 7,
                        child: Container(
                          width: 63,
                          height: 63,
                          decoration: BoxDecoration(
                            color: Color(0xFFdbdffd),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ClipRRect(
                              child: Image.asset(
                                'asset/logo_administrasi/penduduk_tidak_tetap.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 90,
                        top: 8,
                        child: SizedBox(
                          height: 63,
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Penduduk Tidak Tetap',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TamuWajibLaporScreen()),
                  );
                  print("Button pressed!");
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 77,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          height: 145,
                          color: Color(0xFF242F9B),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 7,
                        child: Container(
                          width: 63,
                          height: 63,
                          decoration: BoxDecoration(
                            color: Color(0xFFdbdffd),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ClipRRect(
                              child: Image.asset(
                                'asset/logo_administrasi/tamu_wajib_lapor.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 90,
                        top: 8,
                        child: SizedBox(
                          height: 63,
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Tamu Wajib Lapor',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PendudukPindahScreen()),
                  );
                  print("Button pressed!");
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 77,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          height: 145,
                          color: Color(0xFF242F9B),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 7,
                        child: Container(
                          width: 63,
                          height: 63,
                          decoration: BoxDecoration(
                            color: Color(0xFFdbdffd),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ClipRRect(
                              child: Image.asset(
                                'asset/logo_administrasi/penduduk_pindah.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 90,
                        top: 8,
                        child: SizedBox(
                          height: 63,
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Penduduk Pindah',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DaftarKeluargaScreen()),
                  );
                  print("Button pressed!");
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 77,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          height: 145,
                          color: Color(0xFF242F9B),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 7,
                        child: Container(
                          width: 63,
                          height: 63,
                          decoration: BoxDecoration(
                            color: Color(0xFFdbdffd),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ClipRRect(
                              child: Image.asset(
                                'asset/logo_administrasi/daftar_keluarga.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 90,
                        top: 8,
                        child: SizedBox(
                          height: 63,
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Daftar Keluarga',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SKTMScreen()),
                  );
                  print("Button pressed!");
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 77,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          height: 145,
                          color: Color(0xFF242F9B),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 7,
                        child: Container(
                          width: 63,
                          height: 63,
                          decoration: BoxDecoration(
                            color: Color(0xFFdbdffd),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ClipRRect(
                              child: Image.asset(
                                'asset/logo_administrasi/sktm.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 90,
                        top: 8,
                        child: SizedBox(
                          height: 63,
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'SKTM',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LaporanScreen()),
                  );
                  print("Button pressed!");
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 77,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          height: 145,
                          color: Color(0xFF242F9B),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 7,
                        child: Container(
                          width: 63,
                          height: 63,
                          decoration: BoxDecoration(
                            color: Color(0xFFdbdffd),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ClipRRect(
                              child: Image.asset(
                                'asset/logo_administrasi/laporan.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 90,
                        top: 8,
                        child: SizedBox(
                          height: 63,
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Laporan',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
