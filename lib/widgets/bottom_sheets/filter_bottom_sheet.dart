import 'package:flutter/material.dart';
import 'package:lavanya_mess/providers/filter_provider.dart';
import 'package:lavanya_mess/providers/list_data_provider.dart';
import 'package:lavanya_mess/widgets/components/custom_button.dart';
import 'package:provider/provider.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  Map<String, dynamic> filters = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      filters =
          Provider.of<FilterProvider>(context, listen: false).productFilter;
    });
    filters = Provider.of<FilterProvider>(context, listen: false).productFilter;
  }

  @override
  Widget build(BuildContext context) {
    FilterProvider filterProvider = Provider.of<FilterProvider>(context);
    return Wrap(
      children: [
        Container(
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  width: double.infinity,
                  color: Colors.transparent,
                  child: const Text(
                    'Sorting and Filters',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5, left: 5),
                        child: Text(
                          'Type of Food',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          TextButton(
                            onPressed: () {
                              if (filters['type'] != 'veg') {
                                setState(() {
                                  filters = {...filters, 'type': 'veg'};
                                });
                              } else {
                                setState(() {
                                  filters = {...filters, 'type': null};
                                });
                              }
                              debugPrint(filters['type']);
                            },
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(color: Colors.black12),
                              backgroundColor: filters['type'] == 'veg'
                                  ? const Color.fromARGB(60, 255, 71, 71)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'veg',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (filters['type'] != 'non-veg') {
                                setState(() {
                                  filters = {...filters, 'type': 'non-veg'};
                                });
                              } else {
                                setState(() {
                                  filters = {...filters, 'type': null};
                                });
                              }
                              debugPrint(filters['type']);
                            },
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(color: Colors.black12),
                              backgroundColor: filters['type'] == 'non-veg'
                                  ? const Color.fromARGB(60, 255, 71, 71)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'non-veg',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5, left: 5),
                        child: Text(
                          'Sort',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          TextButton(
                            onPressed: () {
                              if (filters['sortBy'] != 'price' ||
                                  filters['sortOrder'] != 'asc') {
                                setState(() {
                                  filters = {
                                    ...filters,
                                    'sortBy': 'price',
                                    'sortOrder': 'asc'
                                  };
                                });
                              } else {
                                setState(() {
                                  filters = {
                                    ...filters,
                                    'sortBy': null,
                                    'sortOrder': null
                                  };
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(color: Colors.black12),
                              backgroundColor: (filters['sortBy'] == 'price' &&
                                      filters['sortOrder'] == 'asc')
                                  ? const Color.fromARGB(60, 255, 71, 71)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'price: low-high',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (filters['sortBy'] != 'price' ||
                                  filters['sortOrder'] != 'desc') {
                                setState(() {
                                  filters = {
                                    ...filters,
                                    'sortBy': 'price',
                                    'sortOrder': 'desc'
                                  };
                                });
                              } else {
                                setState(() {
                                  filters = {
                                    ...filters,
                                    'sortBy': null,
                                    'sortOrder': null
                                  };
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(color: Colors.black12),
                              backgroundColor: filters['sortBy'] == 'price' &&
                                      filters['sortOrder'] == 'desc'
                                  ? const Color.fromARGB(60, 255, 71, 71)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'price: high-low',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (filters['sortBy'] != 'rating' ||
                                  filters['sortOrder'] != 'desc') {
                                setState(() {
                                  filters = {
                                    ...filters,
                                    'sortBy': 'rating',
                                    'sortOrder': 'desc'
                                  };
                                });
                              } else {
                                setState(() {
                                  filters = {
                                    ...filters,
                                    'sortBy': null,
                                    'sortOrder': null
                                  };
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(color: Colors.black12),
                              backgroundColor: filters['sortBy'] == 'rating' &&
                                      filters['sortOrder'] == 'desc'
                                  ? const Color.fromARGB(60, 255, 71, 71)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'rating: high-low',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                      text: 'Apply',
                      height: 50,
                      radius: 15,
                      onPressed: () async {
                        filterProvider.setProductFilter(filters);
                        String query = filterProvider.productFilter.entries
                            .map((entry) => entry.value != null
                                ? '${entry.key}=${entry.value}'
                                : '')
                            .where((element) => element.isNotEmpty)
                            .join('&');
                        try {
                          Provider.of<ListDataProvider>(context, listen: false)
                              .fetchProducts(context, query);
                        } catch (e) {
                          debugPrint(e.toString());
                        } finally {}
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
