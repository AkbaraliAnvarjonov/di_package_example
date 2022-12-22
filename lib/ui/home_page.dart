import 'package:dio_package/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';

class UsagePage extends StatelessWidget {
  const UsagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
        gestures: const [
          GestureType.onTap,
          GestureType.onPanUpdateDownDirection,
        ],
        child: Scaffold(
          appBar: AppBar(title: const Text("Dio usage")),
          body: Column(
            children: [
              Consumer<CategoryViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.errorForUI.isNotEmpty) {
                    return Center(
                      child: Text(viewModel.errorForUI),
                    );
                  }
                  return viewModel.categoryList != null
                      ? Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title:
                                      Text(viewModel.categoryList![index].name),
                                  onTap: () {},
                                );
                              },
                            )
                          ],
                        )
                      : Column(
                          children: [
                            const Center(
                              child: Text("No Data Yet"),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<CategoryViewModel>()
                                      .fetchCategoryList();
                                },
                                child: const Text("Get Data")),
                          ],
                        );
                },
              ),
            ],
          ),
        ));
  }
}
