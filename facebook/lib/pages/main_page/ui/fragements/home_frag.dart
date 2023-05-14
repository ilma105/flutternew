import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stack/core/constraints/my_colors.dart';
import 'package:stack/pages/main_page/providers/home_frag_provider.dart';
import 'package:stack/router/route_manager.dart';

import '../../../../core/widgets/messengermind.dart';
import '../../../../core/widgets/my_appbar.dart';

class HomeFrag extends StatelessWidget {
   HomeFrag({super.key});
String text="Saima Hossain";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>HomeFragProv(),
      child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: CustomScrollView(
              
              ///eksathe onekkichu ke scroll kora jabe
          slivers: [
            //  SliverToBoxAdapter(child: Padding(
            //  padding: const EdgeInsets.symmetric(vertical:20.0,horizontal: 8.0),
            //  child: Appbarsec(tex: text,),
            //  )
            //  ),
          SliverToBoxAdapter(child: SizedBox(height: 12.0,)
          ),
          const _Searchbox(),
       const   Categories(),
       const   ProductCard()
          
          ],
            ),
          ),
        ),
      
    );
 
  }
}

class ProductCard extends StatelessWidget {

  const ProductCard({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return     SliverToBoxAdapter(
    
      child: Consumer<HomeFragProv>(
        builder:(context,homeFragProv,child)=>
        GridView.builder(
           
          itemCount: homeFragProv.products.length,
          
          //kototuku jaiga nite ei related prob solve hoi
          
          shrinkWrap: true,
          
          ///pura screen eksathe scroll korbe for physics er value
          
          physics: NeverScrollableScrollPhysics(),
          
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          
            crossAxisCount: 1,
          
            crossAxisSpacing: 12.0,
          
            //height width ratio
          
            childAspectRatio: 1/2,
          
            mainAxisSpacing: 12.0,
          
          ), 
          
          
          
          itemBuilder: (contex , index)=>
          
        //   Product_Card(
        //     ontap:(){
        //       print("object");
        //       contex.goNamed(Routenames.details,extra: homeFragProv.products[index]);},
        //     title:(homeFragProv.products[index].title!.length>20?"${homeFragProv.products[index].title!.substring(0,20)}.....":homeFragProv.products[index].title) ??"no title",
        // cat:homeFragProv.products[index].category??"no Category",
        // price:"\$${homeFragProv.products[index].price.toString()}",
        // star:homeFragProv.products[index].rating?.rate.toString()??"no rating",
        // img: homeFragProv.products[index].image??"https://picsum.photos/200/300",)
        
        Product_Card(
            // ontap:(){
            //   print("object");
            //   contex.goNamed(Routenames.details,extra: homeFragProv.products[index]);},
           
           
            title:(homeFragProv.products[index].title!.length>20?"${homeFragProv.products[index].title!.substring(0,20)}.....":homeFragProv.products[index].title) ??"no title",
        cat:homeFragProv.products[index].category??"no Category",
        // price:"\$${homeFragProv.products[index].price.toString()}",
        // star:homeFragProv.products[index].rating?.rate.toString()??"no rating",
        img: "https://picsum.photos/200/300",)
        
        ),
      
      
      
      ) ,
    
    );
  }
}

// class Product_Card extends StatelessWidget {
 
 
//  final String img;
//   final String title;
//   final String cat;
//   final String price;
//   final String star;
//     final VoidCallback ontap;

//   const Product_Card({
//     super.key,
//     required this.ontap,
//     required this.img,
//     required this.title,
//     required this.cat,
//     required this.price,
//     required this.star,
//   });

  

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
    
//       padding: const EdgeInsets.symmetric(horizontal:10.0),
    
//       child: InkWell(
//         onTap: ontap,
//         child: Container(
          
//         child: Column(
          
//           crossAxisAlignment: CrossAxisAlignment.start,
          
//           children: [
          
//             Expanded(
          
//               flex:5 ,
          
//               child: Container(
          
//                 alignment: Alignment.topRight,
          
//                 width: double.infinity,
          
//                 child: IconButton(onPressed: (){}, icon: CircleAvatar(
          
//                   backgroundColor: MyColors.bc,
          
//                   child: Icon(Icons.favorite,color: Colors.white,))),
          
//               decoration: BoxDecoration(
          
//                 borderRadius: BorderRadius.circular(24.0),
          
//                 color:Colors.purple ,
          
//                 image: DecorationImage(
          
