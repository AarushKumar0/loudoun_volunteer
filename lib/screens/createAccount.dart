import 'package:flutter/material.dart';
import 'package:loudoun_volunteer/db/database.dart';
import 'package:loudoun_volunteer/models/account.dart';
import 'package:loudoun_volunteer/utils/skillargument.dart';


class Createaccount extends StatefulWidget {
  const Createaccount({super.key});


  @override
  State<Createaccount> createState() => _CreateaccountState();
}


class _CreateaccountState extends State<Createaccount> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  final firstController = TextEditingController();
  final lastController = TextEditingController();


  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Error',
          style: TextStyle(color: Colors.black),
        ),
        content: const Text(
          'An account with that username already exists.',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        backgroundColor: Colors.amber.shade50,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  hintText: 'Enter a username',
                  hintStyle: const TextStyle(color: Colors.black54),
                  suffixIcon: const Icon(Icons.search, color: Colors.black),
                  filled: true,
                  fillColor: Colors.amber.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: passController,
                decoration: InputDecoration(
                  hintText: 'Enter a password',
                  hintStyle: const TextStyle(color: Colors.black54),
                  suffixIcon: const Icon(Icons.search, color: Colors.black),
                  filled: true,
                  fillColor: Colors.amber.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: firstController,
                decoration: InputDecoration(
                  hintText: 'Enter your first name',
                  hintStyle: const TextStyle(color: Colors.black54),
                  suffixIcon: const Icon(Icons.search, color: Colors.black),
                  filled: true,
                  fillColor: Colors.amber.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: lastController,
                decoration: InputDecoration(
                  hintText: 'Enter your last name',
                  hintStyle: const TextStyle(color: Colors.black54),
                  suffixIcon: const Icon(Icons.search, color: Colors.black),
                  filled: true,
                  fillColor: Colors.amber.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade200,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  try {
                    Account account = Account(
                      username: userController.text,
                      password: passController.text,
                      first_name: firstController.text,
                      last_name: lastController.text,
                    );
                    int savedInt = await DatabaseHelper.instance.insert(account);
                    Navigator.pushNamed(
                      context,
                      '/skills',
                      arguments: AccountArguments(account: account),
                    );
                  } catch (e) {
                    _showErrorDialog(context);
                  }
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
