// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, file_names, use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers

import 'package:ebotzz/utils/imports.dart';

import '../core/utils/app_data.dart';
import '../widgets/product_list_view.dart';

class AllProductScreen extends StatelessWidget {
  AllProductScreen({Key? key}) : super(key: key);

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 5, right: 5),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search',
            suffixIcon: IconButton(
                color: Colors.grey, onPressed: () {}, icon: Icon(Icons.search)),
            contentPadding: const EdgeInsets.all(12),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.19),
            border: textFieldStyle,
            focusedBorder: textFieldStyle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<Widget?> _navigate(ProductModel product) {
      return Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (_, __, ___) =>
              DashboardProductDetailScreen(products: product),
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            _searchBar(),
            ProductListView(
              productList: AppData.productList,
              onTap: _navigate,
            ),
            const Text("Popular", style: h2Style),
            ProductListView(
              productList: AppData.productList,
              isHorizontal: false,
              onTap: _navigate,
            ),
          ],
        ),
      ),
    );
  }
}
