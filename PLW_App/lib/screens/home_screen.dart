import 'package:flutter/material.dart';

import 'berita/berita_screen.dart';
import 'administrasi/pendataan_screen.dart';
import 'janji_temu/janji_temu_screen.dart';
import 'mobil_jenazah/mobil_jenazah_screen.dart';

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
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF242F9B),
          toolbarHeight: 259.0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Image.asset(
                  'asset/logo.png',
                  fit: BoxFit.contain,
                  height: 65,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: Image.asset(
                  'asset/selamat.png',
                  fit: BoxFit.contain,
                  height: 45,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  40, // Ukuran ikon disesuaikan di sini
                  const Color(0xFF242F9B),
                  const Color(0xFF242F9B),
                  'Pendataan',
                  const PendataanScreen(),
                ),
                _buildInkWellWithSquareBorder(
                  Icons.schedule,
                  40, // Ukuran ikon disesuaikan di sini
                  const Color(0xFF242F9B),
                  const Color(0xFF242F9B),
                  'Janji Temu',
                  const JanjiTemuScreen(),
                ),
                // _buildInkWellWithSquareBorder(
                //     Icons.food_bank,
                //     40, // Ukuran ikon disesuaikan di sini
                //     const Color(0xFF242F9B),
                //     const Color(0xFF242F9B),
                //     'Jajanan',
                //     ),
                _buildInkWellWithSquareBorder(
                    Icons.car_rental,
                    40, // Ukuran ikon disesuaikan di sini
                    const Color(0xFF242F9B),
                    const Color(0xFF242F9B),
                    'Mobil Jenazah',
                    const MobilJenazahScreen()),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF242F9B),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: 0,
          onTap: (int index) {
            print('Tab $index terpilih');
          },
          items: const [
            BottomNavigationBarItem(
              icon:
                  Icon(Icons.home, size: 30), // Ukuran ikon disesuaikan di sini
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  size: 30), // Ukuran ikon disesuaikan di sini
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBodyWidget(int index) {
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
