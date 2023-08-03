

import '../core/app_assets.dart';
import '../utils/imports.dart';

enum EmptyWidgetType { cart, favorite }

class EmptyWidget extends StatelessWidget {
  final ProductModel? products;
  final EmptyWidgetType type;
  final String title;

  const EmptyWidget({Key? key, this.type = EmptyWidgetType.cart, required this.title, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          type == EmptyWidgetType.cart ? Image.asset(AppAsset.emptyCart) : Image.network(products!.img),
          const SizedBox(height: 10),
          Text(
            title,
            style: h2Style,
          )
        ],
      ),
    );
  }
}
