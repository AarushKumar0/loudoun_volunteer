import 'package:flutter/material.dart';

class FranklinPark extends StatelessWidget {
  const FranklinPark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Franklin Park Performing Arts Center"),),

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset("assets/pics/franklinPark.jpg", fit: BoxFit.cover,),
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
                              TextSpan(text: "\nAs a volunteer you will be helping Loudoun’s first dedicated home for the arts produce exciting and worthwhile events. It’s a great way to enjoy your favorite art, learn about new artists, and get a peak behind the curtains at the same time! We welcome corporate volunteer teams and high school volunteer programs as well!", style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(text: "\n\nWebsite: ", style: Theme.of(context).textTheme.titleLarge),
                              TextSpan(text: "\nhttps://www.franklinparkartscenter.org/volunteer/", style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(text: "\n\nContact info: ", style: Theme.of(context).textTheme.titleLarge),
                              TextSpan(text: "\nMr.Dan Mcnel\n540-338-7603", style: Theme.of(context).textTheme.bodyLarge),
                            ]
                          ),
                        ),


                        
                      ],

                      
                      ),
              ),

          ],
        )
      )
    );
  }
}