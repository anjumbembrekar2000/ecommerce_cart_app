import 'package:ecommerce_machine_task/screens/product_list.dart';
import 'package:ecommerce_machine_task/screens/splash_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  // product_controller controller = Get.find();
  // product_controller controller = Get.put(product_controller());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const product_list_ui(),
    );
  }
}


