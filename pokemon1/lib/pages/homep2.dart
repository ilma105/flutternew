import 'package:flutter/material.dart';
import 'package:pokemon/datasource/pokemon_datasource.dart';
import 'package:pokemon/widgets/My_title.dart';

import '../datasource/nobel.dart';
import '../widgets/pokemon_card.dart';

class HomePage2 extends StatelessWidget {
  
   HomePage2({
    super.key,
  });
 List<Map?>? pokemonData=PokemonDatasource.pokemons;
List<Map?>? nobeldata=Nobel.nobels;
final List<Color> colors = [
  Color.fromARGB(255, 54, 86, 111),
  Color.fromARGB(255, 94, 186, 97),
  Color.fromARGB(255, 100, 33, 33),
  Color.fromARGB(255, 125, 75, 10),
  Color.fromARGB(255, 65, 33, 71),
  Color.fromARGB(255, 130, 33, 93)
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.bento_rounded,color: Colors.black,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: 
     Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              MyTitle(text:"Nobels",color:Colors.blue),
              Expanded(
                flex: 12,
                child: Container(
                  height: 500.0,
                  child: GridView.builder( 
                    itemCount: nobeldata!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 4/3 ,
                     crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,),
                  itemBuilder: (context,index)=>pokemoncard(year:"${nobeldata![index]!["year"]}",category:"${nobeldata![index]!["category"]}"
           ,                   nobelMap:nobeldata![index]!["laureates"],
      color: colors[index % colors.length]
     
                
                   )),
                  
                ),
              ),
            ],
                
                
                
          ),
       
      ),
    );
  }
}


