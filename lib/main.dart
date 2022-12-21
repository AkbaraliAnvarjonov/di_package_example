import 'package:dio_package/data/api_servise/api_servise.dart';
import 'package:dio_package/data/repository/repository.dart';
import 'package:dio_package/ui/home_page.dart';
import 'package:dio_package/view_model/category_id_model.dart';
import 'package:dio_package/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  MyResponse myResponse = MyResponse(error: "");

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CategoryViewModel(
            repository: Repository(
              apiSerice: ApiSerice(),
            ),
            myResponse: myResponse),
      ),
      ChangeNotifierProvider(
        create: (context) => CategoryIdViewModel(
            repository: Repository(apiSerice: ApiSerice()),
            myResponse: myResponse),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const UsagePage(),
    );
  }
}
