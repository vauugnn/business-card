import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'email@example.com',
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  void _launchPhone() async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: '+1234567890',
    );
    if (await canLaunchUrl(phoneLaunchUri)) {
      await launchUrl(phoneLaunchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: MouseRegion(
            child: Card(
              elevation: 8,
              child: Container(
                width: screenWidth > 600 ? 600 : screenWidth * 0.9,
                padding: EdgeInsets.all(screenWidth > 600 ? 24 : 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildHoverAvatar(),
                    const SizedBox(height: 24),
                    _buildAnimatedName(),
                    Text(
                      'Flutter Developer',
                      style: TextStyle(
                        fontSize: screenWidth > 600 ? 20 : 16,
                        color: Colors.teal,
                        letterSpacing: 1.1,
                      ),
                    ),
                    const Divider(height: 32, thickness: 1),
                    _buildContactTile(
                      icon: Icons.email,
                      text: 'email@example.com',
                      onTap: _launchEmail,
                    ),
                    _buildContactTile(
                      icon: Icons.phone,
                      text: '+1 234 567 890',
                      onTap: _launchPhone,
                    ),
                    _buildContactTile(
                      icon: Icons.location_on,
                      text: 'Manila, Philippines',
                      onTap: null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHoverAvatar() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.teal,
          child: const Icon(
            Icons.person,
            size: 60,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedName() {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: const Text(
        'Your Name',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String text,
    required VoidCallback? onTap,
  }) {
    return MouseRegion(
      cursor: onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: ListTile(
          leading: Icon(icon, color: Colors.teal),
          title: Text(text),
          onTap: onTap,
          hoverColor: Colors.teal.withOpacity(0.1),
        ),
      ),
    );
  }
}