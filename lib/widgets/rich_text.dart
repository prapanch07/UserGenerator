import 'package:flutter/material.dart';
import 'package:userapi/utils/colors.dart';

class CustomRichText extends StatefulWidget {
  final String text;
  final String subtext;
  final bool isobscure;
  const CustomRichText({
    super.key,
    required this.text,
    required this.subtext,
    required this.isobscure,
  });

  @override
  State<CustomRichText> createState() => _CustomRichTextState();
}

class _CustomRichTextState extends State<CustomRichText> {
  bool isvisible = false;

  @override
  Widget build(BuildContext context) {


    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "${widget.text} : ",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: blackcolor,
                ),
              ),
              TextSpan(
                text: isvisible
                    ? widget.subtext
                    : widget.subtext.replaceAll(
                        RegExp(r'^[a-z]+$'),
                        '******',
                      ),
                style: const TextStyle(
                  fontSize: 15,
                  color: blackcolor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        widget.isobscure
            ? isvisible == false
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isvisible = !isvisible;

                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            isvisible = !isvisible;
                          });
                        });
                      });
                    },
                    child: const Icon(
                      Icons.visibility,
                      size: 18,
                      color: blackcolor,
                    ),
                  )
                : const Text('')
            : const Text('')
      ],
    );
  }
}
