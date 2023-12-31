import 'package:flutter/material.dart';

import 'package:musico/constants/text.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(
          text: 'helooo',
          color: Colors.black,
        ),
      ),
    );
  }
}
