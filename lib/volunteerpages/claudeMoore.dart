import 'package:flutter/material.dart';

class ClaudeMoorePark extends StatelessWidget {
  const ClaudeMoorePark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Claude Moore Park"),),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset("assets/pics/claudeMoore.jpg", fit: BoxFit.cover,),
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
                                TextSpan(text: "\nClaude Moore Park welcomes volunteers eager to share their love of nature and history with others. A variety of opportunities for volunteering include nature study, outdoor safety, stewardship, habitat restoration, sharing nature with children, techniques for collecting natural specimens, park history and regulations.", style: Theme.of(context).textTheme.bodyLarge),
                                TextSpan(text: "\n\nWebsite: ", style: Theme.of(context).textTheme.titleLarge),
                                TextSpan(text: "\nhttps://www.loudoun.gov/1297/Volunteering", style: Theme.of(context).textTheme.bodyLarge),
                                TextSpan(text: "\n\nContact info: ", style: Theme.of(context).textTheme.titleLarge),
                                TextSpan(text: "\nMr.Danner Brain\n571-258-3702", style: Theme.of(context).textTheme.bodyLarge),
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