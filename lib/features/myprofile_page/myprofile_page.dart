import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers.dart';

class MyProfilePage extends ConsumerWidget {
  const MyProfilePage({super.key});

  static const relativePath = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FutureBuilder<User?>(
                      future: FirebaseAuth.instance.authStateChanges().first,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // ユーザー情報の取得中はローディング表示
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          // エラーが発生した場合の処理
                          return Text('エラーが発生しました');
                        } else {
                          // ユーザー情報を取得できた場合
                          final user = snapshot.data;
                          final iconUrl = user?.photoURL;
                          final displayName = user?.displayName;

                          return Column(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(iconUrl ?? ''),
                              ),
                              SizedBox(height: 16),
                              Text(
                                displayName ?? '表示名がありません',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          );
                        }
                      },
                    ),
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
