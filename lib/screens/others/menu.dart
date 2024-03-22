import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavanya_mess/models/mess_plan.dart';
import 'package:lavanya_mess/services/api_services.dart';

class Menu extends StatefulWidget {
  final MessPlanModel plan;

  const Menu({super.key, required this.plan});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Map<String, dynamic> menu = {};
  Map<String, dynamic> meals = {};
  String selectedDay = 'Monday';

  @override
  void initState() {
    ApiService.request("/menu/${widget.plan.menu}").then((response) {
      debugPrint(response['statusCode'].toString());
      if (response['statusCode'] == 200) {
        Map<String, dynamic> menuData =
            Map<String, dynamic>.from(response['data']['menu']);
        menuData.removeWhere((key, value) =>
            key.startsWith("_") || key == "createdAt" || key == "updatedAt");
        debugPrint('hello ${menuData.toString()}');
        setState(() {
          menu = menuData;
          debugPrint('hello ${menu.toString()}');
          meals = Map.fromEntries(
            menu[selectedDay].entries.where(
                  (entry) =>
                      ["breakfast", "lunch", "dinner"].contains(entry.key),
                ),
          );
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(menu.toString());

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: PopupMenuButton(
          icon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2, color: Colors.white)),
            child: Text(
              selectedDay.substring(0, 3),
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          itemBuilder: (BuildContext context) {
            return <String>[
              "Monday",
              "Tuesday",
              "Wednesday",
              "Thursday",
              "Friday",
              "Saturday",
              "Sunday"
            ]
                .map(
                  (element) => PopupMenuItem<String>(
                    value: element,
                    onTap: () => menu.isNotEmpty
                        ? setState(() {
                            selectedDay = element;
                            meals = Map.fromEntries(
                              menu[selectedDay].entries.where(
                                    (entry) => ["breakfast", "lunch", "dinner"]
                                        .contains(entry.key),
                                  ),
                            );
                          })
                        : () {},
                    child: Text(element),
                  ),
                )
                .toList();
          },
          onSelected: (value) {
            setState(() {
              selectedDay = value.toString();
            });
          },
        ),
      ),
      body: menu.isNotEmpty
          ? Stack(
              children: [
                Column(
                  children: [
                    ...meals.entries.map((entry) {
                      return Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: entry.key == 'breakfast'
                                ? const Color(0xffdc5c05).withOpacity(0.8)
                                : entry.key == 'lunch'
                                    ? const Color(0xffe3a945).withOpacity(0.8)
                                    : const Color(0xff32a560).withOpacity(0.8),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                Column(
                  children: [
                    ...meals.entries.map((entry) {
                      return Expanded(
                        flex: 1,
                        child: Container(
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                          child: Row(
                            children: [
                              if (entry.key == 'breakfast' ||
                                  entry.key == 'dinner')
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            entry.key.toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.leckerliOne(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                fontSize: 20),
                                          ),
                                          Text(
                                            entry.value['name'],
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.leckerliOne(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Transform.scale(
                                    scale: 2,
                                    child: Container(
                                      width: screenWidth / 3,
                                      height: screenWidth / 3,
                                      constraints: BoxConstraints(
                                          maxHeight: screenHeight / 4.8,
                                          maxWidth: screenHeight / 4.8),
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: entry.key == 'breakfast'
                                            ? const Color(0xffdc5c05)
                                            : entry.key == 'lunch'
                                                ? const Color(0xffe3a945)
                                                : const Color(0xff32a560),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: Image.network(
                                            entry.value['thumbnail'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (entry.key == 'lunch')
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            entry.key.toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.leckerliOne(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                fontSize: 20),
                                          ),
                                          Text(
                                            entry.value['name'],
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.leckerliOne(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            )
          : Container(),
    );
  }
}
