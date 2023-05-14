import 'package:ecom_part2/pages/providers/wishprov.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/product_quan.dart';
import '../constraints/colors.dart';


class WishItem extends StatelessWidget {
  final ProductQuan productquan;
  const WishItem({
    super.key,required this.productquan
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const  BoxDecoration(
        border: Border(bottom: BorderSide(
          color: MyColors.primarycolor))
      ),
          margin:const EdgeInsets.symmetric(vertical: 10.0,horizontal: 18.0),
padding:const EdgeInsets.only(bottom: 18.0),
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
                fontSize: 14.sp,color: MyColors.primarycolor,
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
           Text("\$${productquan.product.price}",style: TextStyle(fontSize: 14.sp,color: MyColors.primarycolor,
              fontWeight: FontWeight.w700),
              ),
           
           
            ],
           ),
         ),
       ),
       
      Consumer<Wish_prov>(
        builder:(context,wish,child)=> InkWell(
          onTap: () => wish.removeProd(productquan.product),
          child:const Icon(Icons.delete),
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

