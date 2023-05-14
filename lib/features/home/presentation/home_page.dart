import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers.dart';
import '../../auth/presentation/auth_dialog.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const relativePath = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(P.userProvider).valueOrNull;
    return SelectionArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 400,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 320,
                      child: Image.asset('images/icon.png'),
                    ),
                    const Text(
                      'Anaba',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '「知る人ぞ売る」',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '穴場販売プラットフォーム',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 32),
                    if (user == null)
                      ElevatedButton(
                        onPressed: () {
                          AuthDialog.show(context);
                        },
                        child: const Text('事前登録'),
                      )
                    else
                      ElevatedButton(
                        onPressed: () async {
                          final url =
                              await ref.read(P.stripeAccountUrlProvider.future);
                          await launchUrl(Uri.parse(url));
                        },
                        child: const Text('アカウント情報を入力'),
                      ),
                    const SizedBox(height: 32),
                    const Text(
                      '雑誌やサイトに載ったランキングでは満足できない。平均化された情報はいらない、誰かの熱狂的なおすすめが知りたい。そんなちょっと「あまのじゃく」なあなたに向けたサービスを開発中。',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Anabaでは誰かがおすすめする穴場情報を売り買いすることができます。大切な人とのデート。年に一度の旅行。絶対に楽しみ切りたいイベントに、Anabaが助けになります。',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () async {
                        final url = await ref
                            .read(P.stripeRepository)
                            .createStripeCheckoutUrl(
                              title: 'テスト商品',
                              amount: 100,
                              accountId: 'acct_1N1O4WB3ymTKQwgC',
                              customerId: 'cus_Ns8cpsew2Oe8kU',
                              documentId: 'testId',
                            );
                        await launchUrl(Uri.parse(url));
                      },
                      child: const Text('購入テスト'),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () async {
                        final url =
                            await ref.read(P.stripeLoginUrlProvider.future);
                        await launchUrl(Uri.parse(url));
                      },
                      child: const Text('ダッシュボードを見る'),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
