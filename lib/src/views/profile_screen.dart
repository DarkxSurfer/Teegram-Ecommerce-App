import 'package:flutter/material.dart';
import 'package:hackathon/src/common_widgets/custom_profile.dart';

import '../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,

        title: const Text(
          'My Profile',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Icon(Icons.person),
            ),
            title: Text(
              "Hi, Meezaab ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              "Welcome to  Teegram!",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomProfileOptions(
              text1: "Edit Profile", icon1: const Icon(Icons.contact_page_outlined)),
          const Divider(),
          CustomProfileOptions(
              text1: "My Orders",
              icon1: const Icon(Icons.insert_page_break_outlined)),
          const Divider(),
          CustomProfileOptions(
              text1: "Billing", icon1: const Icon(Icons.access_time_rounded)),
          const Divider(),
          CustomProfileOptions(text1: "FAQ", icon1: const Icon(Icons.question_mark)),
          const Divider(),
        ]),
      ),
    );
  }
}
