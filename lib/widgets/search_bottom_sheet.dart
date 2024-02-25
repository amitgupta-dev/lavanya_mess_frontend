import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lavanya_mess/widgets/search_item.dart';

class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({super.key});

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
                  child: const SingleChildScrollView(
                    child: Wrap(
                      children: [
                        SearchItem(),
                        SearchItem(),
                        SearchItem(),
                        SearchItem(),
                        SearchItem(),
                        SearchItem(),
                        SearchItem(),
                        SearchItem(),
                        SearchItem(),
                        SearchItem(),
                        SearchItem(),
                        SearchItem(),
                        SearchItem(),
                        SearchItem(),
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
