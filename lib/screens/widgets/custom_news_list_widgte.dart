import 'package:flutter/material.dart';
import 'package:newsfeed_app/screens/models/new_list_model.dart';
import 'package:newsfeed_app/screens/views/news_screen.dart';
import 'package:newsfeed_app/utilities/custom_text_widget.dart';

class CustomNewsContainerWidget extends StatelessWidget {
  const CustomNewsContainerWidget({super.key, required this.data});

  final Result data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewsScreen(data: data),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Hero(
                        transitionOnUserGestures: true,
                        tag: data,
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://d2qetcusef3plg.cloudfront.net${data.image}")),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60, right: 20),
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
                  )
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
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextStyleWidget(
                  text: "Lorum ipsum ",
                  textSize: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
