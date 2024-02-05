import 'package:flutter/material.dart';
import 'package:lavanya_mess/screens/main_screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) => {setState(() => isLastPage = index == 2)},
            children: [
              Container(
                color: const Color(0xFFff4747),
                child: const Center(child: Text('Welcome')),
              ),
              Container(
                color: const Color(0xFFff4747),
                child: const Center(child: Text('Overview')),
              ),
              Container(
                color: const Color(0xFFff4747),
                child: const Center(child: Text('About')),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: isLastPage
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(
                        bottom: 45, top: 10, right: 10, left: 10),
                    width: double.infinity,
                    height: 60,
                    child: TextButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('boarding', true);
                        if (!context.mounted) return;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      },
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFffffff),
                        ),
                      ),
                    ),
                  )
                : Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: 100,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () => _controller.jumpToPage(2),
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "SKIP",
                                  style: TextStyle(
                                    color: Color(0xAAffffff),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: SmoothPageIndicator(
                                controller: _controller,
                                count: 3,
                                effect: const ScrollingDotsEffect(
                                    dotHeight: 10,
                                    dotWidth: 10,
                                    activeDotScale: 1.4,
                                    spacing: 16,
                                    dotColor: Color(0xAAffffff),
                                    activeDotColor: Color(0xAAffffff)),
                              ),
                            ),
                            TextButton(
                              onPressed: () => _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "NEXT",
                                  style: TextStyle(
                                    color: Color(0xAAffffff),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
          ),
        ],
      ),
    );
  }
}
