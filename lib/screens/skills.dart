import 'package:flutter/material.dart';
import 'package:loudoun_volunteer/db/database.dart';
import 'package:loudoun_volunteer/models/account.dart';
import 'package:loudoun_volunteer/utils/skillargument.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> with TickerProviderStateMixin {
  late Future<Account> accountFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as AccountArguments;
    accountFuture = _loadAccount(args.account.username);
  }

  Future<Account> _loadAccount(String username) async {
    final accounts = await DatabaseHelper.instance.getAccount(username);
    return accounts.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: FutureBuilder<Account>(
          future: accountFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.amber),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.redAccent),
                ),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text(
                  'No account found',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            final account = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ScrollConfiguration(
                behavior: ScrollBehavior().copyWith(overscroll: false),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      'Select Your Skills',
                      style: TextStyle(
                        color: Colors.amber.shade400,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        shadows: [
                          Shadow(
                            blurRadius: 8,
                            color: Colors.amber.shade700,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    _buildSkillCard(
                      context,
                      title: "Donation Collection & Organization",
                      description:
                          "Collect, organize, and redistribute donations in thrift stores, shelters, warehouses, trucks, and more.",
                      initialState: account.mobileHope,
                      onToggle: (val) {
                        DatabaseHelper.instance.toggleMobileHope(account.username, account);
                        DatabaseHelper.instance.toggleGoodShepherdThrift(account.username, account);
                        DatabaseHelper.instance.toggleSalvationArmy(account.username, account);
                        DatabaseHelper.instance.toggleLoudounCares(account.username, account);
                        DatabaseHelper.instance.toggleWomenGivingBack(account.username, account);
                      },
                    ),
                    _buildSkillCard(
                      context,
                      title: "Parks & Recreation Services",
                      description:
                          "Help manage, clean, maintain, renovate, and host events in parks, fields, nature reserves, and community centers.",
                      initialState: account.morverPark,
                      onToggle: (val) {
                        DatabaseHelper.instance.toggleMorverPark(account.username, account);
                        DatabaseHelper.instance.toggleIdaLeePark(account.username, account);
                        DatabaseHelper.instance.toggleFranklinPark(account.username, account);
                        DatabaseHelper.instance.toggleBansheeReeks(account.username, account);
                        DatabaseHelper.instance.toggleHeritageMuseum(account.username, account);
                        DatabaseHelper.instance.toggleClaudeMoorePark(account.username, account);
                        DatabaseHelper.instance.toggleMapping(account.username, account);
                      },
                    ),
                    _buildSkillCard(
                      context,
                      title: "Senior Care",
                      description:
                          "Assist the elderly by serving as companions in activities, chores, and errands/meals.",
                      initialState: account.arborAssistingLiving,
                      onToggle: (val) {
                        DatabaseHelper.instance.toggleArborAssistingLiving(account.username, account);
                        DatabaseHelper.instance.toggleAging(account.username, account);
                      },
                    ),
                    _buildSkillCard(
                      context,
                      title: "Animal Care",
                      description:
                          "Clean cages, feed animals, provide medication, and play/walk pets.",
                      initialState: account.animalServices,
                      onToggle: (val) {
                        DatabaseHelper.instance.toggleAnimalServices(account.username, account);
                      },
                    ),
                    _buildSkillCard(
                      context,
                      title: "Transitional Housing & Religious Centers",
                      description:
                          "Manage and maintain shelters and religious centers, assisting and connecting with people.",
                      initialState: account.transitionalHousing,
                      onToggle: (val) {
                        DatabaseHelper.instance.toggleTransitionalHousing(account.username, account);
                        DatabaseHelper.instance.toggleAdamsCenter(account.username, account);
                      },
                    ),
                    _buildSkillCard(
                      context,
                      title: "Food Collections & Preparations",
                      description:
                          "Collect, organize food donations, prepare and distribute food for the homeless.",
                      initialState: account.interfaithRelief,
                      onToggle: (val) {
                        DatabaseHelper.instance.toggleInterFaithRelief(account.username, account);
                        DatabaseHelper.instance.toggleLoudounHungerRelief(account.username, account);
                      },
                    ),

                    const SizedBox(height: 50),
                    Center(
                      child: _NextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/display', arguments: AccountArguments(account: account));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSkillCard(BuildContext context, {
    required String title,
    required String description,
    required bool initialState,
    required ValueChanged<bool> onToggle,
  }) {
    return _SkillTile(
      title: title,
      description: description,
      initialState: initialState,
      onToggle: onToggle,
    );
  }
}

class _SkillTile extends StatefulWidget {
  final String title;
  final String description;
  final bool initialState;
  final ValueChanged<bool> onToggle;

  const _SkillTile({
    required this.title,
    required this.description,
    required this.initialState,
    required this.onToggle,
  });

  @override
  State<_SkillTile> createState() => __SkillTileState();
}

class __SkillTileState extends State<_SkillTile> with SingleTickerProviderStateMixin {
  late bool isToggled;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    isToggled = widget.initialState;

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 350));
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(_fadeAnimation);
    _colorAnimation = ColorTween(begin: Colors.grey.shade900, end: Colors.amber.shade400).animate(_fadeAnimation);

    if (isToggled) {
      _controller.value = 1;
    }
  }

  void _toggle() {
    setState(() {
      isToggled = !isToggled;
      if (isToggled) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    widget.onToggle(isToggled);
  }

  @override
  void didUpdateWidget(covariant _SkillTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialState != oldWidget.initialState) {
      isToggled = widget.initialState;
      if (isToggled) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(24);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return GestureDetector(
            onTap: _toggle,
            child: Container(
              decoration: BoxDecoration(
                color: _colorAnimation.value?.withOpacity(0.1),
                borderRadius: borderRadius,
                boxShadow: isToggled
                    ? [
                        BoxShadow(
                          color: Colors.amber.shade400.withOpacity(0.4),
                          blurRadius: 18,
                          spreadRadius: 2,
                          offset: const Offset(0, 6),
                        )
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ],
                border: Border.all(
                  color: _colorAnimation.value ?? Colors.grey.shade700,
                  width: 2.5,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: _colorAnimation.value ?? Colors.grey.shade300,
                            shadows: isToggled
                                ? [
                                    Shadow(
                                      color: Colors.amber.shade600.withOpacity(0.8),
                                      blurRadius: 6,
                                      offset: const Offset(0, 2),
                                    )
                                  ]
                                : null,
                          ),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 350),
                        child: isToggled
                            ? Icon(Icons.check_circle, key: const ValueKey('on'), color: Colors.amber.shade400, size: 32)
                            : Icon(Icons.radio_button_unchecked,
                                key: const ValueKey('off'), color: Colors.grey.shade600, size: 32),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        widget.description,
                        style: TextStyle(
                          color: Colors.amber.shade100.withOpacity(isToggled ? 1 : 0.6),
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _NextButton extends StatefulWidget {
  final VoidCallback onPressed;

  const _NextButton({required this.onPressed});

  @override
  State<_NextButton> createState() => __NextButtonState();
}

class __NextButtonState extends State<_NextButton> with SingleTickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _glowAnimation = Tween<double>(begin: 0.6, end: 1).animate(CurvedAnimation(parent: _glowController, curve: Curves.easeInOut));

    _glowController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(begin: 1, end: 1.07).animate(CurvedAnimation(parent: _glowController, curve: Curves.easeInOut)),
      child: FloatingActionButton(
        backgroundColor: Colors.amber.shade400,
        foregroundColor: Colors.grey.shade900,
        onPressed: widget.onPressed,
        elevation: 10,
        splashColor: Colors.amber.shade600,
        tooltip: 'Proceed',
        child: FadeTransition(
          opacity: _glowAnimation,
          child: const Icon(Icons.arrow_forward_ios, size: 28),
        ),
      ),
    );
  }
}
