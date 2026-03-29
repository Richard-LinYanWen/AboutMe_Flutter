import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: AboutPage()));

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        // Requirement: SingleChildScrollView for vertical scrolling
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderSection(),
              const Divider(height: 40, thickness: 1),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "About Me",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Full-stack developer focused on building scalable Web applications. I specialize in bridging the gap between robust Backend logic, efficient Database management, and writing high-quality, Clean code.",
                      style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5), // Added height for better readability
                    ),
                    const SizedBox(height: 30),
                    
                    // Requirement: Row & Wrap for flexible layouts
                    const Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        InfoCard(icon: Icons.language, label: "Web Dev"),    // Globe icon for Web
                        InfoCard(icon: Icons.dns, label: "Backend"),        // Server/DNS icon for Backend
                        InfoCard(icon: Icons.storage, label: "Database"),   // Stacked discs for Database
                        InfoCard(icon: Icons.auto_awesome, label: "Clean"), // Sparkles/Magic icon for Clean code
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Requirement: Separate Stateless Widget Category 1 (Header with Stack)
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        // Background Banner
        Container(
          height: 180,
          color: Colors.indigoAccent,
          width: double.infinity,
        ),
        // Requirement: Positioned & CircleAvatar
        Positioned(
          top: 110,
          child: CircleAvatar(
            radius: 65,
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                'assets/profile.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Requirement: Transform for a bit of flair
        Positioned(
          right: 20,
          top: 20,
          child: Transform.rotate(
            angle: 0.2,
            child: const Icon(Icons.auto_awesome, color: Colors.white, size: 40),
          ),
        ),
      ],
    );
  }
}

// Requirement: Separate Stateless Widget Category 2 (Reusable Card)
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const InfoCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Colors.indigo),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}