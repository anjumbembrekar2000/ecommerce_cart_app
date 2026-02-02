class product_model{

  final String id;
  final String name;
  final String price;
  final String image_url;
   bool? isAdded;
   int? cart_count;

  product_model({
    required this.id,
    required this.name,
    required this.price,
    required this.image_url,
     this.isAdded,
     this.cart_count,

});

}

