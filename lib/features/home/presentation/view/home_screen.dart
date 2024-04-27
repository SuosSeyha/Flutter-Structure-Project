import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_build_structure_project/constant/app_color.dart';
import 'package:flutter_build_structure_project/constant/app_style.dart';
import 'package:flutter_build_structure_project/features/home/presentation/controller/all_products_controller.dart';
import 'package:flutter_build_structure_project/features/setting/presentation/view/setting_screen.dart';
import 'package:flutter_build_structure_project/helper/global_context.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  List<String> imageUrl = [
    'https://img.freepik.com/free-psd/flat-design-discount-banner-template_23-2149397070.jpg?w=1380&t=st=1707464266~exp=1707464866~hmac=fd9384e663099fa57d6fd1f901efb376b7236b02717f85969f350023ec297ed5',
    'https://img.freepik.com/free-psd/modern-sales-banner-template_23-2148995448.jpg?w=1380&t=st=1707464307~exp=1707464907~hmac=baa4c6d07a902737433f5e00f663306ec88014980531b09108be03b29f516dcf',
    'https://img.freepik.com/free-psd/summer-season-banner-template_23-2149170770.jpg?w=1380&t=st=1707464323~exp=1707464923~hmac=e47e4b2e22ec277776059a4061ef932481e93aac3014a84f636c85dfc1eb5e77',
    'https://img.freepik.com/free-vector/home-page-with-fashion-sale-theme_23-2148584361.jpg?w=1380&t=st=1707464338~exp=1707464938~hmac=75a90c7c53a8c0f75894b4b280afbc8a1520fa55841781e76623ed484aede487',
    'https://img.freepik.com/free-vector/hand-drawn-shopping-center-facebook-cover_23-2149325220.jpg?w=1380&t=st=1707464352~exp=1707464952~hmac=fccf35dc14f3ebc09f5cb8bd4a525a278c9a79e55737686332b87b4d3fd8a34a',
    'https://img.freepik.com/free-psd/landing-page-template-cyber-monday-with-woman-items_23-2148752947.jpg?w=1380&t=st=1707464370~exp=1707464970~hmac=35e1aa245126156fed32bf9dd99bc500877e82a1dae5ced796f3d71169d5d28e',
  ];
  int _currentPage=0;
  void startAutoScroll() {
    // Set up a timer to automatically scroll to the next page every 3 seconds
    Timer.periodic(const Duration(seconds: 6), (timer) {
      if (_currentPage < 5) {
        // Assuming you have 3 pages (adjust the condition accordingly)
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(seconds: 1),
          curve: Curves.linear,
        );
      } else {
        // Reset to the first page if we're at the last page
        _currentPage = 0;
        _pageController.jumpToPage(0);
      }
    });
  }
  @override
  void initState() {
    startAutoScroll();
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  BuildContext? globalContext = GlobalContext.getContext();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        AllProductsController allProductsController = AllProductsController();
        allProductsController.init();
        return allProductsController;
      },
      child: Consumer<AllProductsController>(
        builder: (context, controller, child) {
            return  Scaffold(
            //  backgroundColor: Colors.black,
            appBar: AppBar(
              title:  const Text('HOME ME'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return  const SettingScreen();
                    },));
                  }, 
                  icon: const Icon(Icons.settings)
                )
              ],
            ),
            body: SizedBox(
              height: double.infinity,
              child: ListView(
                children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5
                  ),
                  margin: const EdgeInsets.all(8),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.pink
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ZoomTapAnimation(
                          onLongTap: () {
                            
                          },
                        child: const Icon(Icons.filter_list,size: 30,color: Colors.white,))),
                        Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                          left: 20
                        ),
                        width: 290,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28)
                        ),
                         child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Search products...',
                            hintStyle: TextStyle(
                              
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                       ),
                       Expanded(
                        child: ZoomTapAnimation(
                          onLongTap: () {
                            
                          },
                        child: const Icon(Icons.search,size: 30,color: Colors.white))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    itemCount: imageUrl.length,
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        height: 300,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pink,
                        // image:  DecorationImage(image: NetworkImage(imageUrl[index].toString(),),fit: BoxFit.cover)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                          progressIndicatorBuilder: (context, url, progress) => Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                            ),
                          ),
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          imageUrl: imageUrl[index].toString(),
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/images/image_not_available.png',
                            height: 300,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          ),
                        ),
                      );
                    },),
                ),
                const SizedBox(height: 20,),
                Center(
                  child: SmoothPageIndicator(  
                    controller: _pageController,  // PageController  
                    count:  imageUrl.length,  
                    effect: const SlideEffect(  
                      spacing:  8.0,  
                      radius:  4.0,  
                      dotWidth:  40.0,  
                      dotHeight:  10.0,  
                      paintStyle:  PaintingStyle.stroke,  
                      strokeWidth:  1.5,  
                      dotColor:  Colors.grey,  
                      activeDotColor:  Colors.pink),  
                    onDotClicked: (index){       
                    }  
                  ),
                ), 
                const SizedBox(height: 20,),
                GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.65,
                    children: List.generate(controller.listAllProducts.length, (index){
                      var data = controller.listAllProducts[index];
                      return  ZoomTapAnimation(
                        onTap: () {
                          
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                            bottom: 2,
                          ),
                          margin: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                           color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, -1),
                                blurRadius: 1,
                                color: Colors.grey
                              ),
                              BoxShadow(
                                offset: Offset(-0.3, 0),
                                blurRadius: 1,
                                color: Colors.grey
                              ),
                            ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 180,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                 // color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                  ),
                                  child: CachedNetworkImage( 
                                    progressIndicatorBuilder: (context, url, progress) => Center(
                                      child: CircularProgressIndicator(
                                        value: progress.progress,
                                      ),
                                    ),
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                    imageUrl: data.image.toString(),
                                    errorWidget: (context, url, error) => Image.asset(
                                      'assets/images/image_not_available.png',
                                      height: 150,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppColor.textColor,
                                          fontSize: AppStyle.fontSize,
                                          fontWeight: AppStyle.bold
                                        ),
                                      ),
                                     Text(
                                        '${data.price.toString()}\$',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppColor.textColor,
                                          fontSize: AppStyle.fontSize,
                                          fontWeight: AppStyle.bold
                                        ),
                                      ),
                                      Text(
                                        data.description.toString(),
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: TextStyle(
                                          color: AppColor.textColor,
                                          fontSize: 12,
                                        ),
                                      ), 
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  )
              ],
              ),
            ),
          );
        },),
    );
   
  }
}