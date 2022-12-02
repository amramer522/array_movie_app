import 'package:flutter/material.dart';

class ItemMovie extends StatelessWidget {
  final String imageUrl, title;

  const ItemMovie({Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://image.tmdb.org/t/p/original/" + imageUrl,
          fit: BoxFit.fill,
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            height: 40,
            width: double.infinity,
            color: Colors.red.withOpacity(.7),
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}

