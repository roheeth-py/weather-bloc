import 'package:flutter/material.dart';
import 'package:weather_app/features/home/models/home_product_data_model.dart';

import '../bloc/cart_bloc.dart';

class CartTile extends StatelessWidget {
  final ProductModel productModel;
  final CartBloc cartBloc;

  const CartTile(
      {required this.productModel, super.key, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: Colors.black38),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              image: DecorationImage(
                  image: NetworkImage(productModel.image), fit: BoxFit.cover),
            ),
          ),
          Text(
            productModel.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Text("Category: ${productModel.category}"),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Text(
                "\$ ${productModel.price}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  cartBloc.add(CartItemRemoveEvent(product: productModel));
                },
                icon: const Icon(Icons.shopping_cart),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
