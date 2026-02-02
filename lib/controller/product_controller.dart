import 'package:get/get.dart';

import '../product_model/product_model.dart';

class product_controller extends GetxController{
  RxList<product_model> list=<product_model>[].obs;
  RxList<product_model> cart_list=<product_model>[].obs;
  Future<void> fetchList() async{


    list.add(product_model(id: "1", name:"Bag", price: "500",image_url: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png", ));
    list.add(product_model(id: "2", name:"T-Shirt", price: "550",image_url: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png", ));
    list.add(product_model(id: "3", name:"Jacket", price: "550",image_url: "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png",));
    list.add(product_model(id: "4", name:"Hand Ring", price: "1500",image_url: "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_t.png",));


  }

  Future<void> addToCart(product_model item,int Cart_count) async {

    // for(int i = 0 ; i< cart_list.length ; i++){
    //   if(cart_list[i].id == item.id){
    //
    //   }
    // }
    cart_list.add(product_model(id: item.id, name: item.name, price: item.price, image_url: item.image_url,isAdded: true,cart_count:Cart_count , ));


    print("cart_list.length==>${cart_list.length.toString()}");
  }

  Future<bool> checkAlredyAdd(String id) async{
    bool added = false;
    for(int i = 0; i<cart_list.length; i++){
      if(cart_list[i].id == id){
        added = true;

      }else{
        added = false;
      }

    }
    return added;

  }

}