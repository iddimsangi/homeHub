import 'package:flutter/material.dart';
import 'package:panga/services/api_service.dart'; // Import the API service

class ConfirmEmailScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ConfirmEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Confirm your email',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Enter your account's email, and we'll send a password reset code.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  // Handle sending the OTP
                  String email = emailController.text;
                  if (isValidEmail(email)) {
                    final result = await ApiService().sendOTP(email);
                    if (result['success'] == true) {
                      // Navigate to OTP verification screen
                    } else {
                      // Show error message
                    }
                  } else {
                    // Show error message
                  }
                },
                child: Text('Send Code'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    // Simple email validation logic
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }
}
