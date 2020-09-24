class ImageModel {
  var id;

  var title;

  var url;

  ImageModel(this.id, this.title, this.url);
  // it is just like static object in java or kotlin
  ImageModel.fromJson(jsonObject) {
    this.id = jsonObject["id"];
    this.title = jsonObject["title"];
    this.url = jsonObject["url"];
  }
}
