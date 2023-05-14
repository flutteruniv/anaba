import 'package:cloud_functions/cloud_functions.dart';

class StripeRepository {
  StripeRepository({required this.firebaseFunctions});

  final FirebaseFunctions firebaseFunctions;

  /// StripeAccountを作成するためのURLを返す
  Future<String> createStripeAccount() async {
    final response = await firebaseFunctions
        .httpsCallable('createStripeAccount')
        .call<String>();
    return response.data;
  }

  /// ダッシュボードにアクセスするためのリンク
  Future<String> createStripeLoginLink() async {
    final response = await firebaseFunctions
        .httpsCallable('createStripeLoginLink')
        .call<String>();
    return response.data;
  }

  Future<String> createStripeCheckoutUrl({
    required String title,
    required int amount,
    required String accountId,
    required String customerId,
    required String documentId,
  }) async {
    final response = await firebaseFunctions
        .httpsCallable('createStripeCheckoutUrl')
        .call<String>({
      'title': title,
      'amount': amount,
      'accountId': accountId,
      'customerId': customerId,
      'documentId': documentId,
    });
    return response.data;
  }
}


  // title: 商品名
  // amount: 価格
  // accountId: 出品者のID
  // customerId: 購入者のID
  // documentId: 商品ID