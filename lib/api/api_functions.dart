import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:subspace_test/constants/strings.dart';
import 'package:subspace_test/data-model/Blog.dart';

Future<List<Blog>> getBlogs() async{

  List<Blog> blogs = [];

  try{
    final response = await http.get(Uri.parse(AppStrings.url), headers: {
      'x-hasura-admin-secret': AppStrings.adminSecret,
    });
    final data = jsonDecode(response.body);
    for(Map<String, dynamic> b in data['blogs']){
      blogs.add(Blog.fromJson(b));
    }
    return blogs;
  }catch (e){
    print('Error: $e');
    rethrow;
  }
}