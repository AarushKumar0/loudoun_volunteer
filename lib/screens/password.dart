import 'package:flutter/material.dart';
import 'package:loudoun_volunteer/db/database.dart';
import 'package:loudoun_volunteer/models/account.dart';
import 'package:loudoun_volunteer/utils/skillargument.dart';


class Password extends StatefulWidget {
  const Password({super.key});


  @override
  State<Password> createState() => _PasswordState();
}


class _PasswordState extends State<Password> {
  final passController = TextEditingController();


  Future<Account> getAccount() async {
    final args = ModalRoute.of(context)?.settings.arguments as AccountArguments;
    List<Account> laccount = await DatabaseHelper.instance.getAccount(args.account.username);
    return laccount[0];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Password'), // Added title for the AppBar
        backgroundColor: Colors.amber.shade700, // Updated AppBar color to match theme
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<Account>(
            future: getAccount(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                var account = snapshot.data!;
                return buildPassword(account);
              } else {
                return const Text('No account found');
              }
            },
          ),
        ),
      ),
    );
  }


  Widget buildPassword(Account account) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: passController,
            decoration: const InputDecoration(
              hintText: 'Enter the password',
              hintStyle: TextStyle(color: Colors.black54), // Subtle hint color
              suffixIcon: Icon(Icons.lock, color: Colors.black54), // Updated icon color and design
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            obscureText: true, // For hiding password input
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber.shade700, // Button color to match theme
              foregroundColor: Colors.white, // Button text color
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              account.password == passController.text
                  ? Navigator.pushNamed(
                      context,
                      '/display',
                      arguments: AccountArguments(account: account),
                    )
                  : showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Error"),
                        content: const Text("Incorrect Password"),
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
            },
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}
