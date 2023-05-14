// ignore_for_file: avoid_print

import 'package:ecom_part2/core/constraints/colors.dart';
import 'package:ecom_part2/pages/main_page/provider/home_frag_prov.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../datasources/token_data.dart';
import '../../../../router/route_manager.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
    String? username;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
        loadUsername();

  }
  Future<void> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('name');
    });
  }
  @override
  Widget build(BuildContext context) {
return ChangeNotifierProvider(
  create: (context)=>HomeFragProv(),
  child:
    SafeArea(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 24.0),
    
    
    
    child: CustomScrollView(
    
      slivers: [
    
        SliverToBoxAdapter(child: Row(
    
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
          children: [
    
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
                       const CircleAvatar(backgroundImage: AssetImage("img/waist.png") ,),
const SizedBox(width: 10.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text("Hello",style: TextStyle(fontSize: 14.sp),),
                    Text(username??"no",style: TextStyle(fontSize: 14.sp),),

          ],
        ),
     

      ],
    ),
 
 
    
            ElevatedButton(onPressed: ()async{
    
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    
       
    
       TokenDataSource tokenDataSource=TokenDataSource(sharedPreferences);
    
      if(await  tokenDataSource.delete()){
    
    print("logged out");
    
    
    
      }
    
      else{
    
        print("logged out failed");
    
      }
    
       // ignore: use_build_context_synchronously
    
       // ignore: use_build_context_synchronously
       context.goNamed(Routenames.LOGIN);
    
    
    
     }, child:const Text("LogOut"))
    
    ],)
    
        ),
    
      const _SearchBox(),
    
      const CategoriesTab(),
    
      SliverToBoxAdapter(
    
        child: Consumer<HomeFragProv>(
          
          builder:(context,homeprov,child)=>homeprov.isloading?const Center(child: CircularProgressIndicator(),):
           GridView.builder(
            
            physics: const NeverScrollableScrollPhysics(),
            
            itemCount: homeprov.products.length,
            
            shrinkWrap: true,
            
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            
              crossAxisCount:2,
            
              crossAxisSpacing: 12.0,
            
              mainAxisSpacing: 12.0,
            
              childAspectRatio: 3/9,
            
              
            
               ), 
            
            itemBuilder:(context,index)=>
            
             ProductCart(
              onTap:(){
                print("home");
context.goNamed(Routenames.details,extra: homeprov.products[index]);
              },

            title:(homeprov.products[index].title!.length>20?"${homeprov.products[index].title!.substring(0,20)}......":homeprov.products[index].title) ??"no title",
            
            cat:
            homeprov.products[index].category??"no category",
            
            price:
                        "\$${homeprov.products[index].price}",

            
            star:
                        homeprov.products[index].rating?.rate.toString()??"5",

            
            
            image:homeprov.products[index].image??

            "https://picsum.photos/id/237/200/300",
            
             )
            
            ),
        ),
    
      )
    
      
    
      ]
    
      ,
    
    ),
    
    )
    
    ),
  
);

  }
}

class ProductCart extends StatelessWidget {
  final String title,cat,price,star,image;
  final VoidCallback? onTap;
  const ProductCart({
    super.key,
    required this.title,
        required this.price,
            required this.star,
                required this.cat,
                                required this.image,
                                required this.onTap





  });

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return InkWell(
      onTap: onTap,
      // ignore: avoid_unnecessary_containers
      child: Container(
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Expanded(
           flex: 5,
           child: Container(
             alignment: Alignment.topRight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24.0),
               image: DecorationImage(
                 fit: BoxFit.contain,
                 image: NetworkImage(
    image               ),
    )
    
    ),
             child: IconButton(onPressed: (){}, 
             icon: const CircleAvatar(
               backgroundColor: MyColors.primarycolor,
               child: Icon(Icons.favorite,color: Colors.white,))
             
             ),              
             )
         
         ),
                   Expanded(
                     flex: 2,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                                const   SizedBox(height: 4.0,),
    
                         Text(title,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,),),
               const    SizedBox(height: 12.0,),
         Text(cat,style: const TextStyle(color: MyColors.secondarycolor,fontSize: 12.0,),),
    
           const        SizedBox(height: 12.0,),
    
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(price,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,),),
      Row(
      children: [
        Image.asset("img/Star.png",width: 28.0,),
        Text(star,style:const TextStyle(fontSize: 18.0),)
      ],
      )
    
      ],
    )
                   
                       ],
                     )
                     )
                     
    
       ],
      ),
      ),
    );
  }
}

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> icons=[
      "img/cat.png",
      "img/elec.png",
      "img/jwel.jpg",
      "img/men.png",
      "img/dress.png"

    ];
    
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        height: 100.0,
        child: Consumer<HomeFragProv>(
          builder:(context,homeprov,child)=>homeprov.iscatloading?const Center(child: CircularProgressIndicator(color: MyColors.primarycolor,),):
           ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeprov.categories.length,
            itemBuilder:(context,index)=>
            
            InkWell(
              onTap: ()=>homeprov.changeProducCat(index),
              child: CategoryTab(icon: icons[index],
              isselected:index==homeprov.selectedTabIndex
                
              , title: homeprov.categories[index].toString().toUpperCase()),
            )
            ),
        ),
      ) ,
    
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String icon;
  final String title;
  final bool isselected;
  const CategoryTab({
    super.key,required this.icon,this.isselected=false,required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: const EdgeInsetsDirectional.symmetric(vertical: 12.0,horizontal: 10.0),
     margin: const EdgeInsets.only(right: 12.0),
     decoration: BoxDecoration(
       color:isselected?MyColors.primarycolor: Colors.white,

       borderRadius: BorderRadius.circular(12.0),
       border: Border.all(
         color: MyColors.inputBg
       )
     ),
     child: Row(
       children: [
         Image.asset(icon,width: 22.0,color: isselected?Colors.white:MyColors.primarycolor, ),

const SizedBox(width: 8),   
       Text(title,style: TextStyle(color: isselected? Colors.white:MyColors.primarycolor),),
       ],
     ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top:24.0),
        child: TextField(
          
      decoration: InputDecoration(
        hintText: "Search Products",
        hintStyle:const  TextStyle(
          color: MyColors.secondarycolor,
        ),
        prefixIcon:   Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("img/search.png",width: 5.w,),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide:const  BorderSide(color: MyColors.primarycolor),
          borderRadius: BorderRadius.circular(15.r)
        ),
        border: OutlineInputBorder(
        borderRadius:BorderRadius.circular(15.r),
        )
      ),
      
        ),
      ),
    );
  }
}