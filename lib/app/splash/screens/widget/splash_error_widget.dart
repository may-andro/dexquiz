import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SplashErrorWidget extends StatelessWidget {
  const SplashErrorWidget(this._cause, {super.key});

  final Object? _cause;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'We have encountered an issue during the setup 😵‍💫',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.15,
            height: 24 / 16,
            color: Color(context.isDarkMode ? 0xFFFFFFFF : 0xFF121212),
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(context.isDarkMode ? 0xFFFFFFFF : 0xFF121212),
            ),
            color: Color(context.isDarkMode ? 0xFFFFFFFF : 0xFF121212)
                .withOpacity(0.5),
          ),
          child: Text(
            _cause.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.15,
              height: 24 / 16,
              color: Color(context.isDarkMode ? 0xFFFFFFFF : 0xFF121212),
            ),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            text: 'Please restart the app again. If the issue persists ',
            style: TextStyle(
              color: Color(context.isDarkMode ? 0xFFFFFFFF : 0xFF121212),
              fontSize: 14,
              letterSpacing: 0.15,
              height: 20 / 14,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'contact support',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.15,
                  height: 20 / 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'This feature is not yer developed',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.15,
                            height: 20 / 14,
                            color: Color(
                              context.isDarkMode ? 0xFF121212 : 0xFFFFFFFF,
                            ),
                          ),
                        ),
                        duration: const Duration(milliseconds: 300),
                      ),
                    );
                  },
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
