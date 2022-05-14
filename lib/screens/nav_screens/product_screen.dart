// ignore_for_file: avoid_print, unused_field, avoid_unnecessary_containers

import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:quicktel/components/const.dart';
import 'package:quicktel/main.dart';
import 'package:quicktel/models/banner_models.dart';
import 'package:quicktel/models/shop_model.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Product extends StatefulWidget {
  static String id = 'product';
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

final _httpLink = HttpLink('https://api.timart.com.ng/graphql');
ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
    link: _httpLink,
    cache: GraphQLCache(
      store: InMemoryStore(),
    )));

class _ProductState extends State<Product> {
  String _query = '';
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: client,
        child: Scaffold(
            backgroundColor: bgcl,
            body: Query(
                options: QueryOptions(document: gql(graphQLProducts)),
                builder: (QueryResult result, {fetchMore, refetch}) {
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }

                  if (result.isLoading) {
                    return const Text('Loading');
                  }

                  final productList = result.data?['getInventoriesAtRandom'];
                  print(productList);

                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                          backgroundColor: const Color(0xFFE5E5E5),
                          leading: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.barsStaggered,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                          elevation: 0,
                          actions: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesomeIcons.bell,
                                color: Colors.black54,
                                size: 20,
                              ),
                            ),
                          ],
                          floating: false,
                          pinned: true,
                          expandedHeight: 420.0,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 100, left: 10, right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: lightcl,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: 50,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              fillColor: Colors.black,
                                              prefixIcon:
                                                  Icon(Icons.search, size: 30),
                                              hintText:
                                                  "What are you looking for?",
                                              hintStyle: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontFamily: "GTWalsheimPro",
                                              )),
                                          onSaved: (v) {
                                            _query = v!;
                                          },
                                          validator: (v) {
                                            if (v!.isEmpty) {
                                              return 'No item searched';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 120,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: lightcl,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: CarouselSlider(
                                                options: CarouselOptions(
                                                    aspectRatio: 0.1,
                                                    viewportFraction: 1,
                                                    enlargeCenterPage: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    autoPlay: true,
                                                    onPageChanged:
                                                        (index, reason) {
                                                      setState(() {
                                                        _current = index;
                                                      });
                                                    }),
                                                items: img
                                                    .map((item) => Container(
                                                          child: Center(
                                                              child:
                                                                  Image.network(
                                                            item,
                                                            fit: BoxFit.cover,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                          )),
                                                        ))
                                                    .toList(),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 120,
                                            decoration: BoxDecoration(
                                                color: maincl.withOpacity(0.25),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                          Positioned(
                                            top: 100,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: img
                                                  .asMap()
                                                  .entries
                                                  .map((entry) {
                                                return GestureDetector(
                                                  onTap: () => _controller
                                                      .animateToPage(entry.key),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: 40.0,
                                                        height: 5.0,
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            vertical: 8.0,
                                                            horizontal: 4.0),
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            color: (Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .dark
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .white)
                                                                .withOpacity(
                                                                    _current ==
                                                                            entry.key
                                                                        ? 0.9
                                                                        : 0.4)),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                          Positioned(
                                            top: 20,
                                            left: 12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Fashion Sale",
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      color: lightcl,
                                                      fontFamily: "Montserrat",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Row(
                                                  children: const [
                                                    Text(
                                                      "See More",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: lightcl,
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    ),
                                                    SizedBox(width: 5),
                                                    Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      color: lightcl,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(children: [
                                        const Text(
                                          "Shops near you",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: const [
                                            Text(
                                              "See All",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.black45)
                                          ],
                                        ),
                                      ]),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: images.length,
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      images[index]),
                                                  fit: BoxFit.cover),
                                            ),
                                            height: 50,
                                            child: SizedBox(
                                                width: 80,
                                                child: Center(
                                                  child: Text(
                                                    store[index],
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: lightcl,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Featured",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                      SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 2,
                                childAspectRatio: 0.6),
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final formatCurrency = NumberFormat.simpleCurrency(
                              locale: Platform.localeName, name: 'NGN');

                          return Container(
                            height: 100,
                            color: const Color(0xFFE5E5E5),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 200,
                                        width: 160,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage([
                                              'smallImageOnlineURL'
                                            ][0]
                                                .toString()),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: lightcl,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(Icons.star,
                                                  size: 12,
                                                  color: Color(0xFFF6D021)),
                                              Icon(Icons.star,
                                                  size: 12,
                                                  color: Color(0xFFF6D021)),
                                              Icon(Icons.star,
                                                  size: 12,
                                                  color: Color(0xFFF6D021)),
                                              Icon(Icons.star,
                                                  size: 12,
                                                  color: Color(0xFFF6D021)),
                                              Icon(Icons.star,
                                                  size: 12,
                                                  color: Color(0xFFF6D021))
                                            ],
                                          ),
                                          Text(
                                            productList[index]['inventoryName']
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            formatCurrency
                                                .format(Random().nextInt(9999))
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 20,
                                  left: 15,
                                  child: Container(
                                    height: 25,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: maincl,
                                    ),
                                    child: Center(
                                        child: Text(
                                      "-${Random().nextInt(50).toString()}%",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: lightcl,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                Positioned(
                                  top: 180,
                                  left: 130,
                                  child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: lightcl,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.favorite_border_outlined,
                                            color: maincl),
                                      )),
                                ),
                              ],
                            ),
                          );
                        }, childCount: productList.length),
                      ),
                    ],
                  );
                })));
  }
}
