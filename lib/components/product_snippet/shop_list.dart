import 'package:flutter/material.dart';
import 'package:quicktel/models/shop_model.dart';

class Shop extends StatelessWidget {
  const Shop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(images[index]), fit: BoxFit.cover),
              ),
              height: 50,
              child: SizedBox(
                  width: 60,
                  height: 45,
                  child: Center(
                    child: Text(
                      store[index],
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ))),
        ),
      ),
    );
  }
}
