import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  final String image;
  final String title;
  final void Function()? onTap;

  const HomeContainer(
      {super.key,
      required this.image,
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
            Image.asset(
              'assets/images/$image',
              width: 90,
              height: 60,
            ),
            SizedBox(
              height: 5,
            ),
            Text(title, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
