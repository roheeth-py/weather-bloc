import 'package:flutter/material.dart';
import 'package:weather_app/features/home/models/home_product_data_model.dart';

import '../bloc/home_bloc.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  final HomeBloc homeBloc;

  const ProductTile(
      {required this.productModel, super.key, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: Colors.black38),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              image: DecorationImage(
                  image: NetworkImage(productModel.image), fit: BoxFit.cover),
            ),
          ),
          Text(
            productModel.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Text("Category: ${productModel.category}"),
          SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Text(
                "\$ ${productModel.price}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeProductLikeButtonClicked(
                      clickedProduct: productModel));
                },
                icon: const Icon(Icons.favorite),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeProductCartButtonClicked(
                      clickedProduct: productModel));
                },
                icon: const Icon(Icons.shopping_cart_checkout_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
