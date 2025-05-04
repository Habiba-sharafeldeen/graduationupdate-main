import 'dart:convert';

import 'package:graduation/help/api.dart';
import 'package:graduation/models/GetProductInStore.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Getallproductservice {
  Future< List<Getproductinstore>>Getallproducts() async
   
   {
   List<dynamic> data=  await  Api().get(url:"http://ma7aliapigp.runasp.net/api/Store/GetProductsInStore/storeId");
   
  
  List<Getproductinstore> productList =[];
  for (int i =0 ;i<data.length;i++){
    productList.add(Getproductinstore.fromJson(data[i]),
    );
  }
  return productList;
   }
  
}

// http.Response response =
  // await http.get(Uri.parse("http://ma7aliapigp.runasp.net/api/Store/GetProductsInStore/storeId"));