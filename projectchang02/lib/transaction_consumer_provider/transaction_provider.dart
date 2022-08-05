import 'package:flutter/foundation.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction.dart';

class TransactionProvider with ChangeNotifier {
  /* ตัวอย่างข้อมูล */
  List<Transaction> transactions = [];
/* ดึงข้อมูล */
  List<Transaction> getTracsaction() {
    return transactions;
  }

  void addTransaction(Transaction statement) {
    transactions.add(statement);
    /* แจ้งเตือน Consumer */
    notifyListeners();
  }

  List<Transactiont> transactionst = [];
  void addTransactiont(Transactiont statement) {
    transactionst.add(statement);
    /* แจ้งเตือน Consumer */
    notifyListeners();
  }
}
