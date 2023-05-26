import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_testing_using_mocktail/home_screen.dart';
import 'package:widget_testing_using_mocktail/post_model.dart';

void main() {
  //formula GIVEN,WHEN,THEN//
  testWidgets(
      'GIVEN HomeScreen WHEN the ListView, ListTile and Text widgets are depends on the extarnal api for the data THEN generate our own smoke data is the easiest solution',
      (tester) async {
    //creating a smoke list of PostModel
    final smokePostList = [
      PostModel(id: 1, title: 'title1', body: 'body1'),
      PostModel(id: 2, title: 'title2', body: 'body2'),
    ];

    //creating a smoke future fetch method of somkePostList
    Future<List<PostModel>> fetchSmokePosts() =>
        Future.delayed(const Duration(seconds: 1), () => smokePostList);

    await tester.pumpWidget(MaterialApp(
        home: HomeScreen(
            postListFromApi:
                fetchSmokePosts()) //data came from the method of fetchSmokePosts//
        ));
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    //now it's needed the pumpAndSettle method for Future.delayed
    await tester.pumpAndSettle();
    //test the ListView
    expect(find.byType(ListView), findsOneWidget);
    //test all the ListTile on the screen. so findsNWidgets is needed
    expect(find.byType(ListTile), findsNWidgets(smokePostList.length));
    //now it is time to test all the elements of PostModel
    for (final smokePost in smokePostList) {
      expect(find.text(smokePost.id.toString()), findsOneWidget);
      expect(find.text(smokePost.title), findsOneWidget);
      expect(find.text(smokePost.body), findsOneWidget);
    }
  });
}
