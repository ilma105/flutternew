
// ignore_for_file: unused_element, camel_case_types, must_be_immutable

import 'package:ecom_part2/core/constraints/colors.dart';
import 'package:ecom_part2/models/product_model.dart';
import 'package:ecom_part2/pages/providers/wishprov.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_prov.dart';

class DetailsPage extends StatelessWidget {
  final ProductModel product;
  const DetailsPage({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
return SafeArea(
  child:   Scaffold( 
  floatingActionButton:
  Padding(
    padding: const EdgeInsets.only(left:32.0),
    child: SizedBox(
        width: double.infinity,
        height: 46.h,
  
        child: ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text ("Product Added")));
              Provider.of<Cart_prov>(context,listen: false).addProd(product);


     },
        style: ElevatedButton.styleFrom(
          
          backgroundColor: MyColors.primarycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.r),
          ),
        
        ), 
        //spinner dekhanor jonno Consumer use korchi
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("img/shop.png",width: 32.0,),
          const  SizedBox(width: 12.0,),
            Text("Add To Cart| \$${product.price}",style: 
              TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),
              ),
             
           const  SizedBox(width: 12.0,),
              Text("\$199.0",
            style: TextStyle(fontSize: 10.sp,decoration: TextDecoration.lineThrough)

              )
          ],
        ),
           
        ),
      ),
  )
    
    ,
    body:
  
     SingleChildScrollView(
       child: Column(
       
         children: [
       
           _Header(img:product.image??"https://picsum.photos/id/237/200/300",product:product),
           _title(title:product.title??"no title",product:product ,),
           Container(
            margin: const EdgeInsets.all(24.0),
            child: Text(product.description??"no des",style: TextStyle(fontSize: 16.sp,color: MyColors.primarycolor),),
           )
       
         ],
       
       ),
     )
  
   ,),
);
 }
}

class _title extends StatelessWidget {
  final String title;
  final ProductModel product;
  const _title({
    super.key,required this.title,required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:24.0),
      child: Row(
       children: [
         Expanded(child: Text(title,style: TextStyle(fontSize:24.sp,fontWeight: FontWeight.w500 ),)),
      Expanded(child: 
      Consumer<Cart_prov>(
        builder:(context,cart,child)=> Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
      
         children: [
           InkWell(
            onTap:()=>cart.removeProd(product) ,
             child: Container(
               height: 48.0,
               width: 48.0,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(50.0),
                   border: Border.all(color: MyColors.bordercolor)
                 
                 ),   
                 
                 child:const Icon(Icons.remove,color: MyColors.secondarycolor,),           ),
           ),
          Text(cart.countprod(product).toString(),style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
      
           
                     InkWell(
                      onTap:()=> cart.addProd(product),
                       child: Container(
                                  height: 48.0,
                                  width: 48.0,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(50.0),
                             border: Border.all(color: MyColors.bordercolor)
                           
                           ),   
                           
                           child:const Icon(Icons.add,color: MyColors.primarycolor,),           ),
                     ),
          
      
           
         ],
      
      
        ),
      )
      
    
    
      )
      
      
       ],
      ),
    );
  }
}

class _Header extends StatelessWidget {

final String img;
ProductModel product;
   _Header({
    super.key,required this.img,required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
         margin: const EdgeInsets.all(16.0),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(24.0),
           image: DecorationImage(
             image: 
           NetworkImage(img)
           )
         ),
  
  
         width: double.infinity,
  
         height: 300.0,
  
         ),
     Padding(
         padding: const EdgeInsets.all(26.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           InkWell(
            onTap: ()=>context.pop(),
             child: CircleAvatar(radius: 15.0,
                    backgroundColor: Colors.white,
                    child: Image.asset("img/arr.png",width: 10.0,),
                    
             ),
           ),
     
           CircleAvatar(radius: 15.0,
                         backgroundColor: Colors.white,
         child: Consumer<Wish_prov>(
          
          builder:(context,wish,child)=> InkWell(
            
            onTap:()=> wish.addProd(product),
            child: Image.asset("img/love.png",width: 15.0,))),

           
           ),
     
         ],
       ),
     )
     
      ],
    );
  }
}