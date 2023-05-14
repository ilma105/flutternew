import 'package:flutter/material.dart';
import 'package:pokemon/pages/details_page.dart';
import 'package:pokemon/pages/home_page.dart';
import 'package:pokemon/widgets/power_badge.dart';

class pokemoncard extends StatelessWidget {
  
  final String year;
final String category;
final Color color;
// final Map?  pokemonMap;
final List<Map>?  nobelMap;

  const pokemoncard({
    super.key,required this.year,required this.category,    required this.nobelMap,required this.color
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
           MaterialPageRoute(builder: (context)=>HomePage(laur: nobelMap) ),
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

