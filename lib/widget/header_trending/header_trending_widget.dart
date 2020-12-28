import 'package:flutter/material.dart';

headerImage(String url) {
  final String baseUrl = 'https://res.cloudinary.com/dziablq1m/image/upload/';
  url = baseUrl + url;
  return Container(
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: double.infinity,
            height: 200,
            child: Image.network(
              url,
              fit: BoxFit.fill,
            )
            ),
        Positioned(
            top: 100,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  color: Colors.green,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Thanh toan qua MoMo'.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontFamily: 'Bold'),
                    ),
                  ),
                ),
              ),
            )),
        Positioned(
            top: 150,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                color: Colors.orange,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Giam 2% cho cac cay size L',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )),
      ],
    ),
  );
}
