import 'package:flutter/material.dart';

import 'localization/app_localizations.dart';
import 'screens/home_conversation_screen.dart';
import 'screens/setup_connect_screen.dart';
import 'theme/app_theme.dart';

class StackchanTalkApp extends StatefulWidget {
  const StackchanTalkApp({super.key});

  @override
  State<StackchanTalkApp> createState() => _StackchanTalkAppState();
}

class _StackchanTalkAppState extends State<StackchanTalkApp> {
  final _language = ValueNotifier<AppLanguage>(AppLanguage.ja);

  @override
  void dispose() {
    _language.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppLanguageScope(
      controller: _language,
      child: ValueListenableBuilder<AppLanguage>(
        valueListenable: _language,
        builder: (context, language, _) {
          return MaterialApp(
            title: 'stackchan-talk',
            debugShowCheckedModeBanner: false,
            locale: Locale(language.name),
            theme: buildAppTheme(),
            routes: {
              SetupConnectScreen.routeName: (_) => const SetupConnectScreen(),
              HomeConversationScreen.routeName: (_) =>
                  const HomeConversationScreen(),
            },
            home: const SetupConnectScreen(),
          );
        },
      ),
    );
  }
}
