import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'custom_image.dart';
class CustomCachedNetworkImage extends StatelessWidget {
  String? url;
   CustomCachedNetworkImage({
     this.url,
     Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: "$url",
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) =>CustomImage(),
        errorWidget: (context, url,error) =>CustomImage(),
    );
  }
}
