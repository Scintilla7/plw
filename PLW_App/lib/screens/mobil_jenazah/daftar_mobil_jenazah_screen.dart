// ignore_for_file: prefer_final_fields, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DaftarMobilJenazahScreen(),
    );
  }
}

class DaftarMobilJenazahScreen extends StatefulWidget {
  const DaftarMobilJenazahScreen({super.key});

  @override
  _DaftarMobilJenazahScreenState createState() =>
      _DaftarMobilJenazahScreenState();
}

class _DaftarMobilJenazahScreenState extends State<DaftarMobilJenazahScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _carOwnerNameController = TextEditingController();
  TextEditingController _whatsappNumberController = TextEditingController();
  TextEditingController _supirMobilController = TextEditingController();
  TextEditingController _jenisMobilController = TextEditingController();
  TextEditingController _nomorKendaraanController = TextEditingController();
  TextEditingController _imageUploadController = TextEditingController();

  double borderWidth = 200.0;
  double verticalSpacing = 24.0;

  bool carOwnerNameError = false;
  bool whatsappNumberError = false;
  bool supirMobilError = false;
  bool jenisMobilError = false;
  bool nomorKendaraanError = false;
  bool imageUploadError = false;

  Future<void> _uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        // Menggunakan path.basename untuk mendapatkan hanya nama file
        _imageUploadController.text = path.basename(pickedFile.path);
        imageUploadError = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftarkan Mobil Anda',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF242F9B),
        toolbarHeight: 138.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF242F9B),
                    width: 2.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(52.0)),
                ),
                width: borderWidth,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Kepemilikan',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF242F9B),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: verticalSpacing,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _carOwnerNameController,
                      decoration: InputDecoration(
                        labelText: 'Nama Pemilik Mobil',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 12.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(55.0)),
                        ),
                        errorText: carOwnerNameError
                            ? 'Mohon masukkan nama pemilik mobil'
                            : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            carOwnerNameError = true;
                          });
                          return 'Mohon masukkan nama pemilik mobil';
                        } else {
                          setState(() {
                            carOwnerNameError = false;
                          });
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _whatsappNumberController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: 'Nomor WhatsApp',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 12.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(55.0)),
                        ),
                        errorText: whatsappNumberError
                            ? 'Mohon masukkan nomor WhatsApp'
                            : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            whatsappNumberError = true;
                          });
                          return 'Mohon masukkan nomor WhatsApp';
                        } else {
                          setState(() {
                            whatsappNumberError = false;
                          });
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: verticalSpacing,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF242F9B),
                          width: 2.0,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(52.0)),
                      ),
                      width: borderWidth,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Spesifikasi',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF242F9B),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: verticalSpacing,
                    ),
                    TextFormField(
                      controller: _supirMobilController,
                      decoration: InputDecoration(
                        labelText: 'Supir Mobil',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 12.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(55.0)),
                        ),
                        errorText: supirMobilError
                            ? 'Mohon masukkan nama supir mobil'
                            : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            supirMobilError = true;
                          });
                          return 'Mohon masukkan nama supir mobil';
                        } else {
                          setState(() {
                            supirMobilError = false;
                          });
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: verticalSpacing,
                    ),
                    TextFormField(
                      controller: _jenisMobilController,
                      decoration: InputDecoration(
                        labelText: 'Jenis Mobil',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 12.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(55.0)),
                        ),
                        errorText: jenisMobilError
                            ? 'Mohon masukkan jenis mobil'
                            : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            jenisMobilError = true;
                          });
                          return 'Mohon masukkan jenis mobil';
                        } else {
                          setState(() {
                            jenisMobilError = false;
                          });
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: verticalSpacing,
                    ),
                    TextFormField(
                      controller: _nomorKendaraanController,
                      decoration: InputDecoration(
                        labelText: 'Nomor Kendaraan / Plat Nomor',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 12.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(55.0)),
                        ),
                        errorText: nomorKendaraanError
                            ? 'Mohon masukkan nomor kendaraan / plat nomor'
                            : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            nomorKendaraanError = true;
                          });
                          return 'Mohon masukkan nomor kendaraan / plat nomor';
                        } else {
                          setState(() {
                            nomorKendaraanError = false;
                          });
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: verticalSpacing,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _imageUploadController,
                            decoration: InputDecoration(
                              labelText: 'Unggah Foto',
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 12.0,
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(55.0)),
                              ),
                              errorText:
                                  imageUploadError ? 'Mohon unggah foto' : null,
                            ),
                            enabled: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  imageUploadError = true;
                                });
                                return 'Mohon unggah foto';
                              } else {
                                setState(() {
                                  imageUploadError = false;
                                });
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        TextButton(
                          onPressed: _uploadImage,
                          child: const Text('Pilih Gambar'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: verticalSpacing,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Lakukan sesuatu setelah tombol submit ditekan
                          // Misalnya, kirim data ke server atau tampilkan pesan sukses

                          {
                            // All fields are valid, show the success dialog
                            _showSuccessDialog(context);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF242F9B), // Text color
                        minimumSize:
                            const Size(double.infinity, 48), // Lebar tombol
                      ),
                      child: const Text('AJUKAN'),
                    ),
                  ],
                ),
              ),
            ],
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
