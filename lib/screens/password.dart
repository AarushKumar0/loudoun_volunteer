import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.deepPurple.shade900.withOpacity(0.95),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Error",
                style: TextStyle(
                  color: Colors.amber.shade400,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Incorrect Password",
                style: TextStyle(
                  color: Colors.amber.shade100,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade400,
                  foregroundColor: Colors.deepPurple.shade900,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 10,
                  shadowColor: Colors.amber.shade400.withOpacity(0.7),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.1),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.amber.shade400, Colors.deepOrange.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            "Enter Password",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 26,
              letterSpacing: 1.3,
              color: Colors.white,
              shadows: [Shadow(color: Colors.black54, blurRadius: 3, offset: Offset(1, 1))],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<Account>(
            future: getAccount(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: CircularProgressIndicator(color: Colors.amber),
                );
              } else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.redAccent, fontSize: 18),
                  ),
                );
              } else if (!snapshot.hasData) {
                return const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Text(
                    'No account found',
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                );
              }

              var account = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: passController,
                      style: TextStyle(color: Colors.amber.shade100, fontWeight: FontWeight.w600),
                      cursorColor: Colors.amber.shade300,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.deepPurple.shade700.withOpacity(0.6),
                        hintText: "Enter the password",
                        hintStyle: TextStyle(color: Colors.amber.shade200.withOpacity(0.7)),
                        suffixIcon: Icon(Icons.lock, color: Colors.amber.shade300),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.amber.shade400, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade400,
                        foregroundColor: Colors.deepPurple.shade900,
                        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        elevation: 12,
                        shadowColor: Colors.amber.shade400.withOpacity(0.8),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1.2,
                        ),
                      ),
                      onPressed: () {
                        if (account.password == passController.text) {
                          Navigator.pushNamed(
                            context,
                            '/display',
                            arguments: AccountArguments(account: account),
                          );
                        } else {
                          _showErrorDialog();
                        }
                      },
                      child: const Text("Continue"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
