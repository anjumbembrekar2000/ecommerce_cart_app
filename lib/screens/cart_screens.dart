import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';

class cart_screen extends StatefulWidget {
  const cart_screen({Key? key}) : super(key: key);

  @override
  State<cart_screen> createState() => _cart_screenState();
}

class _cart_screenState extends State<cart_screen> {
  product_controller controller = Get.put(product_controller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Obx(()=>

            ListView.builder(
                itemCount: controller.cart_list.length,
                itemBuilder: (context,index){
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CachedNetworkImage(
                                width: 70,
                                height: 65,
                                imageUrl:controller.cart_list[index].image_url ),
                          ),
                          SizedBox(width: 4,),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [
                                Text(controller.cart_list[index].name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                Text("₹${controller.cart_list[index].price}",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.w500),),


                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(onPressed: (){

                              controller.cart_list.removeAt(index);

                            }, icon: Icon(Icons.delete_outlined)),
                          )


                        ],
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
