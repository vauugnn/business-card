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
          seedColor: Colors.teal,
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
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 8,
            child: Container(
              width: screenWidth > 600 ? 600 : screenWidth * 0.9,
              padding: EdgeInsets.all(screenWidth > 600 ? 24 : 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: screenWidth > 600 ? 150 : 120,
                    height: screenWidth > 600 ? 150 : 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.teal,
                      image: const DecorationImage(
                        image: NetworkImage('YOUR_IMAGE_URL_HERE'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Juan dela Cruz',
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 28 : 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 20 : 16,
                      color: Colors.teal,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const Divider(height: 32, thickness: 1),
                  const ListTile(
                    leading: Icon(Icons.email, color: Colors.teal),
                    title: Text('juan@example.com'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.phone, color: Colors.teal),
                    title: Text('+63 917 123 4567'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_on, color: Colors.teal),
                    title: Text('Manila, Philippines'),
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