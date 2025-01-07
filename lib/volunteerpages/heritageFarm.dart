import 'package:flutter/material.dart';

class HeritageFarm extends StatelessWidget {
  const HeritageFarm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Heritage Farm"),),

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset("assets/pics/heritageFarm.jpg", fit: BoxFit.cover,),
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
                              TextSpan(text: "\nJoin our team as a Loudoun Heritage Farm Museum Volunteer.  For information regarding volunteer opportunities, please contact Denise Mo at denise@lhfarmmuseum.org for more information.", style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(text: "\n\nWebsite: ", style: Theme.of(context).textTheme.titleLarge),
                              TextSpan(text: "\nhttps://heritagefarmmuseum.org/support", style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(text: "\n\nContact info: ", style: Theme.of(context).textTheme.titleLarge),
                              TextSpan(text: "\nMs.Stwart\n571-258-3800\n\nMs.Mo\ndenise@lhfarmmuseum.org", style: Theme.of(context).textTheme.bodyLarge),
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