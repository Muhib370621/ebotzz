import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/vendorWidgets/pager.dart';
import 'package:flutter/material.dart';

class PagerRow extends StatelessWidget {
  const PagerRow({
    Key? key,
    required this.fillIndex,
  }) : super(key: key);
  final int fillIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      width: 250.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Pager(
            fillColor: fillIndex == 1 ||
                fillIndex == 2 ||
                fillIndex == 3 ||
                fillIndex == 4
                ? Colors.pink
                : Colors.black12,
          ),
          SizedBox(
            width: 2.w,
          ),
          Pager(
            fillColor: fillIndex == 2 || fillIndex == 3 || fillIndex == 4
                ? Colors.pink
                : Colors.black12,
          ),
          SizedBox(
            width: 2.w,
          ),
          Pager(
              fillColor: fillIndex == 4 || fillIndex == 3
                  ? Colors.pink
                  : Colors.black12),
          SizedBox(
            width: 2.w,
          ),
          Pager(
            fillColor:
            fillIndex == 4 ? Colors.pink : Colors.black12,
          ),
        ],
      ),
    );
  }
}
