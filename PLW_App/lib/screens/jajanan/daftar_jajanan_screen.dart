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
      home: DaftarJajananScreen(),
    );
  }
}

class DaftarJajananScreen extends StatefulWidget {
  const DaftarJajananScreen({super.key});

  @override
  _DaftarJajananScreenState createState() => _DaftarJajananScreenState();
}

class _DaftarJajananScreenState extends State<DaftarJajananScreen> {
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
          'Daftarkan Jajanan Anda',
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
                    'Informasi',
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
                        labelText: 'Nama Warung',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 12.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(55.0)),
                        ),
                        errorText: carOwnerNameError
                            ? 'Mohon masukkan nama warung'
                            : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            carOwnerNameError = true;
                          });
                          return 'Mohon masukkan nama warung';
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
                        labelText: 'Alamat',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 12.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(55.0)),
                        ),
                        errorText: whatsappNumberError
                            ? 'Mohon masukkan alamat'
                            : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            whatsappNumberError = true;
                          });
                          return 'Mohon masukkan alamat';
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
                          'Menu',
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
                        labelText: 'Menu 1',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 12.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(55.0)),
                        ),
                        errorText:
                            supirMobilError ? 'Mohon masukkan nama menu' : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            supirMobilError = true;
                          });
                          return 'Mohon masukkan nama menu';
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
                        labelText: 'Menu 2',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 12.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(55.0)),
                        ),
                        errorText:
                            jenisMobilError ? 'Mohon masukkan nama menu' : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            jenisMobilError = true;
                          });
                          return 'Mohon masukkan nama menu';
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
                        labelText: 'Menu 3',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 12.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(55.0)),
                        ),
                        errorText: nomorKendaraanError
                            ? 'Mohon masukkan nama menu'
                            : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            nomorKendaraanError = true;
                          });
                          return 'Mohon masukkan nama menu';
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
                              labelText: 'Unggah Foto Jajanan',
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 12.0,
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(55.0)),
                              ),
                              errorText: imageUploadError
                                  ? 'Mohon unggah foto jajanan'
                                  : null,
                            ),
                            enabled: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  imageUploadError = true;
                                });
                                return 'Mohon unggah foto jajanan';
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
