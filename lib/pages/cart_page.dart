import 'package:flutter/material.dart';
import 'package:minimalist/components/my_button.dart';
import 'package:minimalist/components/my_drawer.dart';
import 'package:minimalist/models/product.dart';
import 'package:minimalist/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  //remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    //show a dialog to conform to add to ur cart?
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text("Remove this item from Your Cart ?"),
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

//user pressed pay
  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text(
                  "user wants to pay!! connect this app to your  payment backend"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text('Your cart is Empty....'))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get  individual item in a cart
                      final item = cart[index];
                      //return as a cart tile UI
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                      );
                    }),
          ),
          //paybutton

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context), child: Text('pay now')),
          )
        ],
      ),
    );
  }
}
