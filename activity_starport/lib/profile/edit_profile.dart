import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: "Aldwin Joseph B. Revilla");
  final TextEditingController _accountIdController =
      TextEditingController(text: "05132002");
  final TextEditingController _contactController =
      TextEditingController(text: "+639452850438");
  final TextEditingController _emailController =
      TextEditingController(text: "qabrevilla@tip.edu.ph");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField("Name", _nameController),
            _buildTextField("Account ID", _accountIdController, enabled: false),
            _buildTextField("Contact Number", _contactController),
            _buildTextField("Email", _emailController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle save functionality
                Navigator.pop(context);
              },
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
