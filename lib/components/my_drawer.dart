import 'package:flutter/material.dart';
import 'package:minimalist/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header
              DrawerHeader(
                child: //logo
                    Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              //shop
              MyListTile(
                  text: "Shop",
                  icon: Icons.home,
                  onTap: () {
                    Navigator.pop(context);
                  }),
              MyListTile(
                  text: "Cart",
                  icon: Icons.shopping_bag_rounded,
                  onTap: () {
                    // pop the drawer and go to the cart page
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page');
                  }),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
                text: "Exit",
                icon: Icons.logout_rounded,
                onTap: () {
                  Navigator.pushNamed(context, '/intro_page');
                }),
          )
          //cart tile

          //exit shop
        ],
      ),
    );
  }
}
