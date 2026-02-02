import 'dart:async';

import 'package:ecommerce_machine_task/screens/product_list.dart';
import 'package:flutter/material.dart';

class splash_screens extends StatefulWidget {
  const splash_screens({Key? key}) : super(key: key);

  @override
  State<splash_screens> createState() => _splash_screensState();
}

class _splash_screensState extends State<splash_screens> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   redirect();
  }

  redirect(){

    Navigator.push(context, MaterialPageRoute(builder: (_)=>product_list_ui()));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(child: Image.asset("assets/app_logo.png",height: 50,width: 50,)),
    );
  }
}
