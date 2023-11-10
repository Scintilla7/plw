// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DaftarPage(),
      ),
    );
  }
}

class DaftarPage extends StatefulWidget {
  const DaftarPage({Key? key});

  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(45),
      child: Form(
        key: _formKey, // Assign the form key
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
            const SizedBox(height: 101),
            Text(
              'Masukan nomor telepon anda',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                color: Color(0xFF242F9B),
              ),
            ),
            const SizedBox(height: 27),
            TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(
                    10), // set the maximum length for phone numbers
              ],
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                prefixText: '+62 ',
              ),
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter a phone number';
                }
                // add additional validation if needed
                return null;
              },
              onChanged: (value) {
                // handle onChanged event if needed
              },
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                // Validate the form using the _formKey
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  // Validation successful, proceed with the desired action
                  print('Phone number is valid!');
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFF242F9B), // Custom background color
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(200, 50), // Custom width and height
                ),
              ),
              child: const Text("DAFTAR"),
            ),
            SizedBox(height: 200),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Text is tapped!');
                    },
                    child: Text(
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
    ));
  }
}
