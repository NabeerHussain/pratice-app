import 'package:flutter/material.dart';
class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Portfolio')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile.jpg'), // Add your image
            ),
            const SizedBox(height: 10),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Skills'),
            _buildSkillChips(['Flutter', 'Dart', 'Firebase', 'REST API', 'UI/UX']),
            const SizedBox(height: 20),
            _buildSectionTitle('Projects'),
            _buildProjectCard('Portfolio App', 'A beautiful portfolio app built with Flutter.'),
            _buildProjectCard('E-Commerce App', 'An online shopping app with Flutter and Firebase.'),
            _buildProjectCard('Weather App', 'A weather forecasting app using OpenWeather API.'),
            const SizedBox(height: 20),
            _buildSectionTitle('Contact'),
            _buildSocialLinks(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSkillChips(List<String> skills) {
    return Wrap(
      spacing: 8.0,
      children: skills
          .map((skill) => Chip(
                label: Text(skill),
                backgroundColor: Colors.blueAccent.withOpacity(0.7),
              ))
          .toList(),
    );
  }

  Widget _buildProjectCard(String title, String description) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        leading: const Icon(Icons.folder, color: Colors.blueAccent),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // children: [
      //   IconButton(icon: const Icon(FontAwesomeIcons.linkedin, color: Colors.blue), onPressed: () {}),
      //   IconButton(icon: Icon(FontAwesomeIcons.github, color: Colors.white), onPressed: () {}),
      //   IconButton(icon: const Icon(FontAwesomeIcons.twitter, color: Colors.lightBlue), onPressed: () {}),
      // ],
    );
  }
}
