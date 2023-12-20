// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:PLW/screens/administrasi/pendataan_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PendudukTidakTetapScreen(),
      ),
    );
  }
}

String? selectedGender;
String? selectedAgama;
String? selectedPendidikan;

Icon getGenderIcon(String gender) {
  if (gender == 'Laki-Laki') {
    return const Icon(Icons.male);
  } else if (gender == 'Perempuan') {
    return const Icon(Icons.female);
  } else {
    return const Icon(Icons.person);
  }
}

TextEditingController _dateController = TextEditingController();

class PendudukTidakTetapScreen extends StatefulWidget {
  const PendudukTidakTetapScreen({Key? key}) : super(key: key);

  @override
  _PendudukTidakTetapScreenState createState() =>
      _PendudukTidakTetapScreenState();
}

class _PendudukTidakTetapScreenState extends State<PendudukTidakTetapScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

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
          'Penduduk Tidak Tetap',
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
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                  ],
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
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "Nama Lengkap",
                    hintText: "Masukkan Nama Lengkap",
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
                      return 'Mohon masukkan nama lengkap';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedGender,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGender = newValue!;
                    });
                  },
                  items: <String>['Laki-Laki', 'Perempuan'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          getGenderIcon(value),
                          const SizedBox(width: 8),
                          Text(value),
                        ],
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: "Jenis Kelamin",
                    hintText: "Pilih Jenis Kelamin",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan jenis kelamin';
                    }
                    return null;
                  },
                  icon: const Icon(Icons.arrow_drop_down),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "Tempat Kelahiran",
                    hintText: "Masukkan Tempat Kelahiran",
                    prefixIcon: const Icon(
                      Icons.location_city,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan tempat kelahiran';
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
                    labelText: "Tanggal Kelahiran",
                    hintText: "Masukkan Tanggal Kelahiran",
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
                      return 'Mohon masukkan tanggal kelahiran';
                    }
                    return null;
                  },
                  controller: _dateController,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedAgama,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedAgama = newValue!;
                    });
                  },
                  items: [
                    'Islam',
                    'Kristen Protestan',
                    'Kristen Katolik',
                    'Buddha',
                    'Hindu',
                    'Khonghucu',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: "Agama",
                    hintText: "Pilih Agama",
                    prefixIcon: const Icon(
                      Icons.account_circle,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan agama';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedPendidikan,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedPendidikan = newValue!;
                    });
                  },
                  items: [
                    'SD/MI',
                    'SMP/MTs',
                    'SMA/MA',
                    'SMK',
                    'D1',
                    'D2',
                    'D3',
                    'D4',
                    'S1',
                    'S2',
                    'S3',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: "Tingkat Pendidikan",
                    hintText: "Pilih Tingkat Pendidikan",
                    prefixIcon: const Icon(
                      Icons.school,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan tingkat pendidikan';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "Pekerjaan",
                    hintText: "Masukkan Pekerjaan",
                    prefixIcon: const Icon(
                      Icons.cases_outlined,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan pekerjaan';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "Alamat Rumah",
                    hintText: "Masukkan Alamat Rumah",
                    prefixIcon: const Icon(
                      Icons.home,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan alamat rumah';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: 1,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Jumlah Anggota Keluarga",
                    hintText: "Masukkan Jumlah Anggota Keluarga",
                    prefixIcon: const Icon(
                      Icons.family_restroom,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan jumlah anggota keluarga';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate the form before proceeding
                      // TODO if (_formKey.currentState!.validate())
                      {
                        // All fields are valid, show the success dialog
                        _showSuccessDialog(context);
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

void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Pengajuan Berhasil"),
        content: const Text("Data Anda sudah terkirim"),
        actions: [
          TextButton(
            onPressed: () {
              // You can add additional actions here if needed
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
