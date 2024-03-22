import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavanya_mess/models/product_model.dart';
import 'package:lavanya_mess/providers/filter_provider.dart';
import 'package:lavanya_mess/providers/list_data_provider.dart';
import 'package:lavanya_mess/widgets/filter_bottom_sheet.dart';
import 'package:lavanya_mess/widgets/product.dart';
import 'package:lavanya_mess/widgets/search_input.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Map<String, dynamic> filters =
          Provider.of<FilterProvider>(context, listen: false).productFilter;
      String query = filters.entries
          .map((entry) =>
              entry.value != null ? '${entry.key}=${entry.value}' : '')
          .join('&');
      try {
        Provider.of<ListDataProvider>(context, listen: false)
            .fetchProducts(query);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products =
        Provider.of<ListDataProvider>(context).productList;

    final screenWidth = MediaQuery.of(context).size.width;
    final int colCount = (screenWidth - 25) ~/ 210;
    final int extraWidth = ((screenWidth - 25).toInt() % 210) ~/ colCount;

    double getAspectRatio() {
      if (colCount < 1) return 0.5;
      if (extraWidth <= 30) return 0.73;
      if (extraWidth <= 55) return 0.8;
      if (extraWidth <= 80) return 0.9;
      if (extraWidth <= 100) return 1;
      if (extraWidth <= 130) return 1.1;
      if (extraWidth <= 165) return 1.2;
      if (extraWidth <= 200) return 1.3;
      return 1.4;
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SearchInput(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Material(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                elevation: 10,
                child: SizedBox(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Stack(children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/banner.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Center(child: Container()),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(225, 225, 225, 0.5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '7 Days Trial Plan',
                            style: GoogleFonts.leckerliOne(
                              fontSize: 30,
                              color: const Color(0xAA000000),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/plans');
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 18),
                        foregroundColor: const Color.fromARGB(213, 255, 71, 71),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          side: BorderSide(
                              color: Color.fromARGB(213, 255, 71, 71),
                              width: 1.5),
                        ),
                      ),
                      child: const Text(
                        'All Plans',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Center(
                    child: Transform.translate(
                      offset: const Offset(45, 12),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 253, 88, 88),
                        ),
                        child: const Icon(
                          Icons.navigate_next_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: SingleChildScrollView(
            //       scrollDirection: Axis.horizontal,
            //       child: Row(
            //         children: [
            //           PlanCard(
            //             name: 'Platinum',
            //             price: '₹4000/Month',
            //             color: Colors.redAccent,
            //             icon: Image.asset(
            //               'assets/icons/platinum.png',
            //               width: 60,
            //             ),
            //           ),
            //           PlanCard(
            //             name: 'Gold',
            //             price: '₹3000/Month',
            //             color: Colors.redAccent,
            //             icon: Image.asset(
            //               'assets/icons/gold.png',
            //               width: 60,
            //             ),
            //           ),
            //           PlanCard(
            //             name: 'Simple',
            //             price: '₹2500/Month',
            //             color: Colors.redAccent,
            //             icon: Image.asset(
            //               'assets/icons/simple.png',
            //               width: 60,
            //             ),
            //           ),
            //           PlanCard(
            //             name: 'One Timer',
            //             price: '₹1500/Month',
            //             color: Colors.redAccent,
            //             icon: Image.asset(
            //               'assets/icons/one_timer.png',
            //               width: 60,
            //             ),
            //           ),
            //         ],
            //       )),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'All Dishes',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -2),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () {
                          showModalBottomSheet<dynamic>(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            context: context,
                            backgroundColor:
                                const Color.fromARGB(255, 252, 244, 244),
                            builder: (context) => const FilterBottomSheet(),
                          );
                        },
                        child: const Icon(
                          Icons.filter_alt_outlined,
                          size: 28,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  ]),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: getAspectRatio(),
                crossAxisCount: colCount > 0 ? colCount : 1,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Product(productData: products[index]);
              },
            )
          ],
        ),
      ),
    );
  }
}
