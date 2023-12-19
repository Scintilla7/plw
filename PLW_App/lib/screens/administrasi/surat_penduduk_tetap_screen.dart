// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SuratPendudukTetapScreen(),
      ),
    );
  }
}

class SuratPendudukTetapScreen extends StatefulWidget {
  const SuratPendudukTetapScreen({Key? key}) : super(key: key);

  @override
  State<SuratPendudukTetapScreen> createState() =>
      _SuratPendudukTetapScreenState();
}

class _SuratPendudukTetapScreenState
    extends State<SuratPendudukTetapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          'Surat Penduduk Tetap',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color(0xFF242F9B),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        'asset/suratdummy.png',
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFF242F9B),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(160, 50),
                                ),
                              ),
                              child: const Text(
                                "CETAK",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 250, 250, 250),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            child: ElevatedButton(
                              onPressed: () {
                                // Validate the form before proceeding
                                //TODO if (_formKey.currentState!.validate())
                                {
                                  // All fields are valid, navigate to the destination screen
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         const SuratSKTMScreen(),
                                  //   ),
                                  // );
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFF242F9B),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(160, 50),
                                ),
                              ),
                              child: const Text(
                                "UNDUH",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 250, 250, 250),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
