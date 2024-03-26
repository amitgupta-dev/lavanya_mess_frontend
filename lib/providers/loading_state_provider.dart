import 'package:flutter/material.dart';

class LoadingStateProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
