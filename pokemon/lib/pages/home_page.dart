import 'package:flutter/material.dart';
import 'package:pokemon/datasource/pokemon_datasource.dart';
import 'package:pokemon/widgets/My_title.dart';

import '../widgets/pokemon_card.dart';

class HomePage extends StatelessWidget {
  
   HomePage({
    super.key,
  });

List<Map?>? pokemonData=PokemonDatasource.pokemons;
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
              MyTitle(text:"Poketext",color:Colors.blue),
              Expanded(
                flex: 12,
                child: Container(
                  height: 500.0,
                  child: GridView.builder( 
                    itemCount: pokemonData!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 4/3 ,
                     crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,),
                  itemBuilder: (context,index)=>pokemoncard(name:"${pokemonData![index]!["name"]}",
                  types:[pokemonData![index]!.containsKey("type")?"${pokemonData![index]!["type"]![0]}":"No power"],
                  imageurl:"${pokemonData![index]!["img"]}",

                  pokemonMap:pokemonData![index],
                   )),
                  
                ),
              ),
            ],
                
                
                
          ),
       
      ),
    );
  }
}


