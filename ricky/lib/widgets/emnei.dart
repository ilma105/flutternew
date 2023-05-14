import 'package:flutter/material.dart';
import 'package:ricky/widgets/power_badge.dart';

import '../pages/details_page.dart';

class pokemoncard extends StatelessWidget {
  
  final String year;
final String category;
final Map?  pokemonMap;

  const pokemoncard({
    super.key,required this.year,required this.category,    required this.pokemonMap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
           MaterialPageRoute(builder: (context)=>DetailsPage(data: pokemonMap) ),
        );
      },
      child: Stack(
        children: [
          Container(
            height:double.infinity,
            width:double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Color.fromARGB(255, 77, 147, 170),
              ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
          
              children: [
                Text("$year",
                style: TextStyle(color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,),
                ),
         
        
         
         
          powerbadge(text:"${category}"),

              // powerbadge(text:"${types[1]}"),
          
              ],
            ),
          ),
          
          ),
       
        ],
      ),
    );
  }
}

