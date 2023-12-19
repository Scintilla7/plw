// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

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
        body: PengaturanScreen(),
      ),
    );
  }
}

class PengaturanScreen extends StatefulWidget {
  const PengaturanScreen({Key? key}) : super(key: key);

  @override
  State<PengaturanScreen> createState() => _PengaturanScreenState();
}

class _PengaturanScreenState extends State<PengaturanScreen> {
  final TextEditingController _emailController =
      TextEditingController(text: "suryaganteng@gmail.com");
  final TextEditingController _katasandiController =
      TextEditingController(text: "msurya77");

  bool _isObscured = true;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          'Pengaturan',
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
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
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _emailController,
                          maxLines: 1,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: const Icon(
                              Icons.mail,
                            ),
                            labelStyle:
                                const TextStyle(color: Color(0xFF242F9B)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  const BorderSide(color: Color(0xFF242F9B)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  const BorderSide(color: Color(0xFF242F9B)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _katasandiController,
                          maxLines: 1,
                          readOnly: true,
                          obscureText:
                              _isObscured, // Use the _isObscured variable
                          decoration: InputDecoration(
                            labelText: "Kata Sandi",
                            prefixIcon: const Icon(
                              Icons.lock,
                            ),
                            labelStyle:
                                const TextStyle(color: Color(0xFF242F9B)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                color: Color(0xFF242F9B),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                color: Color(0xFF242F9B),
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                // Toggle the visibility of the password
                                setState(() {
                                  _isObscured = !_isObscured;
                                });
                              },
                              icon: Icon(_isObscured
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                        ),
                        const SizedBox(height: 55),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                // Show a dialog or navigate to another screen to get user input
                                // For simplicity, let's assume you have a newEmail value
                                String? newEmail = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    TextEditingController newEmailController =
                                        TextEditingController();
                                    return AlertDialog(
                                      title: const Text("Enter New Email"),
                                      content: TextFormField(
                                        controller: newEmailController,
                                        decoration: const InputDecoration(
                                            labelText: "New Email"),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, null);
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context,
                                                newEmailController.text);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );

                                if (newEmail != null && newEmail.isNotEmpty) {
                                  setState(() {
                                    _emailController.text = newEmail;
                                  });
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFF242F9B),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(200, 50),
                                ),
                              ),
                              child: const Text(
                                "GANTI EMAIL",
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
                              onPressed: () async {
                                // Show a dialog or navigate to another screen to get user input
                                // For simplicity, let's assume you have a newPassword value
                                String? newPassword = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    TextEditingController
                                        newPasswordController =
                                        TextEditingController();
                                    return AlertDialog(
                                      title: const Text("Enter New Password"),
                                      content: StatefulBuilder(
                                        builder: (BuildContext context,
                                            StateSetter setState) {
                                          return TextFormField(
                                            controller: newPasswordController,
                                            obscureText:
                                                !_isPasswordVisible, // Use the !_isPasswordVisible variable
                                            decoration: InputDecoration(
                                              labelText: "New Password",
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  // Toggle the visibility of the password
                                                  setState(() {
                                                    _isPasswordVisible =
                                                        !_isPasswordVisible;
                                                  });
                                                },
                                                icon: Icon(
                                                  _isPasswordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(
                                                context, null); // Cancel
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context,
                                                newPasswordController.text);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );

                                // Update the password only if the user provided a new password
                                if (newPassword != null &&
                                    newPassword.isNotEmpty) {
                                  setState(() {
                                    _katasandiController.text = newPassword;
                                  });
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFF242F9B),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(200, 50),
                                ),
                              ),
                              child: const Text(
                                "GANTI KATA SANDI",
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
          );
        },
      ),
    );
  }
}
