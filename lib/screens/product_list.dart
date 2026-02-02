import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../controller/product_controller.dart';
import 'cart_screens.dart';

class product_list_ui extends StatefulWidget {
  const product_list_ui({Key? key}) : super(key: key);

  @override
  State<product_list_ui> createState() => _product_list_uiState();
}

class _product_list_uiState extends State<product_list_ui> {
  product_controller controller = Get.put(product_controller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>cart_screen()));
          }, icon: Icon(Icons.shopping_cart_outlined))
        ],

      ),
      body: Column(
        children: [

          Expanded(
            child: Obx(()=>
              GridView.builder(gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                childAspectRatio: 0.9
              ),
                  itemCount: controller.list.length,
                  itemBuilder: (context,index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                            imageUrl:controller.list[index].image_url ),
                        Text(controller.list[index].name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        Text("₹${controller.list[index].price}",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.w500),),
                        SizedBox(height: 10,),
                        Center(
                          child: controller.list[index].isAdded==true?
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey.shade300
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            controller.list[index].cart_count = controller.list[index].cart_count==null?
                                            1:controller.list[index].cart_count!+1;
                                          });
                                        },
                                          child: Icon(Icons.add)),
                                      SizedBox(width: 20,),
                                      Text(controller.list[index].cart_count.toString()),
                                      SizedBox(width: 20,),


                                      GestureDetector(
                                        onTap: (){
                                          setState(() {

                                            if(controller.list[index].cart_count!<0){
                                              setState(() {
                                                controller.list[index].isAdded = false;
                                              });
                                            }
                                            controller.list[index].cart_count = controller.list[index].cart_count==null?
                                            1:controller.list[index].cart_count!-1;
                                          });
                                        },
                                          child:   Icon(Icons.remove)),
                                    ],
                                  ),
                                ),
                              ):
                          OutlinedButton(onPressed: (){
                            setState(() {
                              controller.list[index].isAdded = true;
                              controller.list[index].cart_count = controller.list[index].cart_count==null?
                                  1:controller.list[index].cart_count!+1;
                            });
                            controller.addToCart(controller.list[index],controller.list[index].cart_count!);

                          }, child:

                          Text("Add To Cart")),
                        )

                      ],
                    ),
                  ),
                );
              }),
            ),
          )

        ],
      ),
    );
  }
}
