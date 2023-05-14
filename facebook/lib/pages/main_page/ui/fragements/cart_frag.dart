import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stack/core/constraints/my_colors.dart';
import 'package:stack/providers/cart_prov.dart';
import 'package:stack/router/route_manager.dart';

import '../../../../core/widgets/Cart._product.dart';
import '../../../../core/widgets/circlebutton.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class CartFrag extends StatelessWidget {
  const CartFrag({super.key});

  @override
  Widget build(BuildContext context) {
 return CustomScrollView(
  slivers: [
    _header(),
_ProductItem(),
  _Billingsection()
  ],
 )
    ;
 
 

  }
}

class _Billingsection extends StatelessWidget {
   _Billingsection({
    super.key,
  });
TextEditingController _cardnumtext=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
    Text("Checkout",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700,color: MyColors.bc),),
      
       TextField(
               controller: _cardnumtext,

        
            decoration: InputDecoration(
              hintText: "cart number",
              fillColor: MyColors.inp,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 26.0, horizontal: 18.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Colors.transparent, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
          ),
         
         Padding(
           padding: const EdgeInsets.symmetric(vertical:8.0),
           child: Consumer<Cart_prov>(
             builder:(context,card_prov,child)=> Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Toatal(${card_prov.totalitem}) Items",style: TextStyle(color: MyColors.bc),),
                Text("\$${card_prov.totalprice}",style: TextStyle(
                  fontSize: 14.sp,fontWeight: FontWeight.w700,color: MyColors.bc),),
           
                    
              ],
             ),
           ),
         ),
      
       
       
       
       Padding(
           padding: const EdgeInsets.symmetric(vertical:8.0),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shipping Fee",style: TextStyle(color: MyColors.bc),),
              Text("\$40",style: TextStyle(
                fontSize: 14.sp,fontWeight: FontWeight.w700,color: MyColors.bc),),

         
            ],
           ),
         ),
       
       Divider(),
        Padding(
           padding: const EdgeInsets.symmetric(vertical:8.0),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sub Total",style: TextStyle(color: MyColors.bc),),
              Text("\$130",style: TextStyle(
                fontSize: 14.sp,fontWeight: FontWeight.w700,color: MyColors.bc),),

         
            ],
           ),
         ),
                    
                 SizedBox(
            width: double.infinity,
            height: 56.h,
            child: 
            ElevatedButton(
             onPressed: () {
bool sec=Provider.of<Cart_prov>(context,listen: false).paynow(_cardnumtext.text);
if(!sec){

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("payment failed")));
  
  }
  else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("payment successful")));
context.goNamed(Routenames.main_page);
  }
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
                 Text("Pay Now",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),),
                               
                               
              
               ],
             )),
     
          ),
    
                    
                     ],
      ),
    ),
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
    
      child: Consumer<Cart_prov>(
        builder:(context,cartprov,child)=>cartprov.items.length ==0? Center(child: Text("no products in cart")): ListView.builder(
          physics:const NeverScrollableScrollPhysics(),
          itemCount: cartprov.items.length,
          
          shrinkWrap: true,
          
          itemBuilder: (context,index)=> CartItem(productquan:cartprov.items[index])
          
            
          
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
                Text("Checkout",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700,color: MyColors.bc),),
             
             
              ],
            )
          ],    
      
      ),
    );
  }
}


