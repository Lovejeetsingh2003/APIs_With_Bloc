import 'dart:convert';
import 'dart:io';
import 'package:api_with_bloc/model/api_data_model.dart';
import 'package:http/http.dart' as http;

class ApiRepository{
  
  Future<List<ApiDataModel>> fetchApiData() async{
    try{
      final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1/comments'));
    if(response.statusCode == 200){
      final body = json.decode(response.body)as List;
      return body.map((e){
        return ApiDataModel(
          postId: e['postId'] as int,
          name: e['name'] as String,
          email: e['email'] as String,
          body: e['body']as String,
        );
      }).toList();
    }
    } on SocketException{
      throw Exception('Error while fetching data.');

    }
    throw Exception('Error while fetching data.');

  }

}