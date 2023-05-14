import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stack/core/constraints/my_colors.dart';
import 'package:stack/models/product_model.dart';
import 'package:stack/providers/cart_prov.dart';

import '../../core/widgets/circlebutton.dart';
import '../../providers/wish_prov.dart';

class DetailsPage extends StatelessWidget {
 final ProductModel product;
  const DetailsPage({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _Header(img:product.image??"https://picsum.photos/200",product:product),
              _tTtle(title: product.title??"no title",product:product),
              Container(margin: EdgeInsets.symmetric(horizontal: 24),
              child: Text(product.description??"no description",
              
              style: TextStyle(fontSize: 14.sp,color: MyColors.hint),
              ),
              )
        
            ],
          ),
        ),
     
     floatingActionButton:  Padding(
       padding: const EdgeInsets.only(left:32.0),
       child: SizedBox(
            width: double.infinity,
            height: 56.h,
            child: 
            ElevatedButton(onPressed: ()async{
//toast dekhabe
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text ("Product Added")));
              //button e jehetu update korte chachi na tai listen:false
              Provider.of<Cart_prov>(context,listen: false).addProd(product);
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.bc,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.r)
              )
            ),
             child:   Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                Image.asset("assests/graphics/common/shop.png",width: 32.0,),
                SizedBox(width: 12.0,),
                 Text("Add to Cart | \$${product.price}",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),),
                               
                               SizedBox(width:
                               12.0),
                               Text("\$${product.price}",
            style: TextStyle(fontSize: 10.sp,decoration: TextDecoration.lineThrough),),

              
               ],
             )),
     
          ),
    
    
     ),
   
      ),
    );
  }
}

class _tTtle extends StatelessWidget {
  final String title;
  ProductModel product;
   _tTtle({
    super.key,required this.title,required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:24.0),
      child: Row(
    
    
        children: [
    Expanded(
      child:Text(title,style: TextStyle(
        fontSize: 24.h,fontWeight: FontWeight.w500
      ),) 
    
    
    ),
    
        Expanded(
          
        child: Consumer<Cart_prov>(
          builder:(context,cart_prov,child)=> Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            InkWell(
              onTap: () => cart_prov.removeProd(product),
              child: CircleButton(icon:  Icon(Icons.remove,color: MyColors.hint,))), 
        
        
        Text(cart_prov.countprod(product).toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),),
        
           InkWell(
            onTap: () => cart_prov.addProd(product),
            child: CircleButton(icon: Icon(Icons.add,color: MyColors.bc,)))
        
            
            ],),
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
          margin: EdgeInsets.symmetric(vertical:18.0,horizontal: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
        image: DecorationImage(image: NetworkImage(img),
        
        fit:BoxFit.cover ),
          ),
          width: double.infinity,
          height: 400.0,
          
        ),
    Padding(
      padding:  const EdgeInsets.symmetric(vertical:38.0,horizontal: 44.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap:()=> context.pop(),
              child: CircleButton(icon: CircleAvatar(radius: 20,
              backgroundColor: Colors.white,
              child: Image.asset(
              
                "assests/graphics/common/arr.png",width:14.0 ,),
                ),),
            ),
            CircleAvatar(radius: 20,
            backgroundColor: Colors.white,
         child: Consumer<Wish_prov>(

          builder:(context,wish_prov,child)=>  InkWell(
            onTap: ()=>wish_prov.addProd(product),
            child: Image.asset("assests/graphics/common/love.png",width: 18.0,)
            ),
         ),
         
            ),
          ],
        ),
    )
      
      ],
    );
  }
}