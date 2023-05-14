import 'package:flutter/material.dart';

import '../datasource/nobel.dart';
import '../datasource/pokemon_datasource.dart';
import '../datasource/ricky.dart';
import '../widgets/My_title.dart';
import '../widgets/pokemon_card.dart';

class HomePage2 extends StatelessWidget {
  
   HomePage2({
    super.key,
  });
 List<Map?>? pokemonData=PokemonDatasource.pokemons;
List<Map?>? nobeldata=Nobel.nobels;
List<Map?>? ricky = Ricky.ricky;
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

              MyTitle(text:"Rick",color:Color.fromARGB(255, 149, 37, 6)),
              Expanded(
                flex: 12,
                child: Container(
                  height: 500.0,
                  child: GridView.builder( 
                    itemCount: ricky!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    // childAspectRatio: 4/3 ,
                     crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,),
                  itemBuilder: (context,index)=>pokemoncard(year:"${ricky![index]!["name"]}",category:"${ricky![index]!["status"]}"
           ,                   nobelMap:nobeldata![index]!["laureates"],species: ricky![index]!["species"],image: ricky![index]!["image"],


      color: colors[index % colors.length],
      org: ricky![index]!["origin"]["name"],
      loc: ricky![index]!["location"]["name"],
      gender: ricky![index]!["gender"],
     
                
                   )),
                  
                ),
              ),
            ],
                
                
                
          ),
       
      ),
    );
  }
}


