import 'package:flutter/material.dart';
import 'package:lavanya_mess/models/product_model.dart';
import 'package:lavanya_mess/providers/loading_state_provider.dart';
import 'package:lavanya_mess/services/api_services.dart';
import 'package:provider/provider.dart';

class ListDataProvider extends ChangeNotifier {
  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  void fetchProducts(BuildContext context, String query) async {
    LoadingStateProvider loadingState =
        Provider.of<LoadingStateProvider>(context, listen: false);
    loadingState.setIsLoading(true);

    dynamic response = await ApiService.request('/product/search?$query');
    if (response['statusCode'] == 200) {
      _productList = (response['data']['products'] as List<dynamic>)
          .map((data) => ProductModel.fromJson(data))
          .toList();
    }
    loadingState.setIsLoading(false);
    notifyListeners();
  }
}
