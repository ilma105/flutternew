import 'package:flutter/material.dart';
import 'package:pokemon/pages/details_page.dart';
import 'package:pokemon/widgets/power_badge.dart';

class pokemoncard1 extends StatelessWidget {
  
  final String year;
final String category;
final String mot;
final String share;

  const pokemoncard1({
    super.key,required this.year,required this.category,     required this.mot,    required this.share,    
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.of(context).push(
      //      MaterialPageRoute(builder: (context)=>DetailsPage(data: pokemonMap) ),
      //   );
      // },
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
                Expanded(
                  flex: 4,
                  child: Text("$year",
                  style: TextStyle(color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,),
                  ),
                ),
                   
                  
                   
                   
                    Expanded(
                      flex: 4,
                      child: powerbadge(text:"Name: "+"${category}")),
                   
                    Expanded(
                      flex: 12,
                      child: powerbadge(text:"Motivation: "+"${mot}")),
                    Expanded(
                      flex: 4,
                      child: powerbadge(text:"Share: "+"${share}")),
            
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

