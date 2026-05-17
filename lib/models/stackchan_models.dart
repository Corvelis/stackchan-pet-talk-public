import '../localization/app_localizations.dart';

enum StackchanConnectionMode { softAp, sta }

enum StackchanConnectionStatus { disconnected, testing, connected }

enum SpeakerIdentity { master, guest, unknown }

enum StackchanStatus { idle, listening, thinking, speaking }

class StackchanConnectionState {
  const StackchanConnectionState({
    required this.host,
    required this.port,
    required this.mode,
    required this.status,
    this.lastMessage,
  });

  final String host;
  final int port;
  final StackchanConnectionMode mode;
  final StackchanConnectionStatus status;
  final String? lastMessage;

  String get endpoint => '$host:$port';

  StackchanConnectionState copyWith({
    String? host,
    int? port,
    StackchanConnectionMode? mode,
    StackchanConnectionStatus? status,
    String? lastMessage,
  }) {
    return StackchanConnectionState(
      host: host ?? this.host,
      port: port ?? this.port,
      mode: mode ?? this.mode,
      status: status ?? this.status,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }
}

class AffectionLevel {
  const AffectionLevel({
    required this.level,
    required this.title,
    required this.tone,
    required this.promptHint,
  });

  final int level;
  final String title;
  final String tone;
  final String promptHint;
}

class CharacterProfile {
  const CharacterProfile({
    required this.name,
    required this.masterName,
    required this.basePrompt,
    required this.affectionLevels,
    required this.reactions,
  });

  final String name;
  final String masterName;
  final String basePrompt;
  final List<AffectionLevel> affectionLevels;
  final Map<String, String> reactions;

  static CharacterProfile initial(AppStrings strings) {
    if (!strings.isJa) {
      return CharacterProfile(
        name: 'stackchan-talk',
        masterName: strings.defaultMasterName,
        basePrompt: strings.defaultBasePrompt,
        affectionLevels: const [
          AffectionLevel(
            level: 1,
            title: 'First meeting',
            tone: 'Polite and a little reserved',
            promptHint: 'Reply briefly while learning the person preferences.',
          ),
          AffectionLevel(
            level: 2,
            title: 'Familiar face',
            tone: 'Natural and friendly',
            promptHint: 'Add a small positive note.',
          ),
          AffectionLevel(
            level: 3,
            title: 'Everyday companion',
            tone: 'Casual daily conversation',
            promptHint: 'Reply as if you remember the current context.',
          ),
          AffectionLevel(
            level: 4,
            title: 'Close companion',
            tone: 'Relaxed and reassuring',
            promptHint: 'Add care and a light joke when it fits.',
          ),
          AffectionLevel(
            level: 5,
            title: 'Beloved master',
            tone: 'Openly happy without being excessive',
            promptHint: 'Show trust while keeping the tone natural.',
          ),
        ],
        reactions: const {
          'Head pats': 'React with short, happy warmth',
          'Shake': 'Do not overreact; check safety',
          'Master found': 'Call the master name and welcome them',
          'Guest voice': 'Introduce yourself politely',
        },
      );
    }

    return CharacterProfile(
      name: 'stackchan-talk',
      masterName: strings.defaultMasterName,
      basePrompt: strings.defaultBasePrompt,
      affectionLevels: [
        AffectionLevel(
          level: 1,
          title: 'はじめまして',
          tone: 'ていねいで少し控えめ',
          promptHint: '相手の好みを探りながら短く返す。',
        ),
        AffectionLevel(
          level: 2,
          title: '顔なじみ',
          tone: '自然で親しみやすい',
          promptHint: '前向きな一言を添える。',
        ),
        AffectionLevel(
          level: 3,
          title: 'いつもの相棒',
          tone: '少しくだけた日常会話',
          promptHint: '相手の文脈を覚えている雰囲気で返す。',
        ),
        AffectionLevel(
          level: 4,
          title: 'かなり仲良し',
          tone: '安心感のある距離感',
          promptHint: '気遣いと軽い冗談を入れる。',
        ),
        AffectionLevel(
          level: 5,
          title: 'だいすきなマスター',
          tone: '素直にうれしそう',
          promptHint: '甘すぎず、信頼している感じを出す。',
        ),
      ],
      reactions: {
        'なでなで': 'うれしそうに短く反応する',
        '揺れ': '驚きすぎず安全を気にする',
        'マスター発見': '名前を呼んで歓迎する',
        'ゲスト声': '丁寧に自己紹介する',
      },
    );
  }
}
