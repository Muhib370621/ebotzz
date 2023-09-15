// ignore_for_file: sort_child_properties_last

import 'package:ebotzz/core/utils/appColors.dart';

import '../utils/imports.dart';

class CounterButton extends StatelessWidget {
  final Function() onIncrementSelected;
  final Function() onDecrementSelected;
  final int label;
  final Axis orientation;

   CounterButton(
      {Key? key,
      required this.onIncrementSelected,
      required this.onDecrementSelected,
      required this.label,
      this.orientation = Axis.horizontal})
      : super(key: key);

  Widget button(Icon icon, Function() onTap) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(const Size(26, 26)),
      child: icon,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      fillColor: AppColors.mainColor,
      onPressed: onTap,
    );
  }

  List<Widget> body() {
    return [
      button(const Icon(Icons.remove,size: 15,color: Colors.white,), onDecrementSelected),
      // Text("Quantity"),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "$label",
          style: h2Style.copyWith(fontSize: 15),
        ),
      ),
      button(const Icon(Icons.add,size: 15,color: Colors.white,), onIncrementSelected),


    ];
  }

  @override
  Widget build(BuildContext context) {
    return orientation == Axis.horizontal
        ? Row(mainAxisAlignment: MainAxisAlignment.end, children: body())
        : Row(
            children: body().reversed.toList(),
          );
  }
}
