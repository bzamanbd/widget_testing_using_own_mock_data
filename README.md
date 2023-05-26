# Widget Testing with our own Smoke Data

Here we will try to test all the widgets which are depend on external data source (api)

## Getting Started

It's possible to create our own smoke data source which helps us to test all the widgets like ListView, ListTile, Text which are really depends on the api for the data.


### Important Note:-

It is very important to remember that when we need a 'Network-Call' we should call throw constructor because it will help us when we start widget testing using our own smoke data. This project a 'Network-Call' is needed in HomeScreen to fetch the data from external api for our ListView and  ListTiles to display them in UI.

![home](https://github.com/bzamanbd/widget_testing_using_own_mock_data/assets/90719674/750eaf8c-1a0a-4bcb-a04a-e405057e5771)

### Now step by step
For testing all the widgets in HomeScreen...

Step 1: In 'test' directory create a test file named home_screen_test.dart

Step 2: Create main function of our app here again

Step 3: In the main function call testWidgets method which is provided by the default flutter dev_dependencies called 'flutter_test'.

Step 4: Create our own smoke list of PostModel named smokePostList

Step 5: Create a smoke future fetch method named fetchSmokePosts with Future.delayed() to wait and fetch the data of smokePostList

Step 6: Now it is time to pump the homeScreen to simulate of rendering UI and use fetchSmokePosts method to inject the  data of smokePostList throw the constructor which we create before in HomeScreen.

Step 7: Now we can test all the widgets which are not depend on 'Network-Call'

Step 8: Use 'pumpAndSettle' method and then start the testing for those widgets which are really depend on 'Network-Call' because it's needed to wait until it is settled.

that's all 

thanks to all of you my loving Flutter Devs.
happy coding......

![output](https://github.com/bzamanbd/widget_testing_using_own_mock_data/assets/90719674/0720c1ee-2a53-487c-888f-f8af43070559)





