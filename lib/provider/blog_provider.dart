import 'package:flutter/material.dart';
import 'package:subspace_test/api/api_functions.dart';
import 'package:subspace_test/data-model/Blog.dart';

class BlogProvider extends ChangeNotifier{
  List<Blog> favBlogs = [];

  void addToFavourites(Blog blog){
    favBlogs.add(blog);
    notifyListeners();
  }

  void removeFavourite(Blog blog){
    favBlogs.remove(blog);
    notifyListeners();
  }
}
