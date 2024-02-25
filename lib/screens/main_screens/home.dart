import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavanya_mess/widgets/plan_card.dart';
import 'package:lavanya_mess/widgets/product.dart';
import 'package:lavanya_mess/widgets/search_input.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Mess Plans',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      PlanCard(
                        name: 'Platinum',
                        price: '₹4000/Month',
                        color: Colors.redAccent,
                        icon: Image.asset(
                          'assets/icons/platinum.png',
                          width: 60,
                        ),
                      ),
                      PlanCard(
                        name: 'Gold',
                        price: '₹3000/Month',
                        color: Colors.redAccent,
                        icon: Image.asset(
                          'assets/icons/gold.png',
                          width: 60,
                        ),
                      ),
                      PlanCard(
                        name: 'Simple',
                        price: '₹2500/Month',
                        color: Colors.redAccent,
                        icon: Image.asset(
                          'assets/icons/simple.png',
                          width: 60,
                        ),
                      ),
                      PlanCard(
                        name: 'One Timer',
                        price: '₹1500/Month',
                        color: Colors.redAccent,
                        icon: Image.asset(
                          'assets/icons/one_timer.png',
                          width: 60,
                        ),
                      ),
                    ],
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Recommended for you',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: getAspectRatio(),
              crossAxisCount: colCount > 0 ? colCount : 1,
              children: const <Widget>[
                Product(),
                Product(),
                Product(),
                Product(),
                Product(),
                Product(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
