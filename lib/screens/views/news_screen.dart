import 'package:flutter/material.dart';
import 'package:newsfeed_app/screens/models/new_list_model.dart';
import 'package:newsfeed_app/utilities/custom_text_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key, required this.data});

  final Result data;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: data,
      transitionOnUserGestures: true,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_circle_left_outlined),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://d2qetcusef3plg.cloudfront.net${data.image}")),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 150, right: 20),
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey),
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(
                                  Icons.watch_later_sharp,
                                  color: Colors.black,
                                ),
                                TextStyleWidget(text: "20 min")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextStyleWidget(
                    text: data.title,
                    textSize: 20,
                    textWidth: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextStyleWidget(
                    textWidth: FontWeight.bold,
                    text: "Updated : ${data.createdAt}",
                    textColor: Colors.green,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextStyleWidget(text: data.content),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
