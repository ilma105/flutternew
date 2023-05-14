// ignore_for_file: non_constant_identifier_names

import 'package:ecom_part2/core/constraints/colors.dart';
import 'package:ecom_part2/pages/providers/cart_prov.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/product_quan.dart';

class CartProductItem extends StatelessWidget {
  final ProductQuan productQuan;
  const CartProductItem({
    super.key,required this.productQuan
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    
      margin: const EdgeInsets.all(18.0),
    
            padding: const EdgeInsets.only(bottom:18.0),
    
    
    
    width: double.infinity,
    
    height: 150.0,
    
    decoration:const  BoxDecoration(
    
      border: Border(bottom: BorderSide(color: MyColors.primarycolor))
    
    ),
    
    child: Row(
    
      children: [
    
    Expanded(
    
      flex: 1,
    
      child:   Container(
    
      
    
    height: 140.0,
    
      
    
    width: 100.0,
    
      
    
    decoration:BoxDecoration(
    
      
    
      borderRadius: BorderRadius.circular(14.r),
    
      
    
      image: DecorationImage(
    
      
    
    
      
    
      image: NetworkImage(productQuan.product.image ??"https://picsum.photos/id/237/200/300"))
    
      
    
      
    
      
    
    ) ,
    
      
    
    ),
    
    ),
    
      
    
     Expanded(
    
      flex:2,
    
       child: Padding(
    
    padding: const EdgeInsets.all(8.0),
    
    child:   Column(
    
    crossAxisAlignment: CrossAxisAlignment.start,
    
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
      children: [
    
    
    
        Padding(
    
          padding: const EdgeInsets.only(top:8.0),
    
          child: Text( productQuan.product.title ??"no title",style: TextStyle(
    
          
    
            fontSize: 12.sp,
    
          
    
            color: MyColors.primarycolor,
    
          
    
            fontWeight: FontWeight.w700
    
          
    
          ),),
    
        ),
    
        Text(productQuan.product.category??"no category",style: TextStyle(
    
    
    
          fontSize: 8.sp,
    
    
    
          color: MyColors.secondarycolor,
    
    
    
          fontWeight: FontWeight.w700
    
    
    
        ),),
    
     Text( "\$${productQuan.product.price}",style: TextStyle(
    
    
    
          fontSize: 12.sp,
    
    
    
          color: MyColors.primarycolor,
    
    
    
          fontWeight: FontWeight.w700
    
    
    
        ),
    
        ),
    
    
    
      ],
    
    
    
    ),
    
     ),
    
     ),
    
    Expanded(
    
      flex: 1,
    
      child: Row(children: [
    
    
    
    Expanded(child: InkWell(
    onTap: ()=>Provider.of<Cart_prov>(context,listen: false).addProd(productQuan.product),
      child: Container(
    
        decoration: 
    
        BoxDecoration(
    
          color: MyColors.primarycolor,
    
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r),bottomLeft: Radius.circular(8.r)),
    
          
    
        ),
    
        child:const  Icon(Icons.add,color: Colors.white,),
    
      ),
    
    )),
    
      
    
    
    
    
    
    Expanded(child: Container(
    
      alignment: Alignment.center,
    
      height: 24.0,
    
      decoration: 
    
     const BoxDecoration(
    
    color: MyColors.primarycolor,
    
    
    
      ),
    
    child: Consumer<Cart_prov>(
      builder:(context,cart_prov,child)=> Text(productQuan.quantity.toString(),style:TextStyle(
      
        color: Colors.white,
      
        fontSize: 14.sp,
      
        fontWeight: FontWeight.w700
      
      ),),
    ),)
    
    ),
    
      
    
    
    
    Expanded(child: InkWell(
        onTap: ()=>Provider.of<Cart_prov>(context,listen: false).removeProd(productQuan.product),

      child: Container(
    
        decoration: 
    
        BoxDecoration(
    
          color: MyColors.primarycolor,
    
                    borderRadius: BorderRadius.only(topRight: Radius.circular(8.r),bottomRight: Radius.circular(8.r)),
    
    
    
        ),
    
        child: const Icon(Icons.remove,color: Colors.white,),
    
      ),
    
    ))
    
      ]
    
      ),
    
    ),
    
      ],
    
    ),
    
    
    
    );
  }
}

