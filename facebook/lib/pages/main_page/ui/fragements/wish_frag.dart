import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stack/core/widgets/wishprod.dart';
import 'package:stack/providers/wish_prov.dart';

import '../../../../core/constraints/my_colors.dart';
import '../../../../core/widgets/Cart._product.dart';
import '../../../../core/widgets/circlebutton.dart';
import '../../../../providers/cart_prov.dart';

class WishFarg extends StatelessWidget {
  const WishFarg({super.key});

  @override
  Widget build(BuildContext context) {
 return CustomScrollView(
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
                
                  "assests/graphics/common/arr.png",width:14.0 ,),
                  ),
                  ),
              ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("WisList",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700,color: MyColors.bc),),
             
             
              ],
            )
          ],    
      
      ),
    );
  }
}

