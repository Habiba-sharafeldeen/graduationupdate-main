import 'dart:convert';

import 'package:graduation/help/api.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AllCategoryService{
  Future <List<dynamic>>GetAllCategories()async{
     Response response = await  Api().get(url:"http://ma7aliapigp.runasp.net/api/StoreProduct/GetCategories");
  List<dynamic> data =jsonDecode(response.body);
 
 return data;

    
  }
 
}