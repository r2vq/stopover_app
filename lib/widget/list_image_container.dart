import 'package:flutter/material.dart';

class ListImageContainer extends Container {
  ListImageContainer(String imageUrl)
      : super(
          child: Image.network(
            imageUrl,
            fit: BoxFit.fitWidth,
          ),
          constraints: BoxConstraints.expand(
            height: 200.0,
          ),
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white.withOpacity(0.7), Colors.transparent],
            ),
          ),
        );
}
