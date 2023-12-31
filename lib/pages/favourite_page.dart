import 'package:flutter/material.dart';
import 'package:musico/constants/text.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(text: 'Yay', color: Colors.black,),
      ),
    );
  }
}

