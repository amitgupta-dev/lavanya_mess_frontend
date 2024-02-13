// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lavanya_mess/widgets/custom_input.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 253, 239, 239),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    width: 160,
                    height: 160,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 5, color: Color.fromARGB(255, 255, 246, 246)),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/profile.jpg'),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: CustomInputWidget(text: 'Name'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: CustomInputWidget(text: 'Email'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: CustomInputWidget(text: 'Mobile'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: CustomInputWidget(text: 'DOB'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: CustomInputWidget(text: 'Gender'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
