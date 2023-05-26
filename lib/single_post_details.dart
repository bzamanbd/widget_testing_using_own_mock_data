import 'package:flutter/material.dart';
import 'package:widget_testing_using_ownmock_data/post_model.dart';

class SinglePostDetails extends StatelessWidget {
  final PostModel post;
  const SinglePostDetails({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details of Post ${post.id}'),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    post.body,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
