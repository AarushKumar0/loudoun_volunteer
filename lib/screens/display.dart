import 'package:flutter/material.dart';
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


class _DisplayState extends State<Display> {
  Future<Account> getAccount() async {
    final args = ModalRoute.of(context)?.settings.arguments as AccountArguments;
    List<Account> laccount = await DatabaseHelper.instance.getAccount(args.account.username);
    return laccount[0];
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Settings'),
          content: const Text('Would you like to edit your skills?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                Account account = await getAccount(); // Get the account data
                Navigator.pushNamed(
                  context,
                  '/skills', // Navigate to the Skills page
                  arguments: AccountArguments(account: account), // Pass the arguments
                );
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        title: const Text(
          'Your Volunteering Opportunities',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Colors.amber.shade700,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _showSettingsDialog, // Call the settings dialog method
          ),
        ],
      ),

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
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            "Hello ${account.username}! The following are the Volunteering Programs recommended based on your chosen skillset:",
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        if (account.mobileHope) buildSkillTile("Mobile Hope", const MobileHope(), const Icon(Icons.arrow_right)),
        if (account.transitionalHousing) buildSkillTile("Transitional Housing", const TransitionalHousing(), const Icon(Icons.arrow_right)),
        if (account.morverPark) buildSkillTile("Morver Park", const MorverPark(), const Icon(Icons.arrow_right)),
        if (account.interfaithRelief) buildSkillTile("Interfaith Relief", const InterFaithRelief(), const Icon(Icons.arrow_right)),
        if (account.arborAssistingLiving) buildSkillTile("Arbor Assisting Living", const ArborAssistingLiving(), const Icon(Icons.arrow_right)),
        if (account.idaLeePark) buildSkillTile("Ida Lee Park", const IdaLeePark(), const Icon(Icons.arrow_right)),
        if (account.goodShepherdThrift) buildSkillTile("Good Shepherd Thrift", const GoodShepherdThrift(), const Icon(Icons.arrow_right)),
        if (account.franklinPark) buildSkillTile("Franklin Park Performing Arts Center", const FranklinPark(), const Icon(Icons.arrow_right)),
        if (account.bansheeReeks) buildSkillTile("Banshee Reeks Nature Preserves", const BansheeReeks(), const Icon(Icons.arrow_right)),
        if (account.heritageMuseum) buildSkillTile("Heritage Farm Museum", const HeritageFarm(), const Icon(Icons.arrow_right)),
        if (account.salvationArmy) buildSkillTile("The Salvation Army", const SalvationArmy(), const Icon(Icons.arrow_right)),
        if (account.animalServices) buildSkillTile("Loudoun County Animal Services", const AnimalServices(), const Icon(Icons.arrow_right)),
        if (account.claudeMoorePark) buildSkillTile("Claude Moore Park", const ClaudeMoorePark(), const Icon(Icons.arrow_right)),
        if (account.womenGivingBack) buildSkillTile("Women Giving Back", const WomenGivingBack(), const Icon(Icons.arrow_right)),
        if (account.aging) buildSkillTile("Loudoun Area Agency on Aging", const Aging(), const Icon(Icons.arrow_right)),
        if (account.mapping) buildSkillTile("Loudoun County Mapping Offices", const Mapping(), const Icon(Icons.arrow_right)),
        if (account.adamsCenter) buildSkillTile("Adams Center", const AdamsCenter(), const Icon(Icons.arrow_right)),
        if (account.loudounCares) buildSkillTile("Loudoun Cares", const LoudounCares(), const Icon(Icons.arrow_right)),
        if (account.loudounHungerRelief) buildSkillTile("Loudoun Hunger Relief", const LoudounHungerRelief(), const Icon(Icons.arrow_right)),
      ],
    );
  }


    Widget buildSkillTile(String title, Widget page, Icon icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 4, // Adds a shadow to make the tile pop
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16), // Adds padding inside the tile
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          trailing: icon,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
        ),
      ),
    );
  }

}
