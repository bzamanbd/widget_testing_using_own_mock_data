import 'package:flutter/material.dart';
import 'package:widget_testing_using_mocktail/post_model.dart';
import 'package:widget_testing_using_mocktail/single_post_details.dart';

class HomeScreen extends StatelessWidget {
  final Future<List<PostModel>> postListFromApi;
  const HomeScreen({Key? key, required this.postListFromApi}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Posts'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: postListFromApi,
        builder: (_, snapshort) {
          if (snapshort.hasData) {
            final posts = snapshort.data;
            return Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ListView.builder(
                itemBuilder: (_, index) {
                  final post = posts[index];
                  return Padding(
                    padding: const EdgeInsets.all(18.0).copyWith(top: 0),
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        leading: Text(
                          post.id.toString(),
                          style: Theme.of(_).textTheme.titleMedium,
                        ),
                        title: Text(post.title,
                            style: Theme.of(_).textTheme.titleMedium),
                        subtitle: Text(
                          post.body,
                          style: Theme.of(_).textTheme.bodyMedium,
                        ),
                        onTap: () => Navigator.push(
                            _,
                            MaterialPageRoute(
                              builder: (_) => SinglePostDetails(post: post),
                            )),
                      ),
                    ),
                  );
                },
                itemCount: posts!.length,
              ),
            );
          } else if (snapshort.hasError) {
            return const Center(
              child: Card(
                elevation: 5,
                child: Text('some error occurred'),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
