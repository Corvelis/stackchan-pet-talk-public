import 'package:flutter/widgets.dart';

enum AppLanguage { ja, en }

class AppLanguageScope extends InheritedNotifier<ValueNotifier<AppLanguage>> {
  const AppLanguageScope({
    super.key,
    required ValueNotifier<AppLanguage> controller,
    required super.child,
  }) : super(notifier: controller);

  static AppLanguage languageOf(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<AppLanguageScope>()
            ?.notifier
            ?.value ??
        AppLanguage.ja;
  }

  static void toggle(BuildContext context) {
    final controller = context
        .dependOnInheritedWidgetOfExactType<AppLanguageScope>()
        ?.notifier;
    if (controller == null) {
      return;
    }
    controller.value = controller.value == AppLanguage.ja
        ? AppLanguage.en
        : AppLanguage.ja;
  }
}

extension AppLocalizationsX on BuildContext {
  AppStrings get strings => AppStrings(AppLanguageScope.languageOf(this));
}

class AppStrings {
  const AppStrings(this.language);

  final AppLanguage language;

  bool get isJa => language == AppLanguage.ja;
  String get languageCode => isJa ? 'JA' : 'EN';
  String get languageToggleTooltip =>
      isJa ? 'Englishに切り替え' : 'Switch to Japanese';

  String get setupTitle => isJa ? '接続を準備' : 'Prepare connection';
  String get setupDescription => isJa
      ? 'SoftAP または Wi-Fi 上のIPでｽﾀｯｸﾁｬﾝに接続します。M1では接続テストはダミーです。'
      : 'Connect to Stack-chan through SoftAP or a Wi-Fi IP address. The M1 connection test is a dummy flow.';
  String get connectionTest => isJa ? '接続テスト' : 'Test connection';
  String get recentConnections => isJa ? '最近使った接続' : 'Recent connections';
  String get goToConversation => isJa ? '会話画面へ' : 'Go to conversation';
  String get notConnected => isJa ? '未接続' : 'not connected';
  String get testing => isJa ? '確認中' : 'testing';
  String get dummyConnected => isJa ? 'ダミー接続中' : 'dummy connected';

  String get conversationTitle => isJa ? '会話' : 'Conversation';
  String get settingsTooltip => isJa ? '設定' : 'Settings';
  String get conversationHistory => isJa ? '会話履歴' : 'Conversation history';
  String get initialStackchanMessage => isJa
      ? 'こんにちは、マスター。今日はどんな感じで話そうか？'
      : 'Hi, Master. What kind of conversation should we have today?';
  String get initialMasterMessage => isJa
      ? 'まずは接続と会話UIの確認をしよう。'
      : 'Let us check the connection and conversation UI first.';
  String get dummyReply => isJa
      ? '了解。M1ではここにダミー応答を表示しています。'
      : 'Got it. M1 shows a dummy response here.';
  String get talkHint => isJa ? 'テキストで話しかける' : 'Type a message';
  String get sendTooltip => isJa ? '送信' : 'Send';

  String get statusIdle => isJa ? '待機中' : 'idle';
  String get statusListening => isJa ? '聞いている' : 'listening';
  String get statusThinking => isJa ? '考え中' : 'thinking';
  String get statusSpeaking => isJa ? '話している' : 'speaking';
  String get speakerMaster => isJa ? 'マスター' : 'master';
  String get speakerGuest => isJa ? 'ゲスト' : 'guest';
  String get speakerUnknown => isJa ? '未識別' : 'unknown';
  String get familiarity => isJa ? 'なじみ度' : 'Familiarity';
  String get affection => isJa ? '好感度' : 'Affection';

  String get settingsTitle => isJa ? '設定' : 'Settings';
  String get settingsHeading =>
      isJa ? '必要なところだけ先に整える' : 'Set up only what matters first';
  String get settingsDescription => isJa
      ? '詳細設定は後続フェーズで折りたたみ可能な構成に拡張します。'
      : 'Advanced settings will become collapsible in later phases.';
  String get stackchanConnection =>
      isJa ? 'ｽﾀｯｸﾁｬﾝ接続' : 'Stack-chan connection';
  String get stackchanConnectionSubtitle => 'WebSocket / SoftAP / STA';
  String get voice => isJa ? '音声' : 'Voice';
  String get voiceSubtitle => 'Stack-chan mic / speaker / ASR / TTS';
  String get aiModel => isJa ? 'AIモデル' : 'AI models';
  String get aiModelSubtitle => 'OpenAI compatible / llama.cpp / LiteRT-LM';
  String get masterRecognition => isJa ? 'マスター認識' : 'Master recognition';
  String get masterRecognitionSubtitle => isJa
      ? '顔と声の optional local-only interaction'
      : 'Optional local-only face and voice interaction';
  String get characterSettings => isJa ? 'キャラ設定' : 'Character settings';
  String get characterSettingsSubtitle =>
      isJa ? 'トーン / 好感度 / プロンプト' : 'Tone / affection / prompt';
  String get background => isJa ? 'バックグラウンド' : 'Background';
  String get backgroundSubtitle => 'Android Foreground Service planning';
  String get dataLicenses => isJa ? 'データとライセンス' : 'Data and licenses';
  String get dataLicensesSubtitle => isJa
      ? 'モデル、SDK、prebuilt binary は未同梱'
      : 'No models, SDKs, or prebuilt binaries bundled';

  String get save => isJa ? '保存' : 'Save';
  String get dummySaved => isJa ? 'M1ではダミー保存です' : 'M1 uses dummy save';
  String get tabBasic => isJa ? '基本' : 'Basic';
  String get tabAffection => isJa ? '好感度' : 'Affection';
  String get tabReaction => isJa ? '反応' : 'Reactions';
  String get tabPrompt => isJa ? 'プロンプト' : 'Prompt';
  String get tabTest => isJa ? 'テスト' : 'Test';
  String get masterName => isJa ? 'マスター呼び名' : 'Master name';
  String get basePrompt => isJa ? 'ベースプロンプト' : 'Base prompt';
  String get promptHint => isJa ? 'プロンプトを入力' : 'Enter prompt';
  String get promptPreview => isJa ? 'プロンプトプレビュー' : 'Prompt preview';
  String get partner => isJa ? '相手' : 'Partner';
  String get identity => isJa ? '識別' : 'Identity';
  String get state => isJa ? '状態' : 'State';
  String get testConversation => isJa ? 'テスト会話' : 'Test conversation';
  String get testInput => isJa ? 'テスト入力' : 'Test input';
  String get unavailableInM1 => isJa ? 'M1では未接続' : 'Unavailable in M1';

  String get defaultMasterName => isJa ? 'マスター' : 'Master';
  String get defaultBasePrompt => isJa
      ? 'あなたは小さな相棒のｽﾀｯｸﾁｬﾝです。短く、あたたかく、相手に寄り添って会話します。'
      : 'You are Stack-chan, a tiny companion. Reply briefly, warmly, and with care for the person you are talking to.';
}
