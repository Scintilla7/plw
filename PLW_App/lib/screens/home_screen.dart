// ignore_for_file: library_private_types_in_public_api

import 'package:PLW/screens/jajanan/jajanan_screen.dart';
import 'package:PLW/screens/registrasi/login_screen.dart';
import 'package:flutter/material.dart';

import 'berita/berita_screen.dart';
import 'administrasi/pendataan_screen.dart';
import 'janji_temu/janji_temu_screen.dart';
import 'mobil_jenazah/mobil_jenazah_screen.dart';
import 'pengaturan_screen.dart';

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
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            // First Page
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: const Color(0xFF242F9B),
                        padding: const EdgeInsets.only(top: 90.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // Align to the left
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 5.0, left: 22.0),
                              child: Image.asset(
                                'asset/logo.png',
                                fit: BoxFit.contain,
                                height: 65,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 33.0, top: 44.0, left: 34.0),
                              child: Image.asset(
                                'asset/selamat.png',
                                fit: BoxFit.contain,
                                height: 45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Tombol Ditekan');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF242F9B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: const Size(120, 35),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    child: const Text(
                      'Berita',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _getBodyWidget(0),
                ),
                // Tombol Layanan
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Tombol Layanan Ditekan');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFF242F9B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: const Size(80, 30),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Layanan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildInkWellWithSquareBorder(
                      Icons.assignment,
                      40,
                      const Color(0xFF242F9B),
                      const Color(0xFF242F9B),
                      'Pendataan',
                      const PendataanScreen(),
                    ),
                    _buildInkWellWithSquareBorder(
                      Icons.schedule,
                      40,
                      const Color(0xFF242F9B),
                      const Color(0xFF242F9B),
                      'Janji Temu',
                      const JanjiTemuScreen(),
                    ),
                    _buildInkWellWithSquareBorder(
                        Icons.food_bank,
                        40,
                        const Color(0xFF242F9B),
                        const Color(0xFF242F9B),
                        'Jajanan',
                        const JajananScreen()),
                    _buildInkWellWithSquareBorder(
                        Icons.car_rental,
                        40,
                        const Color(0xFF242F9B),
                        const Color(0xFF242F9B),
                        'Mobil Jenazah',
                        const MobilJenazahScreen()),
                  ],
                ),
              ],
            ),

            // Second Page
            _getBodyWidget(1),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF242F9B),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (int index) {
            print('Tab $index terpilih');
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBodyWidget(int index) {
    if (index == 1) {
      return const HomeProfileScreen();
    } else {
      List<Widget> items = List.generate(
        4,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: SizedBox(
            width: 200,
            height: 150,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BeritaScreen()),
                );
                print('Kartu diklik');
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                margin: const EdgeInsets.all(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'asset/kemerdekaan.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Teks yang tetap ditampilkan di setiap kartu
                    const Text(
                      'Selamat HUT RI ke 78',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      List<Widget> itemsWithLabels = [];

      for (int i = 0; i < items.length; i++) {
        itemsWithLabels.add(items[i]);
      }

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: itemsWithLabels,
        ),
      );
    }
  }

  Widget _buildInkWellWithSquareBorder(
      IconData icon,
      double size,
      Color borderColor,
      Color iconColor,
      String label,
      Widget destinationPage) {
    return InkWell(
      onTap: () {
        print('Ikon Ditekan: $label');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                size: size,
                color: iconColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class HomeProfileScreen extends StatefulWidget {
  const HomeProfileScreen({Key? key}) : super(key: key);

  @override
  _HomeProfileScreenState createState() => _HomeProfileScreenState();
}

class _HomeProfileScreenState extends State<HomeProfileScreen> {
  final TextEditingController _nikController =
      TextEditingController(text: "3313091704330002");
  final TextEditingController _teleponController =
      TextEditingController(text: "0813-6543-1269");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Profil',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
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
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(45),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 110,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(
                                          0xFF242F9B), // Set the border color
                                      width: 2.0, // Set the border width
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'asset/fotoprofildummy.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 28),
                            const Text(
                              'Muhammad Surya Wicaksana',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFF242F9B),
                              ),
                            ),
                            const SizedBox(height: 55),
                            TextFormField(
                              controller: _nikController,
                              maxLines: 1,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: "NIK",
                                prefixIcon: const Icon(
                                  Icons.credit_card,
                                ),
                                labelStyle:
                                    const TextStyle(color: Color(0xFF242F9B)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF242F9B)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF242F9B)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _teleponController,
                              maxLines: 1,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: "Nomor Telepon",
                                prefixIcon: const Icon(
                                  Icons.phone,
                                ),
                                labelStyle:
                                    const TextStyle(color: Color(0xFF242F9B)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF242F9B)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF242F9B)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 55),
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: ElevatedButton(
                                  onPressed: () => (
                                    Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const PengaturanScreen()),
                                                ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      const Color(0xFF242F9B),
                                    ),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                      const Size(200, 50),
                                    ),
                                  ),
                                  child: const Text(
                                    "PENGATURAN",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 250, 250, 250),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("Keluar Akun"),
                                          content: const Text(
                                              "Anda yakin ingin keluar?"),
                                          actions: [
                                            TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(const Color(
                                                            0xFF242F9B)),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'TIDAK',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 250, 250, 250),
                                                  fontFamily: 'Inter',
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.red),
                                              ),
                                              child: const Text(
                                                'YA',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 250, 250, 250),
                                                  fontFamily: 'Inter',
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LoginPage()),
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFFE71717)),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            const Size(200, 50)),
                                  ),
                                  child: const Text(
                                    "KELUAR",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 250, 250, 250),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
