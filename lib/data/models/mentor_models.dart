import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'mentor_models.g.dart';

@JsonSerializable()
class MentorRequest extends Equatable {
  final String
      mentor; // "casanova|cleopatra|machiavelli|sun_tzu|marcus_aurelius|churchill"
  final String preset; // "drill|advise|roleplay|chat"
  @JsonKey(name: 'user_text')
  final String userText;
  final MentorOptions options;

  const MentorRequest({
    required this.mentor,
    required this.preset,
    required this.userText,
    required this.options,
  });

  factory MentorRequest.fromJson(Map<String, dynamic> json) =>
      _$MentorRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MentorRequestToJson(this);

  @override
  List<Object?> get props => [mentor, preset, userText, options];
}

@JsonSerializable()
class MentorOptions extends Equatable {
  final bool stream;
  @JsonKey(name: 'safe_mode')
  final bool safeMode;

  const MentorOptions({
    required this.stream,
    required this.safeMode,
  });

  factory MentorOptions.fromJson(Map<String, dynamic> json) =>
      _$MentorOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$MentorOptionsToJson(this);

  @override
  List<Object?> get props => [stream, safeMode];
}

@JsonSerializable()
class MentorResponse extends Equatable {
  final bool success;
  final String mentor;
  final String preset;
  final String reply;
  final List<String>? tips;
  final MentorTokens? tokens;

  const MentorResponse({
    required this.success,
    required this.mentor,
    required this.preset,
    required this.reply,
    this.tips,
    this.tokens,
  });

  factory MentorResponse.fromJson(Map<String, dynamic> json) =>
      _$MentorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MentorResponseToJson(this);

  @override
  List<Object?> get props => [success, mentor, preset, reply, tips, tokens];
}

@JsonSerializable()
class MentorTokens extends Equatable {
  final int prompt;
  final int completion;

  const MentorTokens({
    required this.prompt,
    required this.completion,
  });

  factory MentorTokens.fromJson(Map<String, dynamic> json) =>
      _$MentorTokensFromJson(json);
  Map<String, dynamic> toJson() => _$MentorTokensToJson(this);

  @override
  List<Object?> get props => [prompt, completion];
}

// Realm definitions for mentor universe
class MentorRealm extends Equatable {
  final String id;
  final String name;
  final String subtitle;
  final List<String> gradient; // Gradient colors for realm card
  final String icon; // Emoji icon for realm

  const MentorRealm({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.gradient,
    required this.icon,
  });

  @override
  List<Object?> get props => [id, name, subtitle, gradient, icon];
}

// Mentor definitions (now 80 mentors across 12 realms)
class Mentor extends Equatable {
  final String id;
  final String name;
  final String subtitle;
  final String avatar;
  final String description;
  final List<String> color; // Gradient colors
  final String greeting;
  final List<String> presets; // Always: ["drill", "advise", "roleplay", "chat"]
  final String realm; // Which realm this mentor belongs to
  final String imagePath; // Path to mentor portrait asset
  final String longDescription; // 2-3 line description for mentor card

  const Mentor({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.avatar,
    required this.description,
    required this.color,
    required this.greeting,
    required this.presets,
    required this.realm,
    required this.imagePath,
    required this.longDescription,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        subtitle,
        avatar,
        description,
        color,
        greeting,
        presets,
        realm,
        imagePath,
        longDescription
      ];
}
