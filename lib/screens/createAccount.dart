import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loudoun_volunteer/db/database.dart';
import 'package:loudoun_volunteer/models/account.dart';
import 'package:loudoun_volunteer/utils/skillargument.dart';
import 'dart:math';


class Createaccount extends StatefulWidget {
  const Createaccount({super.key});

  @override
  State<Createaccount> createState() => _CreateaccountState();
}

class _CreateaccountState extends State<Createaccount> with SingleTickerProviderStateMixin {
  final userController = TextEditingController();
  final passController = TextEditingController();
  final firstController = TextEditingController();
  final lastController = TextEditingController();

  final FocusNode _userFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();
  final FocusNode _firstFocus = FocusNode();
  final FocusNode _lastFocus = FocusNode();

  late AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    firstController.dispose();
    lastController.dispose();
    _userFocus.dispose();
    _passFocus.dispose();
    _firstFocus.dispose();
    _lastFocus.dispose();
    _iconAnimationController.dispose();
    super.dispose();
  }

  void _showErrorDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Error",
      barrierDismissible: true,
      barrierColor: Colors.black54.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (_, __, ___) => Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.redAccent.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5)),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, color: Colors.redAccent, size: 50),
                  const SizedBox(height: 12),
                  Text(
                    'Error',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent.shade700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'An account with that username already exists.',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.redAccent.shade100,
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.redAccent.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      transitionBuilder: (_, anim, __, child) {
        return ScaleTransition(scale: CurvedAnimation(parent: anim, curve: Curves.easeOutBack), child: child);
      },
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon, bool focused) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: focused ? Colors.amber.shade400 : Colors.black38,
        fontWeight: FontWeight.w600,
        fontSize: focused ? 18 : 16,
      ),
      prefixIcon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
        child: Icon(icon, key: ValueKey(focused), color: focused ? Colors.amber.shade400 : Colors.deepPurple.shade400),
      ),
      filled: true,
      fillColor: Colors.deepPurple.shade50.withOpacity(0.7),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.amber.shade400, width: 3),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 22, horizontal: 25),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required IconData icon,
    bool obscure = false,
  }) {
    return AnimatedBuilder(
      animation: focusNode,
      builder: (context, _) {
        bool focused = focusNode.hasFocus;
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              if (focused)
                BoxShadow(
                  color: Colors.amber.shade300.withOpacity(0.6),
                  blurRadius: 20,
                  offset: const Offset(0, 5),
                )
              else
                BoxShadow(
                  color: Colors.transparent,
                )
            ],
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            obscureText: obscure,
            cursorColor: Colors.amber.shade400,
            style: const TextStyle(color: Colors.deepPurple),
            decoration: _inputDecoration(label, icon, focused),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.deepPurple.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Create Account',
          style: TextStyle(
            color: Colors.amber.shade400,
            fontWeight: FontWeight.w900,
            fontSize: 28,
            shadows: [
              Shadow(
                blurRadius: 12,
                color: Colors.amber.shade300.withOpacity(0.6),
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Gradient & subtle particle-like effect
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple.shade900, Colors.deepPurple.shade700],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: CustomPaint(
                painter: _ParticlePainter(),
              ),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.amber.shade400.withOpacity(0.3), width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber.shade400.withOpacity(0.2),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    constraints: BoxConstraints(maxWidth: screenW > 600 ? 450 : double.infinity),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildTextField(
                            controller: userController,
                            focusNode: _userFocus,
                            label: "Username",
                            icon: Icons.person_outline),
                        const SizedBox(height: 25),
                        _buildTextField(
                          controller: passController,
                          focusNode: _passFocus,
                          label: "Password",
                          icon: Icons.lock_outline,
                          obscure: true,
                        ),
                        const SizedBox(height: 25),
                        _buildTextField(
                          controller: firstController,
                          focusNode: _firstFocus,
                          label: "First Name",
                          icon: Icons.account_circle_outlined,
                        ),
                        const SizedBox(height: 25),
                        _buildTextField(
                          controller: lastController,
                          focusNode: _lastFocus,
                          label: "Last Name",
                          icon: Icons.account_circle_outlined,
                        ),
                        const SizedBox(height: 40),

                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.amber.shade400, Colors.amber.shade600],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.amber.shade400.withOpacity(0.7),
                                blurRadius: 20,
                                spreadRadius: 1,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 70),
                              elevation: 0,
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
                            child: Text(
                              "Next",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple.shade900,
                                shadows: [
                                  Shadow(
                                    color: Colors.amber.shade700.withOpacity(0.5),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for subtle floating particle effect in background
class _ParticlePainter extends CustomPainter {
  final int particleCount = 25;
  final List<Offset> positions = [];
  final List<double> sizes = [];

  _ParticlePainter() {
    // random fixed positions & sizes (for demo)
    final rand = Random(42);
    for (int i = 0; i < particleCount; i++) {
      positions.add(Offset(rand.nextDouble() * 400, rand.nextDouble() * 800));
      sizes.add(8 + rand.nextDouble() * 12);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.amber.withOpacity(0.15);
    for (int i = 0; i < particleCount; i++) {
      canvas.drawCircle(positions[i], sizes[i], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
