import 'package:flutter/material.dart';
import 'package:yun_lan_transfer/gen/assets.gen.dart';

class YunLanTransferLogo extends StatelessWidget {
  final bool withText;

  const YunLanTransferLogo({required this.withText});

  @override
  Widget build(BuildContext context) {
    final logo = Assets.img.logo512.image(
      width: 200,
      height: 200,
    );

    if (withText) {
      return Column(
        children: [
          logo,
          const Text(
            '云联局域网快传',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    return logo;
  }
}
