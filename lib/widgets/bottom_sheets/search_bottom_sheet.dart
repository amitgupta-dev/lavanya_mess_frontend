import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lavanya_mess/models/product_model.dart';
import 'package:lavanya_mess/services/api_services.dart';
import 'package:lavanya_mess/widgets/cards/search_item.dart';

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  List<ProductModel> products = [];

  final _searchQueryController = TextEditingController();
  Timer? _debounce;
  final int _debounceTime = 1000;

  @override
  void initState() {
    super.initState();
    _searchQueryController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchQueryController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: _debounceTime), () async {
      if (_searchQueryController.text.isNotEmpty) {
        // Perform your API call with _searchQueryController.text
        var response = await ApiService.request(
            '/product/search?tags=${_searchQueryController.text}');
        if (response['statusCode'] == 200) {
          final List<dynamic> productsData = response['data']['products'];
          setState(() {
            products = productsData
                .map((data) => ProductModel.fromJson(data))
                .toList();
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 233, 233),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 5,
                    child: TextFormField(
                      controller: _searchQueryController,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        suffixIcon: Icon(
                          color: Color(0xFFff4747),
                          Icons.search_outlined,
                          size: 30,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        border: InputBorder.none,
                        hintText: 'Search any Dish',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: [
                        ...products.map((item) => SearchItem(data: item))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
