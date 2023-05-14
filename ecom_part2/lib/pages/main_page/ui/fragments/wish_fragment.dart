// ignore_for_file: unused_element, prefer_const_constructors, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/constraints/colors.dart';
import '../../../../core/widgets/circle_button.dart';
import '../../../../core/widgets/wishprod.dart';
import '../../../providers/wishprov.dart';


class WishFarg extends StatelessWidget {
  const WishFarg({super.key});

  @override
  Widget build(BuildContext context) {
 return const CustomScrollView(
  slivers: [
    _header(),
_ProductItem(),
  ],
 );
    
 
   }
   

}
class _ProductItem extends StatelessWidget {
  const _ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return     SliverToBoxAdapter(
    
      child: Consumer<Wish_prov>(
        builder:(context,wishprov,child)=>wishprov.items.length ==0? Center(child: Text("no products in cart")): ListView.builder(
          physics:const NeverScrollableScrollPhysics(),
          itemCount: wishprov.items.length,
          
          shrinkWrap: true,
          
          itemBuilder: (context,index)=> WishItem(productquan:wishprov.items[index])
          
            
          
            ),
      ),
    
    );
  }
}



// ignore: camel_case_types
class _header extends StatelessWidget {
  const _header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      sliver: SliverAppBar(
        backgroundColor: Colors.transparent,
      leading: InkWell(
                onTap:()=> context.pop(),
                child: CircleButton(icon: CircleAvatar(radius: 20,
                backgroundColor: Colors.white,
                child: Image.asset(
                
                  "img/arr.png",width:14.0 ,),
                  ),
                  ),
              ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("WisList",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700,color: MyColors.primarycolor),),
             
             
              ],
            )
          ],    
      
      ),
    );
  }
}

