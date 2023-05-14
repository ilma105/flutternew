import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokemon/widgets/My_title.dart';
import 'package:pokemon/widgets/feature_title_text.dart';
import 'package:pokemon/widgets/feature_value_text%20copy.dart';
import 'package:pokemon/widgets/power_badge.dart';

class DetailsPage extends StatelessWidget {
  final Map? data;
  const DetailsPage({super.key,
  required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color.fromARGB(255, 16, 100, 121),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
child: Stack(
  alignment: AlignmentDirectional.topCenter,
  children: [
        Column(
    
      children: [
    
        
    
        Expanded(
    
          flex: 3,
    
          child: Container(
    
            width: double.infinity,
    
            height: 300.0,
    child: Padding(
      padding: const EdgeInsets.only(left:20.0),
      child: Column(
        children: [
          MyTitle(text: "${data!["name"]}",
          color:Colors.white),
          Row(
            children: data!["type"].map<Widget>((item) => powerbadge(text: "$item")).toList(),
            //another method
            // children: [
            // for(String item in data!["type"]) powerbadge(text:"$item")
    
            // ],
          ),
          Container(
            height: 100.0,
          )
        ],
      ),
    ),
          ),
    
        ),
    
      Expanded(
    
        flex: 5,
    
        child: Container(
    decoration: BoxDecoration(borderRadius:BorderRadius.circular(34.0),color: Colors.white),
    
          width: double.infinity,
   child: Row(
    children: [
      Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.only(top: 60.0),
      height: double.infinity,
      child: Column(
      
        children: const[
       FeatureTitleText(text:"height"),
      
       FeatureTitleText(text:"weight"),
       FeatureTitleText(text:"candy"),
       FeatureTitleText(text:"egg"),
      
      
        ],
      ),
      
          ),
      ),
    Expanded(
      flex: 2,
      child: Container(
            padding: EdgeInsets.only(top: 60.0),
         
              height: double.infinity,
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
           children: [
         
         FeatureValueText(text:"${data!["height"]}"),
         
         FeatureValueText(text:"${data!["weight"]}"),
         FeatureValueText(text:"${data!["candy"]}"),
      FeatureValueText(text:"${data!["egg"]}"),
         
           ]
          
          ),
      ),
    ),],
   ), 
        ),
    
      )
    
      ],
    
    ),
 
 Positioned(
  top: 60.0,
   
    child: Hero
    (
      tag: "pokecard-${data!["name"]}",
      child: Image.network(
        "${data!["img"]}",
      height: 200.0,
      fit: BoxFit.fill,
      ),
    ),

   
   
 )
  ],
),

      ),
    );
  }
}

