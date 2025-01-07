import 'package:flutter/material.dart';

class BansheeReeks extends StatelessWidget {
  const BansheeReeks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Banshee Reeks Nature Preserves"),),

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset("assets/pics/bansheeReeks.jpg", fit: BoxFit.cover,),
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
                              TextSpan(text: "\nBanshee Reeks is a Nature Preserve, which ensures that all of the plants, animals, habitats and cultural resources are protected.", style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(text: "\n\nWebsite: ", style: Theme.of(context).textTheme.titleLarge),
                              TextSpan(text: "\nhttps://www.loudoun.gov/1277/Banshee-Reeks-Nature-Preserve", style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(text: "\n\nContact info: ", style: Theme.of(context).textTheme.titleLarge),
                              TextSpan(text: "\nMr.Ron Circle\n703-669-0316", style: Theme.of(context).textTheme.bodyLarge),
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