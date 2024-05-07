import 'package:fake_store_app/core/data/models/product_cart_model.dart';
import 'package:get/get.dart';

class MainShopModel {
  final RxList<ProductCartModel> _products = RxList();
  List<ProductCartModel> get products => _products;

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

  addProductToCart(
    ProductCartModel productCartModel) {
    _products.add(
    productCartModel
    );
    _totalPrice = _totalPrice + productCartModel.totalPrice.toInt();
  }

  increaseProduct(int index,){
    _products[index].count++;
    _products[index].totalPrice = _products[index].count * _products[index].price;
    _totalPrice = _totalPrice + _products[index].price.toInt();
  }
  decreaseProduct(int index){
    if(_products[index].count >1){
      _products[index].count--;
     _products[index].totalPrice = _products[index].count * _products[index].price;
     _totalPrice = _totalPrice - _products[index].price.toInt();
    }
    else {
      _totalPrice = _totalPrice - _products[index].price.toInt();
      _products.removeAt(index);
    }
  }

  payment(){
    _totalPrice = 0;
    _products.clear();
  }

}
