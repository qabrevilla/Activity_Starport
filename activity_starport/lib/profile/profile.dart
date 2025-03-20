import 'package:flutter/material.dart';
import '/starting_screen/splash_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
            const SizedBox(height: 20),
            _buildProfileInfo("Name", "Aldwin Joseph B. Revilla"),
            _buildProfileInfo("Birthday", "May 13, 2002"),
            _buildProfileInfo("Contact Number", "+639452850438"),
            _buildProfileInfo("Email", "qabrevilla@tip.edu.ph"),
            const SizedBox(height: 20),
            _buildSettingsButton(Icons.edit, "Edit Profile", () {}),
            _buildSettingsButton(Icons.lock, "Privacy Settings", () {}),
            _buildSettingsButton(Icons.notifications, "Notifications", () {}),
            _buildSettingsButton(Icons.logout, "Logout", () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SplashScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        Text(value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Divider(),
      ],
    );
  }

  Widget _buildSettingsButton(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[900]),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
