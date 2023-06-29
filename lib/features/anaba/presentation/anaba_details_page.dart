import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers.dart';
import '../../user/model/app_user.dart';

class AnabaDetailsPage extends ConsumerWidget {
  const AnabaDetailsPage({
    super.key,
    required this.id,
  });

  static const relativePath = '/anaba';
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(P.userProvider).valueOrNull?.uid;
    final appUser = ref.watch(P.appUserProvider(uid)).value?.data();

    final anaba = ref.watch(P.anabaProvider(id));

    if (anaba == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: 400,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64),
                Text(
                  anaba.data().title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 32),
                Text(anaba.data().nonPurchasedContent),
                const SizedBox(height: 16),
                const Center(
                  child: Text('---------- ここからは有料区間です ----------'),
                ),
                const SizedBox(height: 16),
                if (appUser?.anabas.contains(id) == true)
                  Text(anaba.data().purchasedContent),
                if (appUser?.anabas.contains(id) == false)
                  ElevatedButton(
                    onPressed: () async {
                      final ds = await ref
                          .read(P.firebaseFirestoreProvider)
                          .collection('users')
                          .doc(anaba.data().authorUID)
                          .get();
                      final authorUser = AppUser.fromJson(ds.data()!);

                      final url = await ref
                          .read(P.stripeRepository)
                          .createStripeCheckoutUrl(
                            title: anaba.data().title,
                            amount: anaba.data().price,
                            accountId: authorUser.stripeAccountId!,
                            customerId: appUser!.customerId!,
                            documentId: id,
                          );
                      await launchUrl(Uri.parse(url));
                    },
                    // TODO(kenta-wakasa): そもそも登録していなければ登録を促す。
                    child: const Center(
                      child: Text('購入する'),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}