import 'package:flutter/material.dart';

class AdamsCenter extends StatelessWidget {
  const AdamsCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adams Center"),),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset("assets/pics/adamsCenter.png", fit: BoxFit.cover,),
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
                                TextSpan(text: "\nADAMS Social Services Department’s mission is to provide for its members and community; therapy programs, support groups, an outlet for every need in regard to financial assistance and spiritual wellbeing and mental and physical health programs in an atmosphere of compassion. Our vision is to have a compassionate and well-educated community living in dignity and self-sufficiency.", style: Theme.of(context).textTheme.bodyLarge),
                                TextSpan(text: "\n\nWebsite: ", style: Theme.of(context).textTheme.titleLarge),
                                TextSpan(text: "\nhttps://adamscenter.org/what-we-offer/", style: Theme.of(context).textTheme.bodyLarge),
                                TextSpan(text: "\n\nContact info: ", style: Theme.of(context).textTheme.titleLarge),
                                TextSpan(text: "\nLahilu Yasmina\n703-999-9526", style: Theme.of(context).textTheme.bodyLarge),
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