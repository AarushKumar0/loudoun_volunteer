import 'package:flutter/material.dart';

class IdaLeePark extends StatelessWidget {
  const IdaLeePark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ida Lee Park"),),

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset("assets/pics/idaLeePark.jpg", fit: BoxFit.cover,),
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
                              TextSpan(text: "\nIda Lee Park Recreation Center is a full-service recreation facility, offering a fitness center, two indoor pools, a full-size basketball court, racquetball courts, banquet hall, child care and full range of fitness, recreation, and sport programs and classes.", style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(text: "\n\nWebsite: ", style: Theme.of(context).textTheme.titleLarge),
                              TextSpan(text: "\nhttps://www.leesburgva.gov/departments/parks-recreation", style: Theme.of(context).textTheme.bodyLarge),
                              TextSpan(text: "\n\nContact info: ", style: Theme.of(context).textTheme.titleLarge),
                              TextSpan(text: "\nMs.Jackson\n703-777-1368", style: Theme.of(context).textTheme.bodyLarge),
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