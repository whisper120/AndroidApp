import 'package:flutter/material.dart';
import 'signup_screen.dart';  // Import the SignUpPage
import 'login_screen.dart';   // Import the LoginPage

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top welcome text
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Please login or sign up',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Center image from assets
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/homepage.jpg',
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Bottom vertical buttons (squared and larger)
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                children: [
                  // Login button
                  Container(
                    width: 200,  // Make the button width larger
                    height: 60,  // Set a fixed height for a square shape
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.zero,  // Remove internal padding
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),  // Slightly rounded corners
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,  // Make text larger
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),  // Add space between the buttons

                  // Sign up button
                  Container(
                    width: 200,  // Same width as the login button
                    height: 60,  // Same height for square shape
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.zero,  // Remove internal padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),  // Slightly rounded corners
                        ),
                      ),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,  // Make text larger
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
