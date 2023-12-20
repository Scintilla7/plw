// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:PLW/screens/administrasi/pendataan_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LaporanScreen(),
      ),
    );
  }
}

TextEditingController _dateController = TextEditingController();

class LaporanScreen extends StatefulWidget {
  const LaporanScreen({Key? key}) : super(key: key);

  @override
  _LaporanScreenState createState() => _LaporanScreenState();
}

class _LaporanScreenState extends State<LaporanScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  File? _laporanImage; //* Ganti variabel file image disini

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });

      // Format the selected date and update the text field
      final formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
      _dateController.text = formattedDate;
    }
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _laporanImage = File(pickedFile.path);
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const PendataanScreen()),
            );
          },
          color: Colors.white,
        ),
        title: const Text(
          'Laporan',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "Pelapor",
                    hintText: "Masukkan Nama Pelapor",
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan nama pelapor';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: 1,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    labelText: "Tanggal",
                    hintText: "Masukkan Tanggal",
                    prefixIcon: const Icon(
                      Icons.calendar_month,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan tanggal';
                    }
                    return null;
                  },
                  controller: _dateController,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: null, // Allow unlimited lines
                  decoration: InputDecoration(
                    labelText: "Laporan",
                    hintText: "Masukkan Detail Laporan",
                    prefixIcon: const Icon(
                      Icons.comment,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan detail laporan';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline, // Show enter key
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "Penerima",
                    hintText: "Masukkan Nama Penerima",
                    prefixIcon: const Icon(
                      Icons.account_box,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan nama penerima';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => _getImageFromGallery(), 
                  child: Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: _laporanImage != null
                          ? Image.file(_laporanImage!, fit: BoxFit.cover)
                          : Center(
                              child: Container(
                                padding: const EdgeInsets.all(50.0),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.camera_alt, size: 50),
                                    Text("Foto Laporan"),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate the form before proceeding
                      if (_formKey.currentState!.validate()) {
                        // All fields are valid, you can proceed with your logic
                        // For example, you can call a function to save the data
                        // saveData();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
