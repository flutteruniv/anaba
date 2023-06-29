import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers.dart';
import '../../anaba/presentation/anaba_details_page.dart';
import '../../anaba_form/anaba_form_page.dart';
import '../../auth/presentation/auth_dialog.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const relativePath = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(P.userProvider).valueOrNull;
    log(user?.uid ?? '');

    final appUser = ref.watch(P.appUserProvider(user?.uid ?? '')).valueOrNull;
    log(appUser?.data()?.detailsSubmitted.toString() ?? '');

    final anabaList = ref.watch(P.anabaListProvider).valueOrNull?.docs ?? [];
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
                    const SizedBox(height: 64),
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
                    const SizedBox(height: 64),
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
                    const SizedBox(height: 64),
                    const Text(
                      '新着穴場',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 560),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: anabaList.length,
                        itemBuilder: (context, index) {
                          final anaba = anabaList[index];
                          return ListTile(
                            onTap: () {
                              context.go(
                                '${AnabaDetailsPage.relativePath}/${anaba.reference.id}',
                              );
                            },
                            title: Text(anaba.data().title),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 64),
                    if (user == null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: SizedBox(
                          width: 400,
                          height: 32,
                          child: ElevatedButton(
                            onPressed: () {
                              AuthDialog.show(context);
                            },
                            child: const Text('事前登録'),
                          ),
                        ),
                      ),
                    if (user != null &&
                        (appUser?.data()?.detailsSubmitted ?? false) == false)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: SizedBox(
                          width: 400,
                          height: 32,
                          child: ElevatedButton(
                            onPressed: () async {
                              final url = await ref
                                  .read(P.stripeAccountUrlProvider.future);
                              await launchUrl(Uri.parse(url));
                            },
                            child: const Text('アカウント情報を入力'),
                          ),
                        ),
                      ),
                    if (user != null &&
                        (appUser?.data()?.detailsSubmitted ?? false))
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: SizedBox(
                          width: 400,
                          height: 32,
                          child: ElevatedButton(
                            onPressed: () {
                              context.go(AnabaFormPage.relativePath);
                            },
                            child: const Text('穴場を報告する'),
                          ),
                        ),
                      ),
                    if (user != null &&
                        (appUser?.data()?.detailsSubmitted ?? false))
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: SizedBox(
                          width: 400,
                          height: 32,
                          child: ElevatedButton(
                            onPressed: () async {
                              final url = await ref
                                  .read(P.stripeLoginUrlProvider.future);
                              await launchUrl(Uri.parse(url));
                            },
                            child: const Text('ダッシュボードを見る'),
                          ),
                        ),
                      ),
                    if (user != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: SizedBox(
                          width: 400,
                          height: 32,
                          child: ElevatedButton(
                            onPressed: ref.read(P.signOutProvider),
                            child: const Text('ログアウト'),
                          ),
                        ),
                      ),
                    const SizedBox(height: 80)
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
