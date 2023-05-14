import 'package:flutter/material.dart';
import 'package:pokemon/datasource/pokemon_datasource.dart';
import 'package:pokemon/widgets/My_title.dart';
import 'package:pokemon/widgets/pokemon_card1.dart';

import '../widgets/pokemon_card.dart';

class HomePage extends StatelessWidget {
   final List<Map?>? laur;
   HomePage({
    super.key,required this.laur
  });

// List<Map?>? pokemonData=PokemonDatasource.pokemons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.blueAccent,),
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
              MyTitle(text:"Laureates",color:Colors.blue),
              Expanded(
                flex: 12,
                child: Container(
                  height: 500.0,
                  child: GridView.builder( 
                    itemCount: laur!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 6/15 ,
                     crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,),
                  itemBuilder: (context,index)=>pokemoncard1(year:"${laur![index]!["id"]}",category:"${laur![index]!["firstname"]+" "+laur![index]!["surname"]}"
           ,mot:"${laur![index]!["motivation"]}"   ,   share:"${laur![index]!["share"]}"   ,            

     
                
                   )),
                  
                  
                ),
              ),
            ],
                
                
                
          ),
       
      ),
    );
  }
}


