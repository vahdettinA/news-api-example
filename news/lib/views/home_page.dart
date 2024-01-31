import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_extension/my_extension.dart';
import 'package:news/service/news_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: Text(
          "News",
          style: context.textTheme.titleMedium?.copyWith(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: service.fecthNews(),
                builder: (BuildContext context, snapshot) {
                  return snapshot.data != null
                      ? ListView.builder(
                          itemCount: snapshot.data!.articles!.length,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: context.lowPadding,
                              child: InkWell(
                                onTap: () async {},
                                child: Card(
                                    color: context
                                        .colorScheme.onSecondaryContainer,
                                    child: Padding(
                                      padding: context.midllePadding,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              snapshot
                                                  .data!.articles![index].title
                                                  .toString(),
                                              style: context
                                                  .textTheme.titleSmall
                                                  ?.copyWith(
                                                      color: Colors.white)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ClipRRect(
                                            borderRadius: context.midlleRadius,
                                            child: CachedNetworkImage(
                                                placeholder:
                                                    (BuildContext context,
                                                        index) {
                                                  return const CircularProgressIndicator();
                                                },
                                                errorWidget:
                                                    (context, url, error) {
                                                  return const SizedBox
                                                      .shrink();
                                                },
                                                imageUrl: snapshot.data!
                                                    .articles![index].urlToImage
                                                    .toString()),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot.data!.articles![index]
                                                  .description
                                                  .toString(),
                                              style: context
                                                  .textTheme.titleSmall
                                                  ?.copyWith(
                                                      color: Colors.white)),
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          })
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                }),
          )
        ],
      ),
    );
  }
}
