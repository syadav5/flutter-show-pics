import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:pics/widgets/imageList.dart';
import 'dart:convert';
import 'models/ImageModel.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

// state class is responsible for providing list of widgets to be displayed on the screen
// as well as the data that gets displayed,
class AppState extends State<App> {
  var counter = 0;
  List<ImageModel> images = [];

// fetches the image over a network
// like kotlin marks the method as blocked, flutter does so using async
  void fetchImage() async {
    // json string response.
    counter++;
    // await in flutter is equal to async in coroutines.
    var jsonResponse =
        await get("https://jsonplaceholder.typicode.com/photos/$counter");
    //convert json string to json object
    var jsonObject = json.decode(jsonResponse.body);
    var imgModel = ImageModel.fromJson(jsonObject);
    // This is equivalent to recyclerview adapter.setAdapterChanged
    setState(() {
      images.add(imgModel);
    });
  }

  @override
  Widget build(context) {
    // Material app widget tree
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Let's see some pictures."),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("On pressed called...");
            fetchImage();
            setState(() {
              counter++;
            });
          },
        ),
        body: ImageList(this.images),
      ),
    );
  }
}
