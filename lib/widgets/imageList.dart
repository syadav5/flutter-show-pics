import 'package:flutter/material.dart';
import '../models/ImageModel.dart';

class ImageList extends StatelessWidget {
  // variable declaration method is exactly similar to java
// Need to mark final since statelessWidget ensures that the state remains constant and if something
// changes over the time, then we consider converting Stateless widget into Stateful widget.

  final List<ImageModel> images;

  // Constructor declaration is similar to Java
  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    // return list of images
    return ListView.builder(
        itemCount: this.images.length,
        itemBuilder: (context, index) {
          return buildImageWidget(index);
                  });
  }
          
Widget buildImageWidget(index) {
return Container(
          margin: EdgeInsets.all(20.0) ,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber,
      
            )
          ),
          child: Column(
            children: <Widget>[
              Image.network(this.images[index].url),
              Padding(padding: EdgeInsets.only(top:5.0),
              child:  Text(this.images[index].title))
             
            ],
          ));
          }
}
