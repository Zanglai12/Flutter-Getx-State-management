import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shopping/model/item_model.dart';

class CartController extends GetxController {

  var items = List<ItemModel>.empty().obs;

  @override
  void onInit() {
    getItems();
    super.onInit();
  }

  addToCart(ItemModel itemModel) async{
    items.add(itemModel);
    var box = await Hive.openBox("cart");
    box.put("cart_items", items.toList());
    Get.showSnackbar(
      GetBar(
        title: "Thêm vào giỏ hàng ",
        message: "THÀNH CÔNG",
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future getItems() async {
    Box box;
    try {
      box = Hive.box('cart');
    } catch (error) {
      box = await Hive.openBox('cart');
      print(error);
    }
    var items = box.get('cart_items');
    if (items != null) this.items.value = items;
  }

  Future<List<ItemModel>> getListItems() async {
    Box box;
    try {
      box = Hive.box('cart');
    } catch (error) {
      box = await Hive.openBox('cart');
      print(error);
    }
    var items = box.get('cart_items');
    return items as List<ItemModel>;
  }

  clearTodos() {
    try {
      Hive.deleteBoxFromDisk('cart_items');
    } catch (error) {
      print(error);
    }
    items.value = [];
  }

  deleteItem(ItemModel item) async {
    items.remove(item);
    var box = await Hive.openBox('cart');
    box.put('cart_items', items.toList());
  }
}