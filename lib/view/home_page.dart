import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:shopping/controller/cart_controller.dart';
import 'package:shopping/controller/home_controller.dart';
import 'package:shopping/view/product_page.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  final CartController cc = Get.find<CartController>();
  //bool searching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shop zanglai!",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.fetchItems();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Wrap(
            runSpacing: 20,
            children: [wSearch(context), wCategories(), wItemList(context)],
          ),
        ),
      ),
    );
  }

  Widget wSearch(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xffBBDEFB), borderRadius: BorderRadius.circular(20)),
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffE3F2FD)),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 13, left: 18, bottom: 13, right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "Tìm kiếm",
                  //   style: TextStyle(
                  //       color: Color(0xff465bd8),
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 12.0.sp),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                   // alignment: Alignment.center,
                    width: double.infinity,
                    //height: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(34)),
                    //width: double.infinity,
                     child:
                    //ListTile(
                       TextField(
                        //controller: controller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Tìm kiếm",
                          //helperText: 'Helper Text',
                          //counterText: '0 characters',
                          //border: OutlineInputBorder(),
                          border: InputBorder.none,
                        ),
                        //onChanged: onSearchTextChanged,
                      ),
                    //   //trailing: IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                    //     //controller.clear();
                    //     //onSearchTextChanged('');
                    //   ),
                    // )
                    // Center(
                    //   child: TextField(
                    //     decoration: InputDecoration(
                    //       hintText: "tìm kiếm",
                    //     ),
                    //     onChanged: (text){
                    //       text = text.toLowerCase();
                    //       if(text.length > 0){
                    //         searching = true;}
                    //       //controller.itemItems[index].title.forEach(controller.itemItems[index].title)
                    //     //   return Obx(() => controller.loading.value
                    //     //       ? Center(
                    //     //     child: CircularProgressIndicator(),
                    //     //   )
                    //     //   : controller.itemItems[index].title
                    //      },
                    //   )
                    //   // Row(
                    //   //   children: [
                    //   //     Icon(
                    //   //       Feather.search,
                    //   //       color: Color(0xff757575),
                    //   //     ),
                    //   //     SizedBox(
                    //   //       width: 10,
                    //   //     ),
                    //   //     Text(
                    //   //       "Tìm kiếm",
                    //   //       style: TextStyle(color: Color(0xff757575)),
                    //   //     )
                    //   //   ],
                    //   // ),
                    // ),

                //],
                     ),
                  //)
                ]
              )
            )
          ],
        ),
      ),
    );
  }

  // Widget wcCategories(BuildContext context) {
  //   return Row(
  //     children: [
  //       ElevatedButton(
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: Colors.blueGrey,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(20), // <-- Radius
  //           ),
  //           padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
  //         ),
  //         onPressed: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => Homepage2()),
  //           );
  //         },
  //         child: Icon(Icons.grid_on),
  //       ),
  //       ElevatedButton(
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: Colors.blueGrey,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(20), // <-- Radius
  //           ),
  //           padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
  //         ),
  //         onPressed: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => HomePage()),
  //           );
  //         },
  //         child: Icon(Icons.list_sharp),
  //       ),
  //
  //     ],
  //   );
  // }

  Widget wCategories() {
    return Obx(() => SizedBox(
          height: 30.0.sp,
          child: ListView.builder(
              itemCount: controller.categoryItems.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xffe57373), width: 0.4),
                        borderRadius: BorderRadius.circular(30)),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black38),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                        ),
                           onPressed: () => {},
                        child: Text(
                              controller.categoryItems[index].toString(),
                              style: TextStyle(
                                  fontSize: 10.0.sp, //color: Color(0xff616161)),
                            ),
                      )
                    // child: Center(
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 15),
                    //     child: ElevatedButton(
                    //            onPressed: () => {},
                    //             child: Text(
                    //               controller.categoryItems[index].toString(),
                    //               style: TextStyle(
                    //                   fontSize: 10.0.sp, //color: Color(0xff616161)),
                    //             ),
                    //       )
                    //     // child: Column(
                    //     //   children: [
                    //     //     ElevatedButton(
                    //     //      onPressed: () => {},
                    //     //       child: Text(
                    //     //         controller.categoryItems[index].toString(),
                    //     //         style: TextStyle(
                    //     //             fontSize: 10.0.sp, color: Color(0xff616161)),
                    //     //       ),
                    //     // )
                    //     //   ],
                    //     // )
                    //
                    //     )
                    //     // Text(
                    //     //   controller.categoryItems[index].toString(),
                    //     //   style: TextStyle(
                    //     //       fontSize: 10.0.sp, color: Color(0xff616161)),
                    //     // ),
                    //   ),
                    // ),
                  ),
                  //onTap: () {},
                  )
                );
              }),
        ));
  }



  Widget wItemList(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() => controller.loading.value
        ? Center(
            child: CircularProgressIndicator(),
          )
        :
  ListView.builder(
            itemCount: controller.itemItems.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            const Color(0xFFB3E5FC),
                            const Color(0xB0E7E9E7),
                          ],
                          begin: Alignment(0.2, 0.0),
                          end: Alignment(1.0, 0.0),
                          tileMode: TileMode.clamp),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Image.network(
                        controller.itemItems[index].image,
                        width: size.width / 4,
                        height: size.width / 4,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.itemItems[index].title),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.itemItems[index].price.toString() +
                                      " \$",
                                  style: TextStyle(
                                      fontSize: 15.0.sp,
                                      color: Color(0xff465bd8),
                                      fontWeight: FontWeight.bold),
                                ),
                                FloatingActionButton(
                                  backgroundColor: Color(0xff465bd8),
                                  onPressed: () {
                                    cc.addToCart(controller.itemItems[index]);
                                  },
                                  child: Icon(
                                    Foundation.shopping_cart,
                                    size: 20,
                                  ),
                                  mini: true,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  heroTag: null,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Get.to(()=>ProductPage(), arguments: [index]);
                },
              );
            }));
  }
}
