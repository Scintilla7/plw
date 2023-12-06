// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:administrasi_screen/administrasi/pendataan_screen.dart';
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
        body: DaftarKeluargaScreen(),
      ),
    );
  }
}

class DaftarKeluargaScreen extends StatefulWidget {
  const DaftarKeluargaScreen({Key? key}) : super(key: key);

  @override
  _DaftarKeluargaScreenState createState() => _DaftarKeluargaScreenState();
}

class _DaftarKeluargaScreenState extends State<DaftarKeluargaScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<TableRow> _tableRows = [];

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
                builder: (context) => const PendataanScreen(),
              ),
            );
          },
          color: Colors.white,
        ),
        title: Text(
          'Anggota Keluarga',
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
            child: Column(
              children: [
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
                      return 'Mohon masukkan NIK';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTable(),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Add a new row to the table
                    _addTableRow();
                  },
                  child: Text("Tambah Baris"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTable() {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(1), // Adjust column widths as needed
        1: FlexColumnWidth(2),
      },
      children: _tableRows,
    );
  }

  void _addTableRow() {
    setState(() {
      _tableRows.add(
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "NIK",
                  hintText: "Masukkan NIK",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Nama",
                  hintText: "Masukkan Nama",
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Remove the row when delete button is pressed
                _removeTableRow(_tableRows.length - 1);
              },
            ),
          ],
        ),
      );
    });
  }

  void _removeTableRow(int index) {
    setState(() {
      if (_tableRows.length > 1) {
        _tableRows.removeAt(index);
      }
    });
  }
}
