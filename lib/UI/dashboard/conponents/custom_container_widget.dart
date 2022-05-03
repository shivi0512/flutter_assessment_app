import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/response/app_response.dart';

class CustomContainerWidget extends StatelessWidget {
 final DataList row;


  const CustomContainerWidget({Key? key, required this.row}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 5,
            offset: const Offset(
                0, 8), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * .08,
          vertical: Get.height * .02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Loads the images lazily
          CachedNetworkImage(
            imageUrl: row.imageHref ?? "",
            placeholder: (context, url) =>
                const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error),
          ),
          Text(
            row.title ?? "No Title",
            style: const TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Text(
            row.description ?? "No Description",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
