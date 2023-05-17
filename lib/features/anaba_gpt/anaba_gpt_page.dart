import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AnabaGptPage extends StatefulWidget {
  const AnabaGptPage({super.key, required this.title});

  final String title;

  @override
  State<AnabaGptPage> createState() => _AnabaGptPageState();
}

class _AnabaGptPageState extends State<AnabaGptPage> {
  var _answer = '';
  var _isLoading = false;

  final _textEditingController = TextEditingController(text: '穴場とはなんですか?');

  final openAI = OpenAI.instance.build(
    token: kOpenApiKey,
    baseOption: HttpSetup(),
    isLog: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      final answer = await _sendMessage(
                        _textEditingController.text,
                      );
                      setState(() {
                        _answer = answer;
                        _isLoading = false;
                      });
                      ;
                    },
                    icon: Icon(
                      _isLoading ? Icons.timer : Icons.send,
                    ),
                  ),
                ],
              ),
              Text(_answer),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _sendMessage(String message) async {
    final request = CompleteText(
      prompt: message,
      model: Model.textDavinci3,
      maxTokens: 200,
    );

    final response = await openAI.onCompletion(
      request: request,
    );
    return response!.choices.first.text;
  }
}
