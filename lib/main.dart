import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mindlink_assignment/views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDMcVYeL1ZnGYibUUPVU8Hun_RC1mbrMP8',
        appId: '1:395881504713:web:e025d4e2b9715c11859218',
        messagingSenderId: '395881504713',
        projectId: 'mindlink-assignment-cf40b',
        authDomain: 'mindlink-assignment-cf40b.firebaseapp.com',
        storageBucket: 'mindlink-assignment-cf40b.appspot.com',
        measurementId: 'G-0NSTQ5NRGD',
      ),
    );
  } else {
    
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
