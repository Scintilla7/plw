import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: AppBar(
          // automaticallyImplyLeading: false,
          title: const Text(''),
          backgroundColor: const Color(0xFF242F9B),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(),
          ),
        ),
      ),
      body: _getBodyWidget(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF242F9B),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white, size: 36.0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white, size: 36.0),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _getBodyWidget(int index) {
    switch (index) {
      case 0:
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              4,
              (index) => SizedBox(
                width: 322.4,
                height: 203.68,
                child: InkWell(
                  onTap: () {
                    // Navigasi ke halaman lain saat kartu diklik
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 322.4,
                            height: 150,
                            child: Image.asset(
                              'asset/kemerdekaan.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, top: 5),
                                  child: Text('Selamat HUT RI ke 78'),
                                ),
                              ],
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
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Profile Page',
              style: TextStyle(fontSize: 24),
            ),
            // Move the slider box below the Profile Page
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                  (index) => const SizedBox(
                    width: 322.4,
                    height: 203.68,
                    // ... (rest of the card widget remains unchanged)
                  ),
                ),
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }
}
