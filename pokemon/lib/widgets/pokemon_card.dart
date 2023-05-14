import 'package:flutter/material.dart';
import 'package:pokemon/pages/details_page.dart';
import 'package:pokemon/widgets/power_badge.dart';

class pokemoncard extends StatelessWidget {
  
  final String name;
  final List<String> types;
final String imageurl;
final Map?  pokemonMap;
  const pokemoncard({
    super.key,required this.name,required this.types,required this.imageurl,
    required this.pokemonMap
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
                Text("$name",
                style: TextStyle(color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,),
                ),
          powerbadge(text:"${types[0]}"),
              // powerbadge(text:"${types[1]}"),
          
              ],
            ),
          ),
          
          ),
        Positioned(
          right: 0,
           bottom: 0 ,
          child: Hero(
            tag:"pokecard-${name}",
            child: Image.network("$imageurl",width: 100.0,))),     
       
        ],
      ),
    );
  }
}

