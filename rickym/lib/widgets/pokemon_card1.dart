import 'package:flutter/material.dart';
import 'package:rickym/widgets/power_badge.dart';

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
            height:400.0,
            width:double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Color.fromARGB(255, 208, 105, 105),
              ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
                    
              children: [
                Center(
                  child: Text("$year",
                  style: TextStyle(color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,),
                  ),
                ),
                   
                  
                   
                   
                    Center(child: powerbadge(text:"Gender: "+"${share}")),
                   
                    Center(child: powerbadge(text:"Location: "+"${category}")),
                    Center(child: powerbadge(text:"Origin: "+"${mot}")),
            
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

