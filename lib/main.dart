import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,  // Changed color scheme
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const BusinessCard(),
    );
  }
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(  // Added to prevent overflow on small screens
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 8,
            child: Container(
              // Responsive width
              width: screenWidth > 600 ? 600 : screenWidth * 0.9,
              // Responsive padding
              padding: EdgeInsets.all(screenWidth > 600 ? 24 : 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    // Responsive avatar size
                    radius: screenWidth > 600 ? 60 : 50,
                    backgroundColor: Colors.teal,
                    child: Icon(
                      Icons.person,
                      // Responsive icon size
                      size: screenWidth > 600 ? 60 : 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Your Name',
                    style: TextStyle(
                      // Responsive font size
                      fontSize: screenWidth > 600 ? 28 : 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                      // Responsive font size
                      fontSize: screenWidth > 600 ? 20 : 16,
                      color: Colors.teal,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const Divider(
                    height: 32,
                    thickness: 1,
                  ),
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.teal),
                    title: const Text('email@example.com'),
                    onTap: () {
                      // Add email functionality later
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone, color: Colors.teal),
                    title: const Text('+1 234 567 890'),
                    onTap: () {
                      // Add phone functionality later
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.teal),
                    title: const Text('Manila, Philippines'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}