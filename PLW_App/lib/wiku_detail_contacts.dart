import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';


class WikuScreen extends StatelessWidget {
  const WikuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;

    const String whatsappNumber = '6281378792900';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wikussangker WIrabumi',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF3362EE), // Set the app bar color
        iconTheme: const IconThemeData(color: Colors.white), // Set the back button color
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/login_background.png'),
              ),
            ),
          ),
          // Rounded Corner Card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: sizeHeight * 0.68,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(sizeWidth * 0.05),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(sizeWidth * 0.07),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Contact Name and Position
                    Padding(
                      padding: EdgeInsets.only(
                        top: sizeHeight * 0.13,
                      ),
                      child: Text(
                        'Wikussangker Wirabumi',
                        style: TextStyle(
                          fontSize: sizeWidth * 0.06,
                          fontWeight: FontWeight.w800,
                          color: const Color.fromARGB(255, 51, 98, 238),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: sizeHeight * 0.01,
                      ),
                      child: Text(
                        'Sekuriti',
                        style: TextStyle(
                          fontSize: sizeWidth * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // Medium Card
                    Container(
                      width: sizeWidth * 0.9,
                      margin: EdgeInsets.only(
                        top: sizeHeight * 0.03,
                        bottom: sizeHeight * 0.03,
                      ),
                      padding: EdgeInsets.all(sizeWidth * 0.04),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(221, 131, 131, 131),
                          width: 1.15,
                        ),
                        borderRadius: BorderRadius.circular(sizeWidth * 0.04),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 175, 175, 175)
                                .withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'No Telepon / Whatsapp',
                            style: TextStyle(fontSize: sizeWidth * 0.03),
                          ),
                          SizedBox(height: sizeHeight * 0.015),
                          GestureDetector(
                            onTap: () async {
                              const url = 'https://wa.me/$whatsappNumber?text=Saya%20ingin%20membuat%20janji%20temu%20bersama%20bapak/ibu';
                              if (await canLaunchUrl(url as Uri)) {
                                await launchUrl(url as Uri);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Text(
                              '0812-7879-2900',
                              style: TextStyle(
                                fontSize: sizeWidth * 0.04,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: sizeWidth * 0.9,
                      margin: EdgeInsets.only(
                        bottom: sizeHeight * 0.03,
                      ),
                      padding: EdgeInsets.all(sizeWidth * 0.04),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(221, 131, 131, 131),
                          width: 1.15,
                        ),
                        borderRadius: BorderRadius.circular(sizeWidth * 0.04),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 175, 175, 175)
                                .withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alamat Rumah',
                            style: TextStyle(fontSize: sizeWidth * 0.03),
                          ),
                          SizedBox(height: sizeHeight * 0.015),
                          GestureDetector(
                            onTap: () async {
                              const url = 'https://maps.app.goo.gl/8zUUnvMp4QtEJU229';
                              if (await canLaunchUrl(url as Uri)) {
                                await launchUrl(url as Uri);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          child:Text(
                            'Perumahan Bida Ayu Blok R no 12',
                            style: TextStyle(
                              fontSize: sizeWidth * 0.04,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: sizeWidth * 0.9,
                      margin: EdgeInsets.only(
                        bottom: sizeHeight * 0.03,
                      ),
                      padding: EdgeInsets.all(sizeWidth * 0.04),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(221, 131, 131, 131),
                          width: 1.15,
                        ),
                        borderRadius: BorderRadius.circular(sizeWidth * 0.04),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 175, 175, 175)
                                .withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jadwal Aktif di Rumah',
                            style: TextStyle(fontSize: sizeWidth * 0.03),
                          ),
                          SizedBox(height: sizeHeight * 0.015),
                          Text(
                            'Senin - Jumat : 10.00 - 20.00 WIB',
                            style: TextStyle(
                              fontSize: sizeWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Sabtu - Minggu : 10.00 - 20.00 WIB',
                            style: TextStyle(
                              fontSize: sizeWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //sample
                    Container(
                      width: sizeWidth * 0.9,
                      margin: const EdgeInsets.only(),
                      padding: EdgeInsets.all(sizeWidth * 0.04),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(sizeWidth * 0.04),
                        color: Colors.white,
                      ),
                    ),
                    // Add any additional contact details here
                  ],
                ),
              ),
            ),
          ),
          // Contact Photo Overlay
          Positioned(
            top: sizeHeight * 0.16,
            left: sizeWidth / 2 - sizeWidth * 0.25,
            child: Container(
              width: sizeWidth * 0.5,
              height: sizeWidth * 0.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: sizeWidth * 0.015,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  'images/wiku.png',
                  width: sizeWidth * 0.4,
                  height: sizeWidth * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
