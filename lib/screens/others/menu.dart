import 'package:flutter/material.dart';
import 'package:lavanya_mess/models/mess_plan.dart';
import 'package:lavanya_mess/services/api_services.dart';

class Menu extends StatefulWidget {
  final MessPlanModel plan;

  const Menu({super.key, required this.plan});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  dynamic menu;

  @override
  void initState() {
    ApiService.request("/menu/${widget.plan.menu}").then((response) {
      debugPrint(response['statusCode'].toString());
      if (response['statusCode'] == 200) {
        Map<String, dynamic> menuData =
            Map<String, dynamic>.from(response['data']['menu']);
        menuData.removeWhere((key, value) =>
            key.startsWith("_") || key == "createdAt" || key == "updatedAt");
        setState(() {
          menu = menuData;
        });
        debugPrint(menu.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final colCount = ((screenWidth - 15) / 340).floor();
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // Set desired color
          ),
          backgroundColor: const Color(0xffff4747),
          title: Text(
            widget.plan.name.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: menu != null
                  ? GridView.builder(
                      itemCount: menu.length,
                      padding: const EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2,
                        crossAxisCount: colCount == 0 ? 1 : colCount,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final day = menu.keys.elementAt(index);
                        final meals = menu[day];
                        return Card(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  day,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                IntrinsicWidth(
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Breakfast: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "${meals['breakfast']}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Lunch: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "${meals['lunch']}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Dinner: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "${meals['dinner']}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
        ));
  }
}

class Tile extends StatelessWidget {
  const Tile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text('Hello'),
    );
  }
}
