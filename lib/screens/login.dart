import 'package:flutter/material.dart';
import 'package:loudoun_volunteer/db/database.dart';
import 'package:loudoun_volunteer/utils/skillargument.dart';


class LogIn extends StatefulWidget {
  const LogIn({super.key});


  @override
  State<LogIn> createState() => _LogInState();
}


class _LogInState extends State<LogIn> {
  final userController = TextEditingController();


  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('An account with that username doesn\'t exist.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'), // Added title for the AppBar
        backgroundColor: Colors.amber.shade700, // Updated color for AppBar to match the theme
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: userController,
                decoration: const InputDecoration(
                  hintText: 'Enter your username',
                  hintStyle: TextStyle(color: Colors.black54), // Subtle hint color
                  suffixIcon: Icon(Icons.search, color: Colors.black54), // Updated icon color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade700, // Updated button color to match the theme
                  foregroundColor: Colors.white, // Text color for button
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  try {
                    var laccount = await DatabaseHelper.instance.getAccount(userController.text);
                    var account = laccount[0];
                    Navigator.pushNamed(
                      context,
                      '/password',
                      arguments: AccountArguments(account: account),
                    );
                  } catch (e) {
                    _showErrorDialog(context);
                  }
                },
                child: const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


