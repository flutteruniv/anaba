import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers.dart';
import '../anaba/model/anaba.dart';
import '../home/presentation/home_page.dart';

class AnabaFormPage extends ConsumerStatefulWidget {
  const AnabaFormPage({super.key});

  static const relativePath = '/anaba_form';

  @override
  ConsumerState<AnabaFormPage> createState() => _AnabaFormPageState();
}

class _AnabaFormPageState extends ConsumerState<AnabaFormPage> {
  late final titleController = TextEditingController()
    ..addListener(() {
      setState(() {});
    });
  late final publicInfoController = TextEditingController()
    ..addListener(() {
      setState(() {});
    });
  late final privateInfoController = TextEditingController()
    ..addListener(() {
      setState(() {});
    });
  late final priceController = TextEditingController()
    ..addListener(() {
      setState(() {});
    });

  @override
  void dispose() {
    titleController.dispose();
    publicInfoController.dispose();
    privateInfoController.dispose();
    priceController.dispose();
    super.dispose();
  }

  bool get canSubmit =>
      titleController.text.isNotEmpty &&
      privateInfoController.text.isNotEmpty &&
      (int.tryParse(priceController.text) ?? 0) >= 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 480,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    const Text(
                      'Anaba入力フォーム',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 32),
                    const SizedBox(height: 32),
                    const Text('見出し'),
                    TextFormField(
                      autofocus: true,
                      controller: titleController,
                      decoration: const InputDecoration(
                        hintText: 'お？っと思わせる魅力的なものが吉',
                      ),
                      maxLength: 24,
                    ),
                    const SizedBox(height: 32),
                    const Text('無料区間'),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 5,
                      minLines: 2,
                      controller: publicInfoController,
                      maxLength: 140,
                    ),
                    const SizedBox(height: 32),
                    const Text('有料区間'),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 10,
                      minLines: 8,
                      controller: privateInfoController,
                      maxLength: 1400,
                    ),
                    const SizedBox(height: 32),
                    const Text('価格'),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        hintText: '100円以上を入力してください。',
                      ),
                      controller: priceController,
                    ),
                    const SizedBox(height: 56),
                    Center(
                      child: SizedBox(
                        width: 480,
                        height: 32,
                        child: ElevatedButton(
                          onPressed: canSubmit
                              ? () async {
                                  await ref
                                      .read(P.firebaseFirestoreProvider)
                                      .collection('anaba')
                                      .withConverter(
                                        fromFirestore: (ds, _) =>
                                            Anaba.fromJson(ds.data()!),
                                        toFirestore: (value, _) =>
                                            value.toJson(),
                                      )
                                      .add(
                                        Anaba(
                                          title: titleController.text,
                                          nonPurchasedContent:
                                              publicInfoController.text,
                                          purchasedContent:
                                              privateInfoController.text,
                                          authorUID: FirebaseAuth
                                              .instance.currentUser!.uid,
                                          price:
                                              int.parse(priceController.text),
                                        ),
                                      );
                                  if (mounted) {
                                    context.go(HomePage.relativePath);
                                  }
                                }
                              : null,
                          child: const Text('保存する'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
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
