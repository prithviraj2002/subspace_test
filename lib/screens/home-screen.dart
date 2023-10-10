import 'package:flutter/material.dart';
import 'package:subspace_test/api/api_functions.dart';
import 'package:subspace_test/constants/strings.dart';
import 'package:subspace_test/data-model/Blog.dart';
import 'package:subspace_test/provider/blog_provider.dart';
import 'package:provider/provider.dart';
import 'package:subspace_test/screens/saved-screen.dart';
import 'package:subspace_test/ui-components/blog_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          AppStrings.blogTitle,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => const SavedScreen()));
          }, icon: const Icon(Icons.star, color: Colors.white,))
        ],
      ),
      body: FutureBuilder(
            future: getBlogs(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List<Blog> blogs = snapshot.data;
              if(blogs.isEmpty){
                return const Center(child: Text(AppStrings.error, style: TextStyle(color: Colors.white),),);
              }
              if (snapshot.hasData && blogs.isNotEmpty) {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: BlogTile(blog: blogs[index])
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: blogs.length);
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString(), style: const TextStyle(color: Colors.white, fontSize: 25),));
              } else {
                return const Center(child: CircularProgressIndicator(color: Colors.white,));
              }
            }));
  }
}

