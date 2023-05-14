import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stack/models/product_model.dart';
import 'package:stack/models/productquan.dart';
import 'package:stack/providers/cart_prov.dart';

import '../constraints/my_colors.dart';

class CartItem extends StatelessWidget {
  final ProductQuan productquan;
  const CartItem({
    super.key,required this.productquan
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const  BoxDecoration(
        border: Border(bottom: BorderSide(
          color: MyColors.bc))
      ),
          margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 18.0),
padding: EdgeInsets.only(bottom: 18.0),
      child: Row(
        children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 80.0,
          width: 80.0,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          image: DecorationImage(
          fit: BoxFit.cover,
          
          image: NetworkImage(productquan.product.image?? "https://picsum.photos/200"))),
          
          ),
        ),
       
       
       Expanded(
        flex: 2,
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal:18.0),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productquan.product.title??"no title",style: TextStyle(
                fontSize: 14.sp,color: MyColors.bc,
              fontWeight: FontWeight.w700),
              ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical:8.0),
             child: Text(productquan.product.category??"no category",style: TextStyle(
              fontSize: 10.sp,
             color: MyColors.hint,
                fontWeight: FontWeight.w700),
                ),
           ),
           Text("\$${productquan.product.price}",style: TextStyle(fontSize: 14.sp,color: MyColors.bc,
              fontWeight: FontWeight.w700),
              ),
           
           
            ],
           ),
         ),
       ),
       
       Expanded(
        flex: 1,
        child: Row(
          children: [
            Expanded(child: InkWell(
              onTap:()=> Provider.of<Cart_prov>(context,listen: false).addProd(productquan.product),
              child: Container(decoration: BoxDecoration(
                color: MyColors.bc,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r),bottomLeft: Radius.circular(8.r))
              ),
              child: Icon(Icons.add,color: Colors.white,),
              ),
            )
            
            ), 
            
            Expanded(child:Container(
              alignment: Alignment.center,
              height: 24.0,
              decoration: BoxDecoration(
                color: MyColors.bc,
                
              ),
              child: Consumer<Cart_prov>(builder:(context,cartprov,child)=>
               Text(productquan.quantity.toString(),style: TextStyle(color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.w700 ),)),
              ),),
            Expanded(child: InkWell(
                            onTap:()=> Provider.of<Cart_prov>(context,listen: false).removeProd(productquan.product),

              child: Container(decoration: BoxDecoration(
                color: MyColors.bc,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(8.r),bottomRight: Radius.circular(8.r))

              ),
              child: Icon(Icons.remove,color: Colors.white,),
              ),
            )
            
            )
          ],
        ),
       )
       
        // Expanded(child: Container(color: Color.fromARGB(255, 76, 101, 175),)
        // ),
        // Expanded(child: Container(color: Color.fromARGB(255, 175, 76, 92),)
        // ),  
        ],
      ),
      );
  }
}

