import 'package:dio_package/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsagePage extends StatelessWidget {
  const UsagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dio usage")),
      body: Consumer<CategoryViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.categoryList == null) {
            return Column(
              children: [
                const Center(
                  child: Text("No Data Yet"),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CategoryViewModel>().fetchCategoryList();
                    },
                    child: const Text("Get Data")),
              ],
            );
          }
          return Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(viewModel.categoryList![index].name),
                    onTap: () {
                    },
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
