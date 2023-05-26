# Widget Testing with our own Smoke Data

Here we will try to test all the widgets which are depend on external data source (api)

## Getting Started

It's possible to create our own smoke data source which helps us to test all the widgets like ListView, ListTile, Text which are really depends on the api for the data.


### Important Note:-

It is very important to remember that when we need a 'Network-Call' we should call throw constractor because it will help us when we start widget testing using our own smoke data.
