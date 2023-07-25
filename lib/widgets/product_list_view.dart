

import 'package:ebotzz/core/app_extension.dart';

import '../utils/imports.dart';

class ProductListView extends StatelessWidget {
  final bool isHorizontal;
  final Function(ProductModel product)? onTap;
  final List<ProductModel> productList;

  const ProductListView(
      {Key? key,
        this.isHorizontal = true,
        this.onTap,
        required this.productList})
      : super(key: key);


  Widget _productImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(
        image,
        width: 120,
        height: 120,
      ),
    ).fadeAnimation(0.4);
  }

  Widget _listViewItem(ProductModel products, int index) {
    Widget widget;
    widget = isHorizontal == true
        ? Column(
      children: [
        Hero(tag: index, child: _productImage(products.img)),
        const SizedBox(height: 10),
        Text(products.title.addOverFlow, style: h4Style),
        const SizedBox(height: 5),
        Text(
          products.description.addOverFlow,
          style: h4Style.copyWith(fontSize: 12),
          // maxLines: 2,
          //  overflow: TextOverflow.ellipsis,
        )
            .fadeAnimation(0.8),
      ],
    )
        : Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _productImage(products.img),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(products.title, style: h4Style).fadeAnimation(0.8),
                const SizedBox(height: 5),
                Text(
                  products.description,
                  style: h4Style.copyWith(fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ).fadeAnimation(1.4)
              ],
            ),
          ),
        )
      ],
    );

    return GestureDetector(
      onTap: () => onTap?.call(products),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isHorizontal == true
        ? SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (_, index) {
          ProductModel product = productList[index];
          return _listViewItem(product, index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(left: 15),
          );
        },
      ),
    )
        : ListView.builder(
      shrinkWrap: true,
      reverse: true,
      physics: const ClampingScrollPhysics(),
      itemCount: productList.length,
      itemBuilder: (_, index) {
        ProductModel product = productList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 10),
          child: _listViewItem(product, index),
        );
      },
    );
  }
}