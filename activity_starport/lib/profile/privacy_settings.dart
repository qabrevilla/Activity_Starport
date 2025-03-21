import 'package:flutter/material.dart';

class PrivacySettingsScreen extends StatelessWidget {
  const PrivacySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Settings")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSwitchTile("Enable Two-Factor Authentication", true),
          _buildSwitchTile("Make Profile Private", false),
          _buildSwitchTile("Allow Data Sharing", false),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool initialValue) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool switchValue = initialValue;
        return SwitchListTile(
          title: Text(title),
          value: switchValue,
          onChanged: (bool value) {
            setState(() {
              switchValue = value;
            });
          },
        );
      },
    );
  }
}