//                   fit: BoxFit.cover,
          
//                   image: NetworkImage("$img"))),
          
//               )),
          
//             Expanded(
          
//               flex: 2,
          
//               child: Column(
          
//                 crossAxisAlignment: CrossAxisAlignment.start,
          
//                 mainAxisAlignment: MainAxisAlignment.start,
          
//                 children: [
          
//                                             SizedBox(height: 4.0),
          
          
          
//                   Text("$title",
          
//                   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),
          
//                   ),
          
//                   SizedBox(height: 8.0),
          
//                   Text("$cat",
          
//                   style: TextStyle(
          
//                     color: MyColors.hint,fontSize: 12.0),
          
//                   ),
          
                
          
//                               SizedBox(height: 8.0),
          
          
          
//                 Row(
          
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          
          
//                   children: [
          
                  
          
//                   Text("$price",
          
//                   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),
          
//                   ),
          
//                   Row(
          
//                     children: [
          
//                     Image.asset("assests/graphics/common/Star.png",width: 20.0,),
          
//                     Text("$star",style: TextStyle(fontSize: 18.0),
          
//                     )
          
//                     ,
          
          
          
//                   ],
          
//                   )
          
          
          
          
          
//                 ],
          
//                 )
          
//                 ]
          
                
          
//                 ,
          
//               )
          
//                 ),
          
//           ],
          
//         ),),
//       ),
    
//     );
//   }
// }


class Product_Card extends StatelessWidget {
 
 
 final String img;
  final String title;
  final String cat;
  // final String price;
  // final String star;
    // final VoidCallback ontap;

  const Product_Card({
    super.key,
    // required this.ontap,
    required this.img,
    required this.title,
    required this.cat,
    // required this.price,
    // required this.star,
  });

  

  @override
  Widget build(BuildContext context) {
    return Padding(
    
      padding: const EdgeInsets.symmetric(horizontal:10.0),
    
      child: InkWell(
        // onTap: ontap,
        child: Container(
          
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
          
            Expanded(
          
              flex:5 ,
          
              child: Container(
          
                alignment: Alignment.topRight,
          
                width: double.infinity,
          
                child: IconButton(onPressed: (){}, icon: CircleAvatar(
          
                  backgroundColor: MyColors.bc,
          
                  child: Icon(Icons.favorite,color: Colors.white,))),
          
              decoration: BoxDecoration(
          
                borderRadius: BorderRadius.circular(24.0),
          
                color:Colors.purple ,
          
                image: DecorationImage(
          
                  fit: BoxFit.cover,
          
                  image: NetworkImage("$img"))),
          
              )),
          
            Expanded(
          
              flex: 2,
          
              child: Column(
          
                crossAxisAlignment: CrossAxisAlignment.start,
          
                mainAxisAlignment: MainAxisAlignment.start,
          
                children: [
          
                                            SizedBox(height: 4.0),
          
          
          
                  Text("$title",
          
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),
          
                  ),
          
                  SizedBox(height: 8.0),
          
                  Text("$cat",
          
                  style: TextStyle(
          
                    color: MyColors.hint,fontSize: 12.0),
          
                  ),
          
                
          
                              SizedBox(height: 8.0),
          
          
          
                // Row(
          
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                //   children: [
          
                //   Text("$price",
          
                //   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),
          
                //   ),
          
                //   Row(
          
                //     children: [
          
                //     Image.asset("assests/graphics/common/Star.png",width: 20.0,),
          
                //     Text("$star",style: TextStyle(fontSize: 18.0),
          
                //     )
          
                //     ,
          
          
          
                //   ],
          
                //   )
          
          
          
          
          
                // ],
          
                // )
          
                ]
          
                
          
                ,
          
              )
          
                ),
          
          ],
          
        ),),
      ),
    
    );
  }
}


