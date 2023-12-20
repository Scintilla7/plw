// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:PLW/screens/administrasi/pendataan_screen.dart';
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

  Widget _buildTable() {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder(
        top: BorderSide(width: 1.0),
        left: BorderSide(width: 1.0),
        right: BorderSide(width: 1.0),
        bottom: BorderSide(width: 1.0),
        horizontalInside: BorderSide(width: 1.0),
        verticalInside: BorderSide(width: 1.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
      ),
      columnWidths: {
        0: FlexColumnWidth(2.0),
        1: FlexColumnWidth(2.0),
        2: FlexColumnWidth(1.0),
      },
      children: _tableRows,
    );
  }

  void _addTableRow() {
    setState(() {
      _tableRows.add(_buildRow());
    });
  }

  TableRow _buildRow() {
    return TableRow(
      children: [
        _buildTableCell(TextFormField(
          decoration: InputDecoration(
            labelText: "NIK",
            hintText: "Masukkan NIK",
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Mohon masukkan NIK';
            }
            return null;
          },
        )),
        _buildTableCell(TextFormField(
          decoration: InputDecoration(
            labelText: "Nama",
            hintText: "Masukkan Nama",
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Mohon masukkan nama';
            }
            return null;
          },
        )),
        _buildTableCell(
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              _removeTableRow();
            },
          ),
        ),
      ],
    );
  }

  void _removeTableRow() {
    setState(() {
      if (_tableRows.isNotEmpty) {
        _tableRows.removeLast();
      }
    });
  }

  Widget _buildTableCell(Widget child) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
