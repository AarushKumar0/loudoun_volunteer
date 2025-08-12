import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:loudoun_volunteer/db/database.dart';
import 'package:loudoun_volunteer/models/account.dart';
import 'package:loudoun_volunteer/utils/skillargument.dart';
import 'package:loudoun_volunteer/volunteerpages/adamsCenter.dart';
import 'package:loudoun_volunteer/volunteerpages/aging.dart';
import 'package:loudoun_volunteer/volunteerpages/animalServices.dart';
import 'package:loudoun_volunteer/volunteerpages/arborAssistingLiving.dart';
import 'package:loudoun_volunteer/volunteerpages/bansheeReeks.dart';
import 'package:loudoun_volunteer/volunteerpages/claudeMoore.dart';
import 'package:loudoun_volunteer/volunteerpages/franklinPark.dart';
import 'package:loudoun_volunteer/volunteerpages/goodShepherdThrift.dart';
import 'package:loudoun_volunteer/volunteerpages/heritageFarm.dart';
import 'package:loudoun_volunteer/volunteerpages/idaLeePark.dart';
import 'package:loudoun_volunteer/volunteerpages/interfaithRelief.dart';
import 'package:loudoun_volunteer/volunteerpages/loudounCares.dart';
import 'package:loudoun_volunteer/volunteerpages/loudounHungerRelief.dart';
import 'package:loudoun_volunteer/volunteerpages/mapping.dart';
import 'package:loudoun_volunteer/volunteerpages/mobileHope.dart';
import 'package:loudoun_volunteer/volunteerpages/morverPark.dart';
import 'package:loudoun_volunteer/volunteerpages/salvationArmy.dart';
import 'package:loudoun_volunteer/volunteerpages/transitionalHousing.dart';
import 'package:loudoun_volunteer/volunteerpages/womenGiving.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> with SingleTickerProviderStateMixin {
  late Future<Account> accountFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as AccountArguments;
    accountFuture = DatabaseHelper.instance.getAccount(args.account.username).then((list) => list.first);
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.deepPurple.shade900.withOpacity(0.95),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.amber.shade400,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    shadows: const [
                      Shadow(
                        color: Colors.black54,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Would you like to edit your skills?',
                  style: TextStyle(
                    color: Colors.amber.shade100,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    shadows: const [
                      Shadow(
                        color: Colors.black38,
                        blurRadius: 3,
                        offset: Offset(1, 1),
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _DialogButton(
                      text: 'No',
                      color: Colors.grey.shade700,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    _DialogButton(
                      text: 'Yes',
                      color: Colors.amber.shade400,
                      onPressed: () async {
                        Navigator.of(context).pop();
                        Account account = await accountFuture;
                        Navigator.pushNamed(
                          context,
                          '/skills',
                          arguments: AccountArguments(account: account),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.amber.shade400, Colors.deepOrange.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            'Your Volunteering Opportunities',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.4,
              color: Colors.white,
              shadows: [
                Shadow(blurRadius: 4, color: Colors.black87, offset: Offset(1, 1))
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, size: 28),
            tooltip: 'Settings',
            color: Colors.amber.shade400,
            onPressed: _showSettingsDialog,
            splashRadius: 28,
            hoverColor: Colors.amber.shade200.withOpacity(0.4),
          ),
          const SizedBox(width: 12),
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade900, Colors.deepPurple.shade600],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<Account>(
          future: accountFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: Colors.amber));
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.redAccent, fontSize: 18),
                ),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text(
                  'No account found',
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
              );
            }

            final account = snapshot.data!;
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              physics: const BouncingScrollPhysics(),
              children: [
                Text(
                  "Hello ${account.username}!\nHere are some amazing volunteering programs recommended based on your skills:",
                  style: TextStyle(
                    color: Colors.amber.shade200,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                    shadows: const [
                      Shadow(
                        color: Colors.black45,
                        blurRadius: 4,
                        offset: Offset(1, 1),
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 36),

                ..._buildSkillTiles(account).asMap().entries.map((entry) {
                  final index = entry.key;
                  final tile = entry.value;
                  return _AnimatedSkillTile(tile: tile, delay: index * 150);
                }).toList(),

                const SizedBox(height: 50),
              ],
            );
          },
        ),
      ),
    );
  }

  List<_SkillTileData> _buildSkillTiles(Account account) {
    final tiles = <_SkillTileData>[];

    void addIf(bool cond, String title, Widget page) {
      if (cond) tiles.add(_SkillTileData(title: title, page: page));
    }

    addIf(account.mobileHope, "Mobile Hope", const MobileHope());
    addIf(account.transitionalHousing, "Transitional Housing", const TransitionalHousing());
    addIf(account.morverPark, "Morver Park", const MorverPark());
    addIf(account.interfaithRelief, "Interfaith Relief", const InterFaithRelief());
    addIf(account.arborAssistingLiving, "Arbor Assisting Living", const ArborAssistingLiving());
    addIf(account.idaLeePark, "Ida Lee Park", const IdaLeePark());
    addIf(account.goodShepherdThrift, "Good Shepherd Thrift", const GoodShepherdThrift());
    addIf(account.franklinPark, "Franklin Park Performing Arts Center", const FranklinPark());
    addIf(account.bansheeReeks, "Banshee Reeks Nature Preserves", const BansheeReeks());
    addIf(account.heritageMuseum, "Heritage Farm Museum", const HeritageFarm());
    addIf(account.salvationArmy, "The Salvation Army", const SalvationArmy());
    addIf(account.animalServices, "Loudoun County Animal Services", const AnimalServices());
    addIf(account.claudeMoorePark, "Claude Moore Park", const ClaudeMoorePark());
    addIf(account.womenGivingBack, "Women Giving Back", const WomenGivingBack());
    addIf(account.aging, "Loudoun Area Agency on Aging", const Aging());
    addIf(account.mapping, "Loudoun County Mapping Offices", const Mapping());
    addIf(account.adamsCenter, "Adams Center", const AdamsCenter());
    addIf(account.loudounCares, "Loudoun Cares", const LoudounCares());
    addIf(account.loudounHungerRelief, "Loudoun Hunger Relief", const LoudounHungerRelief());

    return tiles;
  }
}

