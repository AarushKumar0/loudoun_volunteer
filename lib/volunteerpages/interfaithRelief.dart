import 'package:flutter/material.dart';

class InterFaithRelief extends StatelessWidget {
  const InterFaithRelief({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Interfaith Relief"),),

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset("assets/pics/interfaithRelief.png", fit: BoxFit.cover,),
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
                              TextSpan(text: "\nLoudoun Interfaith Relief is a multi-faith food pantry that provides nutritious food, personal supplies and other services to those in need in Dulles South and the surrounding area regardless of income, faith or other criteria and strive to promote self-sufficiency.", style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(text: "\n\nWebsite: ", style: Theme.of(context).textTheme.titleLarge),
                              TextSpan(text: "\nNA", style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(text: "\n\nContact info: ", style: Theme.of(context).textTheme.titleLarge),
                              TextSpan(text: "\nMs.Karla\n703-777-5911", style: Theme.of(context).textTheme.bodyLarge),
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