

import 'package:flutter/material.dart';
import 'package:hackathon/src/constants/colors.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
        required this.image,
        required this.title,
        required this.subTitle,
        required this.onPressed
      });
  final String image,title,subTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              /// Images
              Image(
                  image:  AssetImage(image),
                  width: 300),
          
              const SizedBox(height: 20),
          
              /// Title & Subtitle
          
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
          
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Text(subTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center),
              const SizedBox(height: 20),
          
              /// Button
              SizedBox(width: double.infinity,
              height: 30,
                child: ElevatedButton(
                    onPressed: onPressed,style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                    child: const Text("Continue", style: TextStyle(color: Colors.white),))),
            ],
          ),
        ),
      ),
    );
  }
}