// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Janji Temu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BuatJanjiTemuScreen(),
    );
  }
}

class BuatJanjiTemuScreen extends StatefulWidget {
  const BuatJanjiTemuScreen({super.key});

  @override
  _BuatJanjiTemuScreenState createState() => _BuatJanjiTemuScreenState();
}

class _BuatJanjiTemuScreenState extends State<BuatJanjiTemuScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedTime;
  final List<String> _times = [
    '08:00 Pagi - 11:00 Siang',
    '01:00 Siang - 03:00 Siang',
    '19:00 Malam - 21:00 Malam',
  ];

  String? _selectedPerson;
  final List<String> _people = [
    'Bapak RT 03, Pak Surya',
    'Bapak RT 05, Pak Syahrul',
    'Bapak RT 01, Pak Restu',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF242F9B),
          title: const Text(
            'Buat Janji Temu',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          toolbarHeight: 137.0,
          titleSpacing: 50,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _dateController,
                          decoration: InputDecoration(
                            labelText: 'Tanggal Janji Temu',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2101),
                                );

                                if (pickedDate != null &&
                                    pickedDate != DateTime.now()) {
                                  _dateController.text =
                                      "${pickedDate.toLocal()}".split(' ')[0];
                                }
                              },
                              icon: const Icon(Icons.calendar_today),
                            ),
                          ),
                          readOnly: true,
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tanggal tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          value: _selectedTime,
                          items: _times.map((time) {
                            return DropdownMenuItem(
                              value: time,
                              child: Text(time),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedTime = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Waktu Janji Temu',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Waktu tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          value: _selectedPerson,
                          items: _people.map((person) {
                            return DropdownMenuItem(
                              value: person,
                              child: Text(person),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedPerson = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Janji Temu dengan',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Pilih orang untuk janji temu';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Keterangan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          String name = _nameController.text;
                          String date = _dateController.text;
                          String time = _selectedTime ?? '';
                          String person = _selectedPerson ?? '';
                          String description = _descriptionController.text;

                          print('Nama: $name');
                          print('Tanggal: $date');
                          print('Waktu: $time');
                          print('Janji Temu dengan: $person');
                          print('Keterangan: $description');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF242F9B),
                        minimumSize: const Size(
                            double.infinity, 50), // Warna teks tombol
                      ),
                      child: const Text('BUAT JANJI TEMU'),
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
