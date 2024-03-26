import 'package:flutter/material.dart';
import 'package:lavanya_mess/widgets/bottom_sheets/search_bottom_sheet.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10),
          elevation: 5,
          child: MouseRegion(
            cursor: SystemMouseCursors.text,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  useSafeArea: true,
                  builder: (context) => const SearchBottomSheet(),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      color: Color(0xFFff4747),
                      Icons.search_outlined,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
