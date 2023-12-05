// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'package:daftar_page/screens/registrasi/daftar_screen.dart';
import 'package:daftar_page/screens/registrasi/buat_akun_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: OTPPage(),
      ),
    );
  }
}

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  OTPPageState createState() => OTPPageState();
}

//TODO Buat verifikasi OTP berfungsi pake SMS
class OTPPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        fontFamily: 'Inter',
        color: Color(0xFF242F9B),
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 191, 197, 248),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DaftarPage()),
            );
          },
          color: Colors.white,
        ),
        title: Text(
          'Verifikasi OTP',
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
        padding: const EdgeInsets.all(45),
        child: SizedBox(
          height: MediaQuery.of(context).size.height *
              0.8, // Set the desired height
          child: Container(
            margin: const EdgeInsets.only(top: 0),
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    child: const Text(
                      "Masukan kode OTP yang dikirim ke nomor Anda",
                      style: TextStyle(
                        color: Color(0xFF242F9B),
                        fontFamily: 'Inter',
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Pinput(
                    length: 5,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: const Color(0xFF242F9B)),
                      ),
                    ),
                    onCompleted: (pin) => debugPrint(pin),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BuatAkunScreen()),
                        );
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
                        "KONFIRMASI",
                        style: TextStyle(
                          color: Color.fromARGB(255, 250, 250, 250),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Kirim ulang',
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
  }
}