class _SkillTileData {
  final String title;
  final Widget page;
  _SkillTileData({required this.title, required this.page});
}

class _AnimatedSkillTile extends StatefulWidget {
  final _SkillTileData tile;
  final int delay;

  const _AnimatedSkillTile({required this.tile, this.delay = 0});

  @override
  State<_AnimatedSkillTile> createState() => __AnimatedSkillTileState();
}

class __AnimatedSkillTileState extends State<_AnimatedSkillTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _fadeAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: _SkillTile(
          title: widget.tile.title,
          page: widget.tile.page,
        ),
      ),
    );
  }
}

class _SkillTile extends StatefulWidget {
  final String title;
  final Widget page;

  const _SkillTile({required this.title, required this.page});

  @override
  State<_SkillTile> createState() => __SkillTileState();
}

class __SkillTileState extends State<_SkillTile> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapCancel: () => setState(() => _isPressed = false),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        Navigator.push(context, MaterialPageRoute(builder: (_) => widget.page));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
        decoration: BoxDecoration(
          gradient: _isPressed
              ? LinearGradient(
                  colors: [Colors.amber.shade600, Colors.deepOrange.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.0, 1.0],
                )
              : LinearGradient(
                  colors: [Colors.amber.shade400.withOpacity(0.8), Colors.orange.shade300.withOpacity(0.8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.0, 1.0],
                ),
          boxShadow: [
            BoxShadow(
              color: Colors.amber.shade400.withOpacity(_isPressed ? 0.6 : 0.25),
              blurRadius: _isPressed ? 20 : 12,
              offset: Offset(0, _isPressed ? 10 : 6),
              spreadRadius: _isPressed ? 2 : 0,
            ),
            BoxShadow(
              color: Colors.deepOrange.shade700.withOpacity(_isPressed ? 0.4 : 0.2),
              blurRadius: _isPressed ? 20 : 12,
              offset: Offset(0, _isPressed ? 8 : 5),
              spreadRadius: _isPressed ? 1 : 0,
            ),
          ],
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.amber.shade700.withOpacity(0.9),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(
                  color: _isPressed ? Colors.white : Colors.deepPurple.shade900,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  letterSpacing: 0.8,
                  shadows: [
                    Shadow(
                      color: _isPressed ? Colors.black45 : Colors.amber.shade200,
                      blurRadius: 6,
                      offset: const Offset(1, 1),
                    )
                  ],
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _isPressed
                  ? Icon(Icons.arrow_forward_ios, color: Colors.white, size: 28, key: const ValueKey('pressed'))
                  : Icon(Icons.arrow_forward_ios, color: Colors.deepPurple.shade900, size: 28, key: const ValueKey('normal')),
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const _DialogButton({required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.deepPurple.shade900,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        shadowColor: color.withOpacity(0.7),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.1),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

