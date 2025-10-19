import 'package:hive/hive.dart';

part 'vault_models.g.dart';

@HiveType(typeId: 0)
class VaultEntry extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String type; // 'scan' or 'council'

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String content;

  @HiveField(4)
  final DateTime timestamp;

  @HiveField(5)
  final Map<String, dynamic> metadata;

  VaultEntry({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.timestamp,
    required this.metadata,
  });

  factory VaultEntry.fromScan({
    required String title,
    required String verdict,
    required int score,
    required String mentorName,
    required List<String> moves,
    required String quote,
  }) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    return VaultEntry(
      id: id,
      type: 'scan',
      title: title,
      content: verdict,
      timestamp: DateTime.now(),
      metadata: {
        'score': score,
        'mentor': mentorName,
        'moves': moves,
        'quote': quote,
      },
    );
  }

  factory VaultEntry.fromCouncil({
    required String echo,
    required String winnerName,
    required String mode,
    required List<String> responses,
  }) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    return VaultEntry(
      id: id,
      type: 'council',
      title: 'Council Verdict - ${mode.toUpperCase()}',
      content: echo,
      timestamp: DateTime.now(),
      metadata: {
        'winner': winnerName,
        'mode': mode,
        'responses': responses,
      },
    );
  }
}

