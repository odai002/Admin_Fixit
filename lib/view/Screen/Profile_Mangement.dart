import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileManagementPage extends StatelessWidget {
  const UserProfileManagementPage({Key? key}) : super(key: key);

  // Example variables
  final String userName = "John Doe";
  final String userEmail = "john.doe@example.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile Management"),
        backgroundColor: const Color(0xff6A3BA8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // User Information
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/U.png'), // Placeholder image
            ),
            const SizedBox(height: 16),
            Text(
              userName,
              style: GoogleFonts.getFont(
                'Libre Caslon Text',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              userEmail,
              style: GoogleFonts.getFont(
                'Libre Caslon Text',
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 24),
            // Placeholder for profile management features
            ElevatedButton(
              onPressed: () {
                // Handle profile update
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff6A3BA8),
              ),
              child: const Text(
                "Edit Profile",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
