import 'package:flutter/material.dart';
import 'package:minimalist/models/product.dart';
import 'package:minimalist/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});
  //add to cart method

  void addToCart(BuildContext context) {
    //show a dialog to conform to add to ur cart?
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Add this item to Your Cart ?"),
              actions: [
                //cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),

                //yes button

                MaterialButton(
                  onPressed: () {
                    //pop dialog box
                    Navigator.pop(context);
                    //add to cart
                    context.read<Shop>().addToCart(product);
                  },
                  child: const Text("Yes"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              //product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(product.imagePath),
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              //product name
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              // product description
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          // product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //product price
              Text('\$' + product.price.toStringAsFixed(2)),
              //add btn
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: () {
                        addToCart(context);
                      },
                      icon: const Icon(Icons.add)))
            ],
          ),
        ],
      ),
    );
  }
}
