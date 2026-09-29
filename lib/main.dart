import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF6B001A),
        appBar: AppBar(
          backgroundColor: Color(0xFF6B001A),
          title: Text('IZIHIRWE COMPANY LTD', style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_laundry_service, size: 80, color: Color(0xFFD4AF37)),
              SizedBox(height: 20),
              Text('IZIHIRWE COMPANY LTD', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('United in Work • Growing Together', style: TextStyle(color: Color(0xFFD4AF37), fontSize: 14)),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(12),
                color: Colors.red,
                child: Text('⚠️ GAMBURU! Imyenda <5h!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 30),
              Text('APK YAKOZE! 🎉', style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
