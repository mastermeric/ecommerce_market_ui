class ProductResponseModel {

  // Response Modelimizin amacı  API den dönen objeleri temsil etmektir.. 
  // Model yaratmamızın amacı kod okunaiblir  olsun ve bakım yapılabilir olsun.
  
  // ORNEK data response :
  //   {
  //   "userId": 1,
  //   "id": 1,
  //   "title": "delectus aut autem",
  //   "completed": false
  // },

  
  int? userId;
  int? id;
  String? title;
  String? body;

  ProductResponseModel({
      this.userId,
      this.id,
      this.title,
      this.body,});

  ProductResponseModel.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }
}