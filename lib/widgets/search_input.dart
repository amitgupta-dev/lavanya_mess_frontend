import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: TextFormField(
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            suffixIcon: Icon(
              color: Color(0xFFff4747),
              Icons.search_outlined,
              size: 30,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            border: InputBorder.none,
            hintText: 'Search any Dish',
          ),
        ),
      ),
    );
  }
}
