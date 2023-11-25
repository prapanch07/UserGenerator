import 'package:flutter/material.dart';
import 'package:userapi/widgets/rich_text.dart';

class CustomCardWidget extends StatelessWidget {
  final String name;
  final String dp;
  final String email;
  final String age;
  final String phone;
  final String username;
  final String password;

  const CustomCardWidget({
    super.key,
    required this.name,
    required this.dp,
    required this.email,
    required this.age,
    required this.phone,
    required this.username,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xffD4D3DD),
                Color(0xffEFEFBB),
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(dp),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomRichText(
                    text: 'name',
                    subtext: name,
                    isobscure: false,
                  ),
                  CustomRichText(
                    text: "age ",
                    subtext: age,
                    isobscure: false,
                  ),
                  CustomRichText(
                    text: "phone",
                    subtext: phone,
                    isobscure: false,
                  ),
                  CustomRichText(
                    text: "username",
                    subtext: username,
                    isobscure: false,
                  ),
                  CustomRichText(
                    text: "password",
                    subtext: password,
                    isobscure: true,
                  ),
                  CustomRichText(
                    text: 'email',
                    subtext: email,
                    isobscure: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
