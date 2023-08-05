import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Admin/model/cartModel.dart';
import 'package:trip/Admin/model/categoryModel.dart';
import 'package:trip/Admin/model/coutermodel.dart';
import 'package:trip/Admin/model/deliveryModel.dart';
import 'package:trip/Admin/model/godowModel.dart';
import 'package:trip/Admin/model/offermodel.dart';
import 'package:trip/Admin/model/ordermodel.dart';
import 'package:trip/Admin/model/paymentModel.dart';
import 'package:trip/Admin/model/placeorderModel.dart';
import 'package:trip/Admin/model/productmodel.dart';
import 'package:trip/Admin/model/salesModel.dart';
import 'package:trip/Admin/model/usermodel.dart';
import 'package:trip/Api/api.dart';

class ApiService {
  late SharedPreferences prefs;
  late int user_id;

  Future<List<UserModel>> fetchuser() async {
    var response = await Api().getData('/register/view-users');
      if (response.statusCode == 200) {
        var items = json.decode(response.body);
        print((items));

      List<UserModel> products = List<UserModel>.from(
          items['data'].map((e) => UserModel.fromJson(e)).toList());
      return products;
    } else {
      List<UserModel> products = [];
      return products;
    }
  }
  Future<List<UserModel>> fetchuserap() async {
    var response = await Api().getData('/register/view-usersaproov');
      if (response.statusCode == 200) {
        var items = json.decode(response.body);
        print((items));

      List<UserModel> products = List<UserModel>.from(
          items['data'].map((e) => UserModel.fromJson(e)).toList());
      return products;
    } else {
      List<UserModel> products = [];
      return products;
    }
  }

  Future<List<couterModel>> fetchtcounter() async {
    var response = await Api().getData('/register/view-counter');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<couterModel> products = List<couterModel>.from(
          items['data'].map((e) => couterModel.fromJson(e)).toList());
      return products;
    } else {
      List<couterModel> products = [];
      return products;
    }
  }Future<List<couterModel>> fetchtcounterap() async {
    var response = await Api().getData('/register/view-counteraproov');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<couterModel> products = List<couterModel>.from(
          items['data'].map((e) => couterModel.fromJson(e)).toList());
      return products;
    } else {
      List<couterModel> products = [];
      return products;
    }
  }

  Future<List<godowModel>> fetchgodown() async {
    var response = await Api().getData('/register/view-godown');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<godowModel> products = List<godowModel>.from(
          items['data'].map((e) => godowModel.fromJson(e)).toList());
      return products;
    } else {
      List<godowModel> products = [];
      return products;
    }
  }
  Future<List<godowModel>> fetchgodownap() async {
    var response = await Api().getData('/register/view-godownaproov');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);

      print((items));
      List<godowModel> products = List<godowModel>.from(
          items['data'].map((e) => godowModel.fromJson(e)).toList());
      return products;
    } else {
      List<godowModel> products = [];
      return products;
    }
  }


  Future<List<deliveryModel>> fetchdelivery() async {
    var response = await Api().getData('/register/view-delivery');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<deliveryModel> products = List<deliveryModel>.from(
          items['data'].map((e) => deliveryModel.fromJson(e)).toList());
      return products;
    } else {
      List<deliveryModel> products = [];
      return products;
    }
  }
  Future<List<deliveryModel>> fetchdeliveryap() async {
    var response = await Api().getData('/register/view-deliveryap');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<deliveryModel> products = List<deliveryModel>.from(
          items['data'].map((e) => deliveryModel.fromJson(e)).toList());
      return products;
    } else {
      List<deliveryModel> products = [];
      return products;
    }
  }
  Future<List<productModel>> fetchproduct() async {
    var response = await Api().getData('/product/view-product');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<productModel> products = List<productModel>.from(
          items['data'].map((e) => productModel.fromJson(e)).toList());
      return products;
    } else {
      List<productModel> products = [];
      return products;
    }
  }
  Future<productModel> fetchsingleprdt(String barcode) async {


    var response = await Api().getData('/product/view-single-product/${barcode}');

    if (response.statusCode == 200) {
      var item = await json.decode(response.body);

       var singleItem = item['data'];



       var products =   productModel.fromJson(item['data']);

       return products;
    } else {

      throw  'Something Went Wrong';
    }
  }
  Future<List<CartModel>> fetchcart(String userid) async {
    var response = await Api().getData('/cart/'+userid);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<CartModel> products = List<CartModel>.from(
          items['data'].map((e) => CartModel.fromJson(e)).toList());
      return products;
    } else {
      List<CartModel> products = [];
      return products;
    }
  }

  Future<List<paymentModel>> fetchpayment() async {
    var response = await Api().getData('/paymet/view');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);


      List<paymentModel> products = List<paymentModel>.from(
          items['data'].map((e) => paymentModel.fromJson(e)).toList());
      return products;
    } else {
      List<paymentModel> products = [];
      return products;
    }
  }
  Future<List<categoryModel>> fetchcategory() async {
    var response = await Api().getData('/category/view-category');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<categoryModel> products = List<categoryModel>.from(
          items['data'].map((e) => categoryModel.fromJson(e)).toList());
      return products;
    } else {
      List<categoryModel> products = [];
      return products;
    }
  }
  Future<List<offerModel>> fetchoffer() async {
    var response = await Api().getData('/offer/vis');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<offerModel> products = List<offerModel>.from(
          items['data'].map((e) => offerModel.fromJson(e)).toList());
      return products;
    } else {
      List<offerModel> products = [];
      return products;
    }
  }
  Future<List<salesModel>> fetchsales() async {
    var response = await Api().getData('/order/view_orders');

    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print(("sales${items}"));


      List<salesModel> products = List<salesModel>.from(
          items['data'].map((e) => salesModel.fromJson(e)).toList());
      return products;
    } else {
      List<salesModel> products = [];
      return products;
    }
  }
  Future<List<deliveryModel>> fetchdeliveryy() async {
    var response = await Api().getData('/delivery/view_del');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);


      List<deliveryModel> products = List<deliveryModel>.from(
          items['data'].map((e) => deliveryModel.fromJson(e)).toList());
      return products;
    } else {
      List<deliveryModel> products = [];
      return products;
    }
  }
  Future<List<orderModel>> fetchorder() async {
    var response = await Api().getData('/order/view_order');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);


      List<orderModel> products = List<orderModel>.from(
          items['data'].map((e) => orderModel.fromJson(e)).toList());
      return products;
    } else {
      List<orderModel> products = [];
      return products;
    }
  }
  // Future<List<placeorderModel>> fetchplaceorder(String userid) async {
  //   var response = await Api().getData('/cart/view_order'+userid);
  //   if (response.statusCode == 200) {
  //     var items = json.decode(response.body);
  //     print((items));
  //
  //     List<placeorderModel> products = List<placeorderModel>.from(
  //         items['data'].map((e) => placeorderModel.fromJson(e)).toList());
  //     return products;
  //   } else {
  //     List<placeorderModel> products = [];
  //     return products;
  //   }
  // }
}
