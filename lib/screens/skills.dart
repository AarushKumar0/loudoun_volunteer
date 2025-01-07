import 'package:flutter/material.dart';
import 'package:loudoun_volunteer/db/database.dart';
import 'package:loudoun_volunteer/models/account.dart';
import 'package:loudoun_volunteer/utils/skillargument.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  Future<Account> getAccount() async {
    final args = ModalRoute.of(context)?.settings.arguments as AccountArguments;
    List<Account> laccount = await DatabaseHelper.instance.getAccount(args.account.username);
    return laccount[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<Account>(
            future: getAccount(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.black),
                );
              } else if (snapshot.hasData) {
                var account = snapshot.data!;
                return buildSkillsButtons(account);
              } else {
                return const Text(
                  'No account found',
                  style: TextStyle(color: Colors.black),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildSkillsButtons(Account account) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        const Text(
          'Select Your Skills',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        buildSkillTile(
          title: "Donation Collection and Organization",
          description:
              "Collect, organize, and redistribute donations in thrift stores, shelters, warehouses, trucks, and more.",
          initialState: account.mobileHope, // Use account property to get initial state
          onToggle: (newState) {
            DatabaseHelper.instance.toggleMobileHope(account.username, account);
            DatabaseHelper.instance.toggleGoodShepherdThrift(account.username, account);
            DatabaseHelper.instance.toggleSalvationArmy(account.username, account);
            DatabaseHelper.instance.toggleLoudounCares(account.username, account);
            DatabaseHelper.instance.toggleWomenGivingBack(account.username, account);
          },
        ),
        buildSkillTile(
          title: "Parks and Recreation Services",
          description:
              "Help manage, clean, maintain, renovate, and host events in parks, fields, nature reserves, and community/recreation centers.",
          initialState: account.morverPark, // Use account property to get initial state
          onToggle: (newState) {
            DatabaseHelper.instance.toggleMorverPark(account.username, account);
            DatabaseHelper.instance.toggleIdaLeePark(account.username, account);
            DatabaseHelper.instance.toggleFranklinPark(account.username, account);
            DatabaseHelper.instance.toggleBansheeReeks(account.username, account);
            DatabaseHelper.instance.toggleHeritageMuseum(account.username, account);
            DatabaseHelper.instance.toggleClaudeMoorePark(account.username, account);
            DatabaseHelper.instance.toggleMapping(account.username, account);
          },
        ),
        buildSkillTile(
          title: "Senior Care",
          description:
              "Assist the elderly by serving as companions in both indoor and outdoor activities, doing some chores, and assisting in errands/meals.",
          initialState: account.arborAssistingLiving, // Use account property to get initial state
          onToggle: (newState) {
            DatabaseHelper.instance.toggleArborAssistingLiving(account.username, account);
            DatabaseHelper.instance.toggleAging(account.username, account);
          },
        ),
        buildSkillTile(
          title: "Animal Care",
          description:
              "Clean the cages, kennels, and litter boxes of animals; feed the animals; give them medications; and walk/play with them.",
          initialState: account.animalServices, // Use account property to get initial state
          onToggle: (newState) {
            DatabaseHelper.instance.toggleAnimalServices(account.username, account);
          },
        ),
        buildSkillTile(
          title: "Transitional Housing and Religious Centers",
          description:
              "Help manage, clean, maintain, and renovate homeless shelters and religious centers while also assisting and connecting with the people there.",
          initialState: account.transitionalHousing, // Use account property to get initial state
          onToggle: (newState) {
            DatabaseHelper.instance.toggleTransitionalHousing(account.username, account);
            DatabaseHelper.instance.toggleAdamsCenter(account.username, account);
          },
        ),
        buildSkillTile(
          title: "Food Collections/Preparations",
          description:
              "Collect and organize food donations in pantries/warehouses, prepare and distribute food for the homeless, clean and maintain shelters.",
          initialState: account.interfaithRelief, // Use account property to get initial state
          onToggle: (newState) {
            DatabaseHelper.instance.toggleInterFaithRelief(account.username, account);
            DatabaseHelper.instance.toggleLoudounHungerRelief(account.username, account);
          },
        ),
        const SizedBox(height: 20),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/display', arguments: AccountArguments(account: account));
          },
          icon: const Icon(Icons.arrow_right, color: Colors.black),
        ),
      ],
    );
  }

  Widget buildSkillTile({
    required String title,
    required String description,
    required bool initialState, // Added initialState parameter
    required ValueChanged<bool> onToggle,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        color: Colors.amber.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ExpansionTile(
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ToggleButton(initialState: initialState, onToggle: onToggle), // Pass initial state
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

class ToggleButton extends StatefulWidget {
  final bool initialState; // New property to accept initial state
  final ValueChanged<bool> onToggle;

  const ToggleButton({super.key, required this.onToggle, required this.initialState}); // Accept initial state in constructor

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  late bool toggleState; // Use late to initialize later

  @override
  void initState() {
    super.initState();
    toggleState = widget.initialState; // Set initial state
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: toggleState ? Colors.amber.shade200 : Colors.amber.shade100,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        setState(() {
          toggleState = !toggleState;
        });
        widget.onToggle(toggleState);
      },
      child: Text(toggleState ? "Skill On" : "Skill Off"),
    );
  }
}
