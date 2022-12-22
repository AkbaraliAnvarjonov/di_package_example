import 'package:dio_package/view_model/currency_view_model/currency_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrrecyPage extends StatefulWidget {
  const CurrrecyPage({super.key});

  @override
  State<CurrrecyPage> createState() => _CurrrecyPageState();
}

class _CurrrecyPageState extends State<CurrrecyPage> {
  @override
  void initState() {
    context.read<CurrencyViewModel>().fetchCurrecyList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Currency")),
      body: Consumer<CurrencyViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorForUI.isNotEmpty) {
            return Center(
              child: Text(viewModel.errorForUI),
            );
          }
          if (viewModel.currencyList != null) {
            return ListView.builder(
              itemCount: viewModel.currencyList!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(viewModel.currencyList![index].caption),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
