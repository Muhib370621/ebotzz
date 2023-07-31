import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TradeColumn extends StatelessWidget {
  const TradeColumn({Key? key, required this.image, required this.name})
      : super(key: key);
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              image,
              color: Colors.white,
              height: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(name)
        ],
      ),
    );
  }
}
