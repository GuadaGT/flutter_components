import 'dart:convert';
import 'package:flutter_components/Utils/app_config.dart';
import 'package:flutter_components/src/models/blog.dart';
import 'package:http/http.dart';


class BlogProvider{
  final String url = API().baseUrl;


  Future<List<Blog>> fetchBlogs() async{
    Response res = await get (Uri.parse(url+"/posts"));

    if(res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);
      List<Blog> blogs = body.map((e) =>
      Blog.fromJson(e)
      ).toList();
      return blogs;
    }
      else
      {
        throw Exception('Not found');
      }
    }

    Future<Blog> fetchBlog() async{
      Response res = await get(Uri.parse(url+"/posts/1"));

      if(res.statusCode == 200){
        return Blog. fromJson(jsonDecode(res.body));
      }
      else{
        throw Exception('Fallo');
      }
    }
  }
