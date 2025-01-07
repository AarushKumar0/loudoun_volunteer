import 'package:flutter/material.dart';

class MorverPark extends StatelessWidget {
  const MorverPark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Morven Park"),),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset("assets/pics/morvenPark.png", fit: BoxFit.cover,),
              ),
        
               Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: "Description: ", style: Theme.of(context).textTheme.titleLarge),
                                TextSpan(text: "\nVolunteering at Morven Park is as unique as it is inspiring. The dedicated volunteer Board of Trustees and the staff know how valuable your time is, and we appreciate anyone who is willing to share their talents and expertise with us. Park volunteers assist with events like Polo in the Park, Morven Park Horse Trials, and Easter in the Park, or they work on museum behind-the-scenes projects. Volunteers receive on-the-job training and support, often have opportunities to work alongside other volunteers or staff and receive invitations to volunteer appreciation events. Our volunteers learn a lot, help a great cause, and most of all, they have fun!", style: Theme.of(context).textTheme.bodyLarge),
                                TextSpan(text: "\n\nWebsite: ", style: Theme.of(context).textTheme.titleLarge),
                                TextSpan(text: "\nmorvenpark.org/support/volunteer.html", style: Theme.of(context).textTheme.bodyLarge),
                                TextSpan(text: "\n\nContact info: ", style: Theme.of(context).textTheme.titleLarge),
                                TextSpan(text: "\nMr.John Creaner\n571-246-6707", style: Theme.of(context).textTheme.bodyLarge),
                              ]
                            ),
                          ),
        
        
                          
                        ],
        
                        
                        ),
                ),
        
            ],
          )
        ),
      )
    );
  }
}