import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meme_app/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Card(
                  elevation: 5,
                  child: Image.asset("assets/images/splash_screen.jpg"),
                ),
              ),
              const Text(
                "Meme App",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
