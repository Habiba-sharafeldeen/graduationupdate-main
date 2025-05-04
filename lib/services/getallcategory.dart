import 'dart:convert';

import 'package:graduation/help/api.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AllCategoryService{
  Future <List<dynamic>>GetAllCategories()async{
     Response response = await  Api().get(url:"http://ma7aliapigp.runasp.net/api/Store/GetCategoriesInStore/storeId");
  List<dynamic> data =jsonDecode(response.body);
 
 return data;

    
  }
 
}

 // http.Response response =
  // await http.get(Uri.parse("http://ma7aliapigp.runasp.net/api/Store/GetCategoriesInStore/storeId"));
  // if(response.statusCode==200){
