// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

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
        body: BeritaScreen(),
      ),
    );
  }
}

class BeritaScreen extends StatefulWidget {
  const BeritaScreen({Key? key}) : super(key: key);

  @override
  _BeritaScreenState createState() => _BeritaScreenState();
}

class _BeritaScreenState extends State<BeritaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Berita Terkini', //* Ganti judul di sini
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
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: Color(0xFF242F9B),
                            width: 2,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'asset/kemerdekaan.png',
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF242F9B),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          maxLines: null,
                          keyboardType: null,
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(
                            color: Color(0xFF242F9B),
                            fontFamily: 'Inter',
                          ),
                          initialValue: //* Ganti isi berita di sini
                              'Assalamualaikum warahmatullahi wabarakatuh, Hadirin yang saya hormati, pada kesempatan yang sangat bersejarah ini, saya sebagai Ketua RT 008, ingin menyampaikan beberapa kata sambutan.\n'
                              '\n'
                              'Peringatan Hari Kemerdekaan adalah momentum penting bagi kita sebagai bangsa untuk mengenang perjuangan dan pengorbanan para pahlawan dan pejuang kita yang telah merebut kemerdekaan Indonesia dari penjajahan.\n'
                              '\n'
                              'Kita harus menghargai dan mengenang jasa-jasa mereka, serta mempertahankan nilai-nilai luhur yang telah mereka perjuangkan.\n'
                              '\n'
                              'Pada kesempatan ini, saya juga ingin mengucapkan terima kasih yang sebesar-besarnya kepada seluruh anggota panitia yang telah bekerja keras dan penuh semangat untuk mempersiapkan upacara bendera ini.\n'
                              '\n'
                              'Tanpa dukungan dan kerjasama dari seluruh pihak, upacara bendera ini tidak akan berjalan dengan lancar.\n'
                              '\n'
                              'Mari kita rayakan peringatan kemerdekaan ini dengan penuh semangat dan kebersamaan, dan mari kita terus memperjuangkan kemerdekaan dan kemajuan bangsa Indonesia.\n'
                              '\n'
                              'Kita harus tetap memegang teguh semangat gotong royong, persatuan, dan toleransi, serta menjunjung tinggi keadilan dan demokrasi.',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
