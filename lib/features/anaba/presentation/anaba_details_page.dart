import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers.dart';
import '../../auth/presentation/auth_dialog.dart';
import '../../home/presentation/home_page.dart';
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
            width: 480,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64),
                InkWell(
                  onTap: () {
                    context.go(HomePage.relativePath);
                  },
                  child: Center(
                    child: SizedBox(
                      height: 120,
                      child: Image.asset('images/icon.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  anaba.data().title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 32),
                SelectableLinkify(
                  text: anaba.data().nonPurchasedContent,
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text('---------- ここからは有料区間です ----------'),
                ),
                const SizedBox(height: 16),
                if (appUser?.anabas.contains(id) == true)
                  SelectableLinkify(
                    text: anaba.data().purchasedContent,
                  ),
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
                  ),
                if (appUser == null)
                  SizedBox(
                    width: 480,
                    height: 32,
                    child: ElevatedButton(
                      onPressed: () {
                        AuthDialog.show(context);
                      },
                      child: const Text('まずは登録する'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
