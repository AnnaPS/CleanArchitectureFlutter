import 'package:clean_architecture_app/presentation/providers/data_provider.dart';
import 'package:clean_architecture_app/presentation/widgets/home_widgets/episode_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var dataProviderWatch = context.watch<DataProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick & Morty Episodes'),
      ),
      body: dataProviderWatch.episodePage == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : dataProviderWatch.errorMessage != null
              ? Center(
                  child: Text(dataProviderWatch.errorMessage),
                )
              : dataProviderWatch.episodes.isEmpty
                  ? Center(
                      child: Text('Empty list'),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: ListView.builder(
                        itemCount: dataProviderWatch.episodes.length,
                        itemBuilder: (context, index) {
                          return EpisodeCardWidget(
                            dataProviderWatch.episodes[index],
                          );
                        },
                      ),
                    ),
    );
  }
}
