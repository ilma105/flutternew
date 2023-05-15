import 'package:flutter/material.dart';
import 'package:rickym/widgets/power_badge.dart';

import '../pages/home_page.dart';

class pokemoncard extends StatelessWidget {
  
  final String year;
final String category;
final String image;

final Color color;
// final Map?  pokemonMap;
final List<Map>?  nobelMap;
final String species;
final String gender;
final String org;
final String loc;
  const pokemoncard({
    super.key,required this.year,required this.category,required this.species,required this.image, required this.nobelMap,required this.color,required this.loc,
    required this.org,required this.gender
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
           MaterialPageRoute(builder: (context)=>HomePage(loc: loc, gender: gender, name: year, origin: org),)
        );
      },
      child: Stack(
        children: [
          Container(
            height:double.infinity,
            width:double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: color,
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
                    powerbadge(text:"${species}"),


              // powerbadge(text:"${types[1]}"),
          
              ],
            ),
          ),
          
          ),
           Positioned(
            right: 0,
            bottom: 0,
             child: Image.network("${image}",
             width: 50.0,
             height: 60.0,
             ),
           )

        ],
      ),
    );
  }
}

