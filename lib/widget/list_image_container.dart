import 'package:flutter/material.dart';

class ListImageContainer extends Container {
  ListImageContainer(String imageUrl)
      : super(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          constraints: BoxConstraints.expand(
            height: 200.0,
          ),
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.transparent],
            ),
          ),
        );
}
