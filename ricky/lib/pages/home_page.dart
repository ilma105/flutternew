import 'package:flutter/material.dart';

import '../widgets/My_title.dart';
import '../widgets/pokemon_card1.dart';


class HomePage extends StatelessWidget {
   final String loc;
   final  String gender;
   final String name;
   final String origin;

   HomePage({
    super.key,required this.loc,required this.gender,required this.name,required this.origin
  });

// List<Map?>? pokemonData=PokemonDatasource.pokemons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Color.fromARGB(255, 102, 9, 19),),
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
              MyTitle(text:"Rick-Mortey",color:Color.fromARGB(255, 82, 5, 5)),
              Expanded(
                flex: 12,
                child: Container(
                  height: 500.0,
                  child:pokemoncard1(year: name, category: loc, mot: origin, share: gender)
                   
                ),
              ),
            ],
                
                
                
          ),
       
      ),
    );
  }
}


