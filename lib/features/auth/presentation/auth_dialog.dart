
<<<<<<< HEAD
import '../../../providers.dart';

class AuthDialog extends ConsumerStatefulWidget {
  const AuthDialog({super.key});

  static Future<void> show(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return const AuthDialog();
      },
    );
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthDialogState();
}

class _AuthDialogState extends ConsumerState<AuthDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 80,
            child: Image.asset('images/icon.png'),
          ),
          const Text(
            'Anaba',
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 16),
          SignInButton(
            buttonType: ButtonType.google,
            onPressed: () async {
              await ref.read(P.signInProvider).call();
              if (mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
=======
>>>>>>> 64e8504 (“コミットテスト”)
