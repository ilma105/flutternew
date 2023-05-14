import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stack/core/constraints/assets_locations.dart';
import 'package:stack/pages/fbpage.dart';
import 'package:stack/pages/main_page/providers/mainpageprovider.dart';
import 'package:stack/pages/main_page/ui/fragements/cart_frag.dart';
import 'package:stack/pages/main_page/ui/fragements/home_frag.dart';
import 'package:stack/pages/main_page/ui/fragements/wish_frag.dart';

import '../../../core/constraints/my_colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
create: (context) => MainPaegProvider(),
      builder:(context,child)=> Scaffold(
        body: Consumer<MainPaegProvider>(builder:(context,mainPaegProvider,child){
if(mainPaegProvider.getselectedtab()==0){
  return  FacebookNavigationBar();
}
if(mainPaegProvider.getselectedtab()==1){
  return const CartFrag();        
       
        }
        if(mainPaegProvider.getselectedtab()==2){
          return const WishFarg();
        }
        return const  Center(child: Text("no tab selected"),);
        }),
      bottomNavigationBar: Consumer<MainPaegProvider>(
        builder:(context,mainpageprovider,child)=>
         Padding(
           padding: const EdgeInsets.all(12.0),
           child: Theme(
            data: Theme.of(context).copyWith(canvasColor:MyColors.bc),
         
             child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
               child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: mainpageprovider.getselectedtab(),
                onTap: (index) => mainpageprovider.settab(index),
                items:  [
                BottomNavigationBarItem(icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Image.asset(AssetLoc.home_icon)
                  ),
                  label: "Home"
                  ),
                      BottomNavigationBarItem(icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Image.asset(AssetLoc.cart_icon)
                  ),label: "Cart"),
                BottomNavigationBarItem(icon:SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Image.asset(AssetLoc.wish_icon)
                  ),label: "Wish"),
                
                     ]),
             ),
           ),
         ),
      ) ,
      ),
    );
  }
}