import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsfeed_app/screens/view_models/home_viewmodel.dart';
import 'package:newsfeed_app/screens/widgets/custom_news_list_widgte.dart';
import 'package:newsfeed_app/utilities/custom_text_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final provider = Provider.of<HomeViewModel>(context, listen: false);
    provider.getMainCategorie();
    provider.getNewsList("0");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        title: const Padding(
          padding: EdgeInsets.only(
            top: 20,
          ),
          child: TextStyleWidget(
              text: "News & Blogs", textSize: 25, textWidth: FontWeight.bold),
        ),
      ),
      body: Consumer<HomeViewModel>(builder: (context, homeProvider, _) {
        if (homeProvider.mainCategorisList.isEmpty) {
          return const Center(
            child: CupertinoActivityIndicator(
              radius: 30,
            ),
          );
        } else {
          return DefaultTabController(
            length: 7,
            child: Column(
              children: [
                TabBar(
                  padding: EdgeInsets.zero,
                  indicatorColor: Colors.green,
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                  isScrollable: true,
                  tabs: homeProvider.mainCategorisList.map((e) {
                    return Tab(
                      text: e.name,
                    );
                  }).toList(),
                  onTap: (value) {
                    homeProvider.getNewsList(
                      value.toString(),
                    );
                  },
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const AllNewsWidget(),
                      Consumer<HomeViewModel>(
                          builder: (context, homeProvider, _) {
                        if (homeProvider.testList.isEmpty) {
                          return const CupertinoActivityIndicator(
                            radius: 30,
                          );
                        } else {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              final news = homeProvider.testList[index];
                              return CustomNewsContainerWidget(
                                data: news,
                              );
                            },
                            itemCount: homeProvider.testList.length,
                          );
                        }
                      }),
                      Consumer<HomeViewModel>(
                          builder: (context, homeProvider, _) {
                        if (homeProvider.investingList.isEmpty) {
                          return const CupertinoActivityIndicator(
                            radius: 30,
                          );
                        } else {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              final news = homeProvider.investingList[index];
                              return CustomNewsContainerWidget(
                                data: news,
                              );
                            },
                            itemCount: homeProvider.investingList.length,
                          );
                        }
                      }),
                      Consumer<HomeViewModel>(
                          builder: (context, homeProvider, _) {
                        if (homeProvider.stockList.isEmpty) {
                          return const CupertinoActivityIndicator(
                            radius: 30,
                          );
                        } else {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              final news = homeProvider.stockList[index];
                              return CustomNewsContainerWidget(
                                data: news,
                              );
                            },
                            itemCount: homeProvider.stockList.length,
                          );
                        }
                      }),
                      Consumer<HomeViewModel>(
                          builder: (context, homeProvider, _) {
                        if (homeProvider.learningList.isEmpty) {
                          return const CupertinoActivityIndicator(
                            radius: 30,
                          );
                        } else {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              final news = homeProvider.learningList[index];
                              return CustomNewsContainerWidget(
                                data: news,
                              );
                            },
                            itemCount: homeProvider.learningList.length,
                          );
                        }
                      }),
                      Consumer<HomeViewModel>(
                          builder: (context, homeProvider, _) {
                        if (homeProvider.brandingList.isEmpty) {
                          return const CupertinoActivityIndicator(
                            radius: 30,
                          );
                        } else {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              final news = homeProvider.brandingList[index];
                              return CustomNewsContainerWidget(
                                data: news,
                              );
                            },
                            itemCount: homeProvider.brandingList.length,
                          );
                        }
                      }),
                      Consumer<HomeViewModel>(
                          builder: (context, homeProvider, _) {
                        if (homeProvider.cryptoList.isEmpty) {
                          return const CupertinoActivityIndicator(
                            radius: 30,
                          );
                        } else {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              final news = homeProvider.cryptoList[index];
                              return CustomNewsContainerWidget(
                                data: news,
                              );
                            },
                            itemCount: homeProvider.cryptoList.length,
                          );
                        }
                      }),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}

class AllNewsWidget extends StatefulWidget {
  const AllNewsWidget({
    super.key,
  });

  @override
  State<AllNewsWidget> createState() => _AllNewsWidgetState();
}

class _AllNewsWidgetState extends State<AllNewsWidget> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    final provider = Provider.of<HomeViewModel>(context, listen: false);
    provider.getNewsList("0");
    super.initState();
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.minScrollExtent) {
      final provider = Provider.of<HomeViewModel>(context, listen: false);
      provider.getNewsList("0");
    }
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      final provider = Provider.of<HomeViewModel>(context, listen: false);
      provider.getMoreNews();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, homeProvider, _) {
      if (homeProvider.allNewList.isEmpty) {
        return const CupertinoActivityIndicator(
          radius: 30,
        );
      } else {
        return ListView.builder(
          controller: _controller,
          itemBuilder: (context, index) {
            final news = homeProvider.allNewList[index];
            return CustomNewsContainerWidget(
              data: news,
            );
          },
          itemCount: homeProvider.allNewList.length,
        );
      }
    });
  }
}
