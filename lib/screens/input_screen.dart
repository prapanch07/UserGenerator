import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:userapi/screens/home_screen.dart';
import 'package:userapi/widgets/custom_snackbar.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar( 
          title: Row(
        children: [
          const Icon(
            Icons.light_mode,
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Switch(
                value: AdaptiveTheme.of(context).mode.isDark,
                onChanged: (value) {
                  if (value) {
                    AdaptiveTheme.of(context).setDark();
                  } else {
                    AdaptiveTheme.of(context).setLight();
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.dark_mode,
            size: 20,
          ),
        ],
      )),
      body: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Number of USER You want to Generate',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: IconButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    if (_controller.text.contains('.')) {
                      customsnackbar(context, 'Users != double');
                    } else {
                      final number = int.parse(_controller.text);
                      if (number > 0) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen(number: _controller.text),
                          ),
                        );
                      } else {
                        customsnackbar(context, 'Users != 0');
                      }
                    }
                  } else {
                    customsnackbar(context, 'Users != null');
                  }
                },
                icon: const Icon(
                  Icons.arrow_forward,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
