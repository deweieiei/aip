import 'package:flutter/material.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction_provider.dart';
import 'package:provider/provider.dart';

////////
class alert extends StatefulWidget {
  alert({Key? key}) : super(key: key);

  @override
  State<alert> createState() => _alertState();
}

class _alertState extends State<alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, TransactionProvider provider, child) {
          return ListView.builder(
            itemCount: provider.transactions.length,
            itemBuilder: (context, int index) {
              Transaction data = provider.transactions[index];
              return Card(
                elevation: 10,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 50,
                    child: FittedBox(
                      child: Text(
                        data.amount.toString(),
                      ),
                    ),
                  ),
                  title: Text(data.title),
                  subtitle: Text(data.date),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
