
import 'package:intl/intl.dart';

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


  int? prid;
  String? prname;
  String? prdesc ;
  String? prprice ;
  String? prdiscount ;
  DateTime? prupdatedate;
  String? primage ;
  String? imageData;


  ProductResponseModel({
        this.prid,
        this.prname,
        this.prdesc,
        this.prprice,
        this.prdiscount,
        this.prupdatedate,
        this.primage,
        this.imageData,      
      });

  //final formatter = DateFormat('yyyy-MM-dd hh:mm');


  ProductResponseModel.fromJson(dynamic json) {
	  prid = json['prid'];
    prname = json['prname'];
    prdesc = json['prdesc'];
    prprice = json['prprice'];
    prdiscount = json['prdiscount'];
	  prupdatedate = DateTime.parse(json['prupdatedate']);
    primage = json['primage'];
    imageData = json['imageData'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    
    map['prid'] = prid;
    map['prname'] = prname;
    map['prdesc'] = prdesc;
    map['prprice'] = prprice;
    map['prdiscount'] = prdiscount;
    map['prupdatedate'] = prupdatedate.toString();
    map['primage'] = primage;
    map['imageData'] = imageData;
    
    return map;
  }

  /*
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
*/

}