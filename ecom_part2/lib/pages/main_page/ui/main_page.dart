import 'package:ecom_part2/core/constraints/assets_locations.dart';
import 'package:ecom_part2/core/constraints/colors.dart';
import 'package:ecom_part2/pages/main_page/provider/main_page_prov.dart';
import 'package:ecom_part2/pages/main_page/ui/fragments/cart_fragment.dart';
import 'package:ecom_part2/pages/main_page/ui/fragments/home_fragment.dart';
import 'package:ecom_part2/pages/main_page/ui/fragments/wish_fragment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainPageProv(),
      builder:(context,child)=> Scaffold(
    
        body: Consumer<MainPageProv>(
builder: (context, mainpagep, child) {
  if(mainpagep.getSelectedTabIndex()==0){
    return const HomeFragment();
  }
  if(mainpagep.getSelectedTabIndex()==1){
    return const CartFragment();
  }
  if(mainpagep.getSelectedTabIndex()==2){
    return const WishFarg();
  }
  return const Center(child: Text("no tab selected"),);


  
},

        ), 
        
    bottomNavigationBar: Consumer<MainPageProv>(
      builder:(context,mainpage,child)=> 
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Theme (
              data: Theme.of(context).copyWith(canvasColor:MyColors.primarycolor),
            
          
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            
            child: BottomNavigationBar
            (
              showSelectedLabels: false,
              showUnselectedLabels: false,
              //index ta tab item er index  ke indicate kortase
              onTap: (index) =>mainpage.setTab(index) ,
              currentIndex: mainpage.getSelectedTabIndex(),
              items: 
             [
            BottomNavigationBarItem(icon: 
            SizedBox(
              width: 24.0,
              height: 24.0,
              child: Image.asset(AssetLocations.Home_Icon)
              
              ),

            label: "HOME"),
            BottomNavigationBarItem(icon:  SizedBox(
              width: 24.0,
              height: 24.0,
              child: Image.asset(AssetLocations.Cart_Icon)
              
              ),
            label: "CART"),
            BottomNavigationBarItem(icon:  SizedBox(
              width: 24.0,
              height: 24.0,
              child: Image.asset(AssetLocations.Wish_Icon)
              
              ),
            label: "WISH"),
            
            
            ]
            ),
          ),
        ),
      ),
    ),
      ),
    );
    
  }
}