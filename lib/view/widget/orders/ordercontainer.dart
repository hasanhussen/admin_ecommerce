import 'package:flutter/material.dart';

class OrderContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;

  const OrderContainer(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  size: 50,
                )),
            SizedBox(
              height: 5,
            ),
            Container(
                padding: EdgeInsets.only(left: 20, top: 10),
                child:
                    Text(title, style: Theme.of(context).textTheme.bodyLarge)),
          ],
        ),
      ),
    );
  }
}
