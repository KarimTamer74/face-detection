import 'dart:typed_data';

import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final Uint8List? imageBytes;
  final VoidCallback? onTap;
  final double size;

  const UserImage({
    Key? key,
    this.imageBytes,
    this.onTap,
    this.size = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.indigo,
            width: 3,
          ),
          image: imageBytes != null
              ? DecorationImage(
                  image: MemoryImage(imageBytes!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: imageBytes == null
            ? Icon(
                Icons.add_a_photo,
                size: size / 3,
                color: Colors.grey[600],
              )
            : null,
      ),
    );
  }
}
