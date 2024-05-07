import 'package:fake_store_app/core/widgets/product/appbar_product_view.dart';
import 'package:fake_store_app/core/widgets/product/details_product.dart';
import 'package:fake_store_app/core/widgets/product/image_product_single.dart';
import 'package:flutter/material.dart';

class SingleProductShimmerView extends StatelessWidget {
  const SingleProductShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarProductSingleView(),
                ImageProductShimmer(),
                DetailsProductShimmer()
         
              ],
            ),
    );
  }
}