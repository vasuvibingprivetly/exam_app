import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:exam_app/utils/product_utils.dart';

import '../../utils/route_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          const Padding(
            padding: EdgeInsets.all(10),
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...allCategories
                  .map(
                    (e) => GestureDetector(
                  onTap: () {
                    log("CAT: $e");
                    Navigator.pop(context);
                    selectedCategory = e;
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            ImageList[allCategories.indexOf(e)]),
                      ),
                      Container(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e.replaceFirst(
                            e[0],
                            e[0].toUpperCase(),
                          ),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
                  .toList(),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.20,
              width: size.width * 10,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: selectedCategory != null,
                      child: ActionChip(
                        onPressed: () {
                          setState(() {
                            selectedCategory = null;
                          });
                        },
                        avatar: const Icon(Icons.clear),
                        label: const Text("Clear filter"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}