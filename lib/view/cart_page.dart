import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart' as FI;
import 'package:get/get.dart';
import 'package:shopping/controller/cart_controller.dart';
import 'package:shopping/controller/home_controller.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatelessWidget {
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: wItemList(context),
      ),
    );
  }

  // @override
  // Widget buildd(BuildContext context) {
  //   return Scaffold(
  //     floatingActionButton: FloatingActionButton(
  //       // isExtended: true,
  //       child: Icon(Icons.add),
  //       backgroundColor: Colors.green,
  //     ),
  //   //);
  //   );
  // }

  Widget wItemList(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Obx(() => controller.items.length == 0
            ? Center(
                child: Text("Giỏ Hàng Rỗng"),
              )
            : ListView.builder(
                itemCount: controller.items.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xFFFFFFFF),
                              const Color(0xB0E7E9E7),
                            ],
                            begin: Alignment(0.2, 0.0),
                            end: Alignment(1.0, 0.0),
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Image.network(
                          controller.items[index].image,
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
                              Text(controller.items[index].title),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.items[index].price.toString() +
                                        " \$",
                                    style: TextStyle(
                                        fontSize: 12.0.sp,
                                        color: Color(0xff465bd8),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: Color(0xff465bd8),
                                    onPressed: () {
                                      controller
                                          .deleteItem(controller.items[index]);
                                    },
                                    child: Icon(
                                      FI.AntDesign.delete,
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
                  );
                })
        ),
        const SizedBox(
          height: 20,
        ),
        FloatingActionButton.extended(
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          onPressed: () {
            _showSimpleModalDialog(context);
            // Respond to button press
          },
          icon: Icon(Icons.shopping_cart_rounded),
          label: Text('Mua Hàng'),
        ),
      ],
    );
  }
}
_showSimpleModalDialog(context){
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(20.0)),
          child: Container(
            constraints: BoxConstraints(maxHeight: 200),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "       Xác nhận mua hàng",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black,
                            wordSpacing: 1
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                FloatingActionButton.extended(
                  backgroundColor: const Color(0xff03dac6),
                  foregroundColor: Colors.black,
                  onPressed: () {
                    //_showSimpleModalDialog(context);
                    // Respond to button press
                    },
                  //icon: Icon(Icons.shopping_cart_rounded),
                  label: Text('Yes'),
                  ),
                FloatingActionButton.extended(
                  backgroundColor: const Color(0xff03dac6),
                  foregroundColor: Colors.black,
                  onPressed: () {
                    CartPage();
                    // Respond to button press
                  },
                //icon: Icon(Icons.shopping_cart_rounded),
                 label: Text('No'),
                 )
                ],
              ),
            ),
          ),
        );
      });
}