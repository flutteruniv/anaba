import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../home/presentation/home_page.dart';

class AnabaFormPage extends ConsumerStatefulWidget {
  const AnabaFormPage({super.key});

  static const relativePath = '/anaba_form';

  @override
  ConsumerState<AnabaFormPage> createState() => _AnabaFormPageState();
}

class _AnabaFormPageState extends ConsumerState<AnabaFormPage> {

  final titleController = TextEditingController();
  final publicInfoController = TextEditingController();
  final privateInfoController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 400,
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
                      controller: titleController,
                    ),
                    const SizedBox(height: 32),
                    const Text('公開情報'),
                    TextFormField(
                      controller: publicInfoController,
                    ),
                    const SizedBox(height: 32),
                    const Text('非公開情報'),
                    TextFormField(
                      controller: privateInfoController,
                    ),
                    const SizedBox(height: 32),
                    const Text('価格'),
                    TextFormField(
                      controller: priceController,
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          context.push(HomePage.relativePath);
                        },
                        child: const Text('保存する'),
                      ),
                    )
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
