import 'package:dio_package/view_model/bank_view_model/incomes_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncomesPage extends StatefulWidget {
  const IncomesPage({super.key});

  @override
  State<IncomesPage> createState() => _IncomesPageState();
}

class _IncomesPageState extends State<IncomesPage> {
  @override
  void initState() {
    context.read<IncomeTypesViewModel>().fetchIncomesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Incomes"),
        ),
        body: Consumer<IncomeTypesViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.errorForUI.isNotEmpty) {
              return Center(
                child: Text(viewModel.errorForUI),
              );
            }
            if (viewModel.incomesList != null) {
              return Column(
                children: [
                  ListView.builder(
                    itemCount: viewModel.incomesList!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(viewModel.incomesList![index].incomeType),
                      );
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
