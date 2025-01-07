import 'package:flutter/material.dart';

class LoudounHungerRelief extends StatelessWidget {
  const LoudounHungerRelief({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Loudoun Hunger Relief"),),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset("assets/pics/loudounHungerRelief.jpg", fit: BoxFit.cover,),
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
                                TextSpan(text: "\nAs the population of Loudoun County has increased, the number below the poverty line has also increased and so has the number of families and individuals we help. This past year, LHR directly served more than 13,000 individuals directly and another 600-800 families each week through distribution partners with a total of about 355,000 service instances. LHR is supplying tens of thousands of pounds of emergency preparedness food. as well as continuing our regular food distributions of fresh and nutritious groceries & rescued foods. LHR is committed to providing the best possible services to all clients regardless of race, sexual orientation, gender, gender identity (or expression), religion, national origin, age, disability or background.", style: Theme.of(context).textTheme.bodyLarge),
                                TextSpan(text: "\n\nWebsite: ", style: Theme.of(context).textTheme.titleLarge),
                                TextSpan(text: "\nhttps://loudounhunger.org/", style: Theme.of(context).textTheme.bodyLarge),
                                TextSpan(text: "\n\nContact info: ", style: Theme.of(context).textTheme.titleLarge),
                                TextSpan(text: "\nNA\n703-777-5911", style: Theme.of(context).textTheme.bodyLarge),
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