import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subspace_test/constants/strings.dart';
import 'package:subspace_test/provider/blog_provider.dart';
import 'package:subspace_test/ui-components/blog_tile.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          AppStrings.savedBlogs,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<BlogProvider>(builder:
          (BuildContext context, BlogProvider blogProvider, Widget? child) {
        return blogProvider.favBlogs.isNotEmpty
            ? ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: BlogTile(blog: blogProvider.favBlogs[index])
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: blogProvider.favBlogs.length)
            : const Center(
          child: Text(
            AppStrings.noBlogsSavedYet,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        );
      }),
    );
  }
}
