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
          seedColor: Colors.blue,
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
      path: 'vaughnrochederoda@gmail.com',
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  void _launchGithub() async {
    final Uri githubLaunchUri = Uri(
      scheme: 'https',
      host: 'github.com',
      pathSegments: ['vauugnn'],
    );
    if (await canLaunchUrl(githubLaunchUri)) {
      await launchUrl(githubLaunchUri);
    }
  }
  
  void _launchLinkedIn() async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'linkedin.com',
      pathSegments: ['in', 'vaughn-roche-de-roda-92a4752ab'],
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
  
  void _launchFacebook() async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'facebook.com',
      path: 'profile.php',
      queryParameters: {
        'id': '61566488972988'
      },
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
  
  void _launchInstagram() async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'instagram.com',
      pathSegments: ['vaugn.py'],
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
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
                  Container(
                    width: screenWidth > 600 ? 150 : 120,
                    height: screenWidth > 600 ? 150 : 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      image: const DecorationImage(
                        image: NetworkImage('https://i.imgur.com/5nUVHT7.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Vaughn Roche de Roda',
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 28 : 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    'Software Developer | Tech Volunteer | Community Builder',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 20 : 16,
                      color: Colors.blue,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const Divider(height: 32, thickness: 1),
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.blue),
                    title: const Text('vaughnrochederoda@gmail.com'),
                    onTap: _launchEmail,
                    hoverColor: Colors.blue.withOpacity(0.1),
                  ),
                  ListTile(
                    leading: const Icon(Icons.code, color: Colors.blue),
                    title: const Text('Github'),
                    onTap: _launchGithub,
                    hoverColor: Colors.blue.withOpacity(0.1),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.blue),  // Better LinkedIn icon
                    title: const Text('LinkedIn'),
                    onTap: _launchLinkedIn,
                    hoverColor: Colors.blue.withOpacity(0.1),
                  ),
                  ListTile(
                    leading: const Icon(Icons.facebook, color: Colors.blue),
                    title: const Text('Facebook'),
                    onTap: _launchFacebook,
                    hoverColor: Colors.blue.withOpacity(0.1),
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt, color: Colors.blue),  // Better Instagram icon
                    title: const Text('Instagram'),
                    onTap: _launchInstagram,
                    hoverColor: Colors.blue.withOpacity(0.1),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_on, color: Colors.blue),
                    title: Text('Davao City, Philippines'),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [ 
                      const Text(
                        'This website was made with Flutter and PWA!',
                        style: TextStyle(
                          fontSize: 14, 
                          color: Colors.blue
                        ),
                      ),
                    ],
                  ),
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
}