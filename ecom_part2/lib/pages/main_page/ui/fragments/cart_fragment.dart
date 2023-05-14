// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:ecom_part2/core/widgets/circle_button.dart';
import 'package:ecom_part2/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/constraints/colors.dart';
import '../../../../core/widgets/cart_product_item.dart';
import '../../../providers/cart_prov.dart';

class CartFragment extends StatelessWidget {
  const CartFragment({super.key});

  @override
  Widget build(BuildContext context) {
return CustomScrollView(
  slivers: [
const _headet(),
const _ProductsSection(),
 _BillingSection()
  ],
);


  }
}

class _BillingSection extends StatelessWidget {
   _BillingSection({
    // ignore: unused_element
    super.key,
  });
// ignore: prefer_final_fields
TextEditingController _cardnumtext=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
     child: 
     Padding(
       padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 12.0),
       child: Column
       
       
       (
         
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         Text("Checkout",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700,color: MyColors.primarycolor),),
            TextField(
                  controller: _cardnumtext,

           
               decoration: InputDecoration(
                 hintText: "cart number",
                 fillColor: MyColors.inputBg,
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
                   Text("Total(${card_prov.totalitem}) Items",style:const TextStyle(color: MyColors.primarycolor),),
                   Text("\$${card_prov.totalprice}",style: TextStyle(
                     fontSize: 14.sp,fontWeight: FontWeight.w700,color: MyColors.primarycolor),),
              
                       
                 ],
                ),
              ),
            ),
        
          Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
               const  Text("Shipping Fee",style: TextStyle(color: MyColors.primarycolor),),
                 Text("\$40",style: TextStyle(
                   fontSize: 14.sp,fontWeight: FontWeight.w700,color: MyColors.primarycolor),),

            
               ],
              ),
            ),
          
          const Divider(),
           Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
             const    Text("Sub Total",style: TextStyle(color: MyColors.primarycolor),),
                 Consumer<Cart_prov>(
                   builder:(context,cart,child)=> Text("\$${cart.totalprice+40}",style: TextStyle(
                     fontSize: 14.sp,fontWeight: FontWeight.w700,color: MyColors.primarycolor),),
                 ),

            
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

     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("payment failed")));
     
     }
     else{
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("payment successful")));
context.goNamed(Routenames.Main_PAGE);
     }
                },
               style: ElevatedButton.styleFrom(
                 backgroundColor: MyColors.primarycolor,
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
       
                   
     
       ]),
     ),
     
);
  }
}

class _ProductsSection extends StatelessWidget {
  const _ProductsSection({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return     SliverToBoxAdapter(
    
      child: Consumer<Cart_prov>(
        // ignore: prefer_is_empty
        builder:(context,cartprov,child)=>cartprov.items.length==0?
       const Center(child: Text("no products in cart"))
        : ListView.builder(
          
          shrinkWrap: true,
          
          itemCount: cartprov.items.length,
          physics:const NeverScrollableScrollPhysics() ,
          itemBuilder:(context,index)=> CartProductItem(productQuan:cartprov.items[index])
          
        ),
      ),
    
    );
  }
}



// ignore: camel_case_types
class _headet extends StatelessWidget {
  const _headet({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return     SliverPadding(
    
      padding: const EdgeInsets.symmetric(horizontal:18.0),
    
      sliver:   SliverAppBar(
    
      
    
        backgroundColor: Colors.transparent,
    
      
    
        leading:InkWell(
    
      
    
                  onTap: ()=>context.pop(),
    
      
    
                   child: CircleButton(icon:CircleAvatar(radius: 15.0,
    
      
    
                          backgroundColor: Colors.white,
    
      
    
                          child: Image.asset("img/arr.png",width: 10.0,),
    
      
    
                          
    
      
    
                   ), ),
    
      
    
                 ),
    
      
    
           
    
    actions: [
    
      Column(
    
                  mainAxisAlignment: MainAxisAlignment.center,
    
                  children: [
    
                    Text("Checkout",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700,color: MyColors.primarycolor),),
    
                 
    
                 
    
                  ],
    
                )
    
    ],
    
      ),
    
    );
  }
}