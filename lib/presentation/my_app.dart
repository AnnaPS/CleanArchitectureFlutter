import 'package:clean_architecture_app/presentation/pages/my_home_page.dart';
import 'package:clean_architecture_app/presentation/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<DataProvider>()..getEpisodes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clean Architecture with Flutter',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
