import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subspace_test/constants/strings.dart';
import 'package:subspace_test/data-model/Blog.dart';
import 'package:subspace_test/provider/blog_provider.dart';
import 'package:subspace_test/screens/blog-screen.dart';
import 'package:toast/toast.dart';

class BlogTile extends StatelessWidget {
  final Blog blog;

  const BlogTile({required this.blog, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => BlogScreen(blog: blog)));
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.black,
                title: const Text(AppStrings.saveArticle, style: TextStyle(color: Colors.white),),
                actions: [
                  TextButton(
                      onPressed: () {
                        Provider.of<BlogProvider>(context, listen: false)
                            .addToFavourites(blog);
                        Navigator.pop(context);
                      },
                      child: const Text(AppStrings.yes, style: TextStyle(color: Colors.white))),
                  TextButton(
                      onPressed: () {
                        if(Provider.of<BlogProvider>(context, listen: false).favBlogs.contains(blog)){
                          Provider.of<BlogProvider>(context, listen: false).removeFavourite(blog);
                        }
                        Navigator.pop(context);
                      },
                      child: const Text(AppStrings.no, style: TextStyle(color: Colors.white)))
                ],
              );
            });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.45,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(blog.imageUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.3),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
              child: Text(
                blog.title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
