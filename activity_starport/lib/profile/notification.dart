import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSwitchTile("Push Notifications", true),
          _buildSwitchTile("Email Notifications", true),
          _buildSwitchTile("SMS Alerts", false),
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