class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return     SliverToBoxAdapter(
    
      child: Container(
    
          padding: const EdgeInsets.symmetric(vertical:24.0),
    
    
    
        height: 208.0,
    
        child:  Consumer<HomeFragProv>(
          builder:(context,homeFragProv,child){ 
            List icon=["assests/graphics/common/waist.png","assests/graphics/common/bg1.jpeg","assests/graphics/common/bg3.png","assests/graphics/common/bg2.png","assests/graphics/common/cat.png","assests/graphics/common/cat.png"];
           
          List bgicon=["assests/graphics/common/waist.png","assests/graphics/common/bg6.jpg","assests/graphics/common/bg7.jpg","assests/graphics/common/waist.png","assests/graphics/common/cat.png","assests/graphics/common/cat.png"];
List titles=["Ilma","Saima Hossain","Sazia Rahman","Farhan Hossain","Shupta Das","Lamia"];
            return homeFragProv.iscatloading?Center(child: CircularProgressIndicator(color: MyColors.bc,),): ListView.builder(
               
            
            scrollDirection: Axis.horizontal,
            
              itemCount: homeFragProv.categories.length,
            //inkwell diye tapable kora jai
              itemBuilder:(context,index)=>
                    InkWell(
                onTap: ()=>homeFragProv.changeprodcat(index),
                child: Categorytab(
                  ind: index,
                  bg:bgicon[index],
                  icon: icon[index]
                  // icon:"assests/graphics/common/cat.png"
                          
                // , title: homeFragProv.categories[index].toString().toUpperCase(),
                ,title: titles[index],
                          
                isselected:index==homeFragProv.selectedtabindex
                
                ),
              ) ,
            
          
          
          
            
          );},
        ),
    
      ),
    
    );
  }
}




class Categorytab extends StatelessWidget {
  final  icon;
  final String title;
  final bool isselected;
  final int ind;
  final bg;
  const Categorytab({
    super.key,required this.ind,required this.bg,required this.icon,required this.title, this.isselected=false
  });

  @override
  Widget build(BuildContext context) {
    if(ind==0){

      // return Icon(Icons.add);
return Padding(
  padding: const EdgeInsets.only(right:12.0),
  child:   Container(
  
    width: 100.0,
  
  decoration: BoxDecoration(
  
      borderRadius: BorderRadius.circular(12.0),
  
      color: Color.fromARGB(255, 237, 231, 231)
  
  
  
  ),
  
  //   decoration: BoxDecoration(
  
  // image: DecorationImage(    image: AssetImage(icon),
  
  // fit: BoxFit.cover
  
  // )  
  
  // ),
  
    child:   Stack(
  
    
  
      children: [
  
        Positioned(
  
          child: Container(
  
          width: 100.0,
  
          height: 100, decoration: BoxDecoration(
  
            borderRadius: BorderRadius.circular(12.0),
  
        
  
         image: DecorationImage(    image: AssetImage(icon),
  
       fit: BoxFit.cover)
  
           ),
  
        // child:  Image(image: AssetImage(icon),fit: BoxFit.cover),
  
        
  
        
  
        ),
  
        ),
  
    
  
    Positioned(
  
      top: 140.0,
  
      left: 10.0,
  
      child: Text("Create Story")),
  
  
  
    Positioned(
  
      top: 80.0,
  
      left: 24.0,
  
      child: CircleAvatar
  
      (
  
        
  
        child: Icon(Icons.add))),
  
    
  
      ],
  
    
  
    
  
    
  
    
  
    
  
    ),
  
  ),
);    }
     
    
    
    return Container(
    
  margin: const EdgeInsets.only(right: 12.0),
  padding: const EdgeInsets.symmetric(vertical:12.0,horizontal: 8.0),
  
  
      child: Column(
        children: [
CircleAvatar(
  backgroundImage:   AssetImage(icon ),
),          
          
          SizedBox(
            height: 60.0,
          ),
          Text("$title",style: TextStyle(color: isselected? Colors.white:Colors.white,fontWeight: FontWeight.bold),),
        ],
      ),
  
      decoration: BoxDecoration(color:isselected? MyColors.bc: Color.fromARGB(255, 199, 190, 190),
  borderRadius: BorderRadius.circular(12.0),
  image: DecorationImage(
                              image: AssetImage(bg),
                              fit: BoxFit.cover,
                            ),
      border: Border.all(color: MyColors.inp)),
  
    );
  }
}

class _Searchbox extends StatelessWidget {
  const _Searchbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return     SliverToBoxAdapter(child: Padding(
    
      padding: const EdgeInsets.only(top:5.0),
    
      child:   Row(
        children: [
          CircleAvatar(

            radius:20.0 ,

             backgroundImage: AssetImage("assests/graphics/common/waist.png"),
          ),
          SizedBox(width: 10.0,),
          MyBox(
  borderRadius: 20,
  onTap: () {
    print('Box tapped');
  },
),
          SizedBox(width: 10.0,),

Icon(Icons.image,color: Colors.green,),

        
        ],
      ),
    
    ),);
  }
}
