import 'package:flutter/material.dart';

class LoudounCares extends StatelessWidget {
  const LoudounCares({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Loudoun Cares"),),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset("assets/pics/loudounCares.jpg", fit: BoxFit.cover,),
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
                                TextSpan(text: "\nLoudoun Cares envisions a future with compassionate engaged communities who are interconnected throughout the County, where every individual has access to the support, resources, and opportunities they need. We have been connecting those in Loudoun County as a 501 (c) 3 nonprofit since early 2003. Through our ConnectLine Helpline, we connect residents in need with local nonprofits and agencies that can assist with a variety of health and human services that include rent/utility assistance, food, clothing, medical/dental, housing, job services and more. We work closely with over 25 faith-based organizations to secure emergency financial aid for qualifying residents. Since the beginning of COVID19 we added disbursement of funds for rent and utilities. Our Volunteer Center online platform connects resident and corporate volunteers with local nonprofits. These volunteers help with everything from a one-time event to providing direct services to our community. Volunteers can look for opportunities, find out about upcoming events, and track their volunteer hours.", style: Theme.of(context).textTheme.bodyLarge),
                                TextSpan(text: "\n\nWebsite: ", style: Theme.of(context).textTheme.titleLarge),
                                TextSpan(text: "\nhttps://www.loudouncares.org/", style: Theme.of(context).textTheme.bodyLarge),
                                TextSpan(text: "\n\nContact info: ", style: Theme.of(context).textTheme.titleLarge),
                                TextSpan(text: "\nPiserra Valerie\n703-669-2351", style: Theme.of(context).textTheme.bodyLarge),
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