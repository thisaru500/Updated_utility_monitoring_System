import 'package:flutter/material.dart';
import 'widgets/tank_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Utility Monitoring System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: TankIcon(size: 28.0),
        ),
        title: const Text('Smart Utility Monitoring'),
      ),
      body: const Center(
        child: Text(
          'Welcome to Smart Utility Monitoring System',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
