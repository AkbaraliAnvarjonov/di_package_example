import 'package:dio_package/view_model/bank_view_model/expenses_view_mode.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionsViewModel>().fetchTransactionsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text("Transaction Page")),
        body: Column(
          children: [
            Consumer<TransactionsViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.errorForUI.isNotEmpty) {
                  return Center(
                    child: Text(viewModel.errorForUI),
                  );
                }
                if (viewModel.transactionList != null) {
                  return ListView.builder(
                    itemCount: viewModel.transactionList!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(viewModel
                            .transactionList![index].data[0].reciver.name),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
    );
  }
}
