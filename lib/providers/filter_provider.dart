import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  Map<String, dynamic> _productFilter = {
    'type': null,
    'sortBy': null,
    'sortOrder': null
  };
  Map<String, dynamic> _planFilter = {};

  Map<String, dynamic> get productFilter => _productFilter;
  Map<String, dynamic> get planFilter => _planFilter;

  setProductFilter(Map<String, dynamic> newProductFilter) {
    _productFilter = newProductFilter;
    notifyListeners();
  }

  clearProductFilter() {
    _productFilter = {};
    notifyListeners();
  }

  setPlanFilter(Map<String, dynamic> newPlanFilter) {
    _planFilter = newPlanFilter;
    notifyListeners();
  }

  clearPlanFilter() {
    _planFilter = {};
    notifyListeners();
  }
}
