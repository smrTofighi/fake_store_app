import 'package:fake_store_app/features/main/category/main_category_model.dart';
import 'package:get/get.dart';

class MainCategoryViewModel extends GetxController{
  final MainCategoryModel _model = MainCategoryModel();
  MainCategoryModel get model => _model;

  @override
  void onInit() {
    getCategoryList();
    getFirstCategoryItems();
    super.onInit();
    Future.delayed(2.seconds,(){
    });
  }
  getFirstCategoryItems(){

     _model.getFirstCategoryItems();
     update();
  }
  getSecondCategoryItems(){
     _model.getSecondCategoryItems();
     
     update();
       Future.delayed(2.seconds,(){
    });
  }

  getCategoryItems(String category, int index){
    _model.getCategoryItems(category, index);
   
     update();
  }

  getCategoryList(){
    _model.getCategoryList();
    update();
  }
}