// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'helper_auth.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool showBiometric = false;
  bool isAuthenticated = false;
  @override
  void initState() {
    isBiometricsAvailable();
    super.initState();
  }

  isBiometricsAvailable() async {
    showBiometric = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showBiometric)
              ElevatedButton(
                child: const Text(
                  'Biometric Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () async {
                  isAuthenticated = await BiometricHelper().authenticate();
                  setState(() {});
                  if (isAuthenticated) {
               Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const Text("data");
                    }));
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
