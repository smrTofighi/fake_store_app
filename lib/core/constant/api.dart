class AppApi {
  AppApi._();
  static const String host = 'https://fakestoreapi.com/';
  static const String productLimit = '${host}products?limit=';
  static const String getAllProduct = '${host}products';
  static const String getSingleProduct = '${host}products/';
  static const String getAllCategories = '${host}products/categories';
  static const String getOnCategory = '${host}products/category/';
}
