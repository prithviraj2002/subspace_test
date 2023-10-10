import 'package:flutter/material.dart';

import '../data-model/Blog.dart';

class BlogScreen extends StatelessWidget{
  final Blog blog;
  const BlogScreen({required this.blog, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                expandedHeight: 250.0,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Image.network(
                      blog.imageUrl,
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    thickness: 2,
                    color: Colors.red,
                  ),
                  Text(blog.title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
                  const Divider(
                    thickness: 2,
                    color: Colors.red,
                  ),
                  Text(blog.title, style: const TextStyle(fontSize: 22, color: Colors.white),),
                  Text(blog.id, style: const TextStyle(fontSize: 22, color: Colors.white),),
                ],
              ),
            ),
          ),
        )
    );
  }
}
