import 'package:flutter/material.dart';
import 'package:loudoun_volunteer/screens/createAccount.dart';
import 'package:loudoun_volunteer/screens/display.dart';
import 'package:loudoun_volunteer/screens/login.dart';
import 'package:loudoun_volunteer/screens/password.dart';
import 'package:loudoun_volunteer/screens/skills.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loudoun Volunteering',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber.shade600,
          primary: Colors.amber.shade700,
          secondary: Colors.deepOrange.shade400,
          background: Colors.deepPurple.shade50,
          onPrimary: Colors.white,
          onBackground: Colors.deepPurple.shade900,
        ),
        scaffoldBackgroundColor: Colors.deepPurple.shade50,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.deepPurple,
            height: 1.4,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.amber.shade700,
          centerTitle: true,
          elevation: 4,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
            letterSpacing: 1.1,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber.shade700,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 8,
            shadowColor: Colors.amber.shade400.withOpacity(0.7),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
        ),
        useMaterial3: true,
      ),
      routes: {
        '/create': (context) => const Createaccount(),
        '/skills': (context) => const Skills(),
        '/display': (context) => const Display(),
        '/password': (context) => const Password(),
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loudoun Volunteering"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.person_add_alt_1_outlined, size: 22),
                label: const Text("Create New Account"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Createaccount()),
                  );
                },
              ),
              const SizedBox(height: 36),
              ElevatedButton.icon(
                icon: const Icon(Icons.login_outlined, size: 22),
                label: const Text("Log In"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade600,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LogIn()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
