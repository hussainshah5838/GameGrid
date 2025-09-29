import 'package:xml/xml.dart';
class ScoresResponse {
  final String sport;
  final String updated;
  final List<Category> categories;

  ScoresResponse({
    required this.sport,
    required this.updated,
    required this.categories,
  });

  factory ScoresResponse.fromXml(XmlDocument document) {
    final scoresElement = document.getElement('scores');
    if (scoresElement == null) {
      throw Exception('No <scores> element found');
    }

    final sport = scoresElement.getAttribute('sport') ?? '';
    final updated = scoresElement.getAttribute('updated') ?? '';

    final categories = scoresElement.findElements('category').map((c) {
      return Category.fromXml(c);
    }).toList();

    return ScoresResponse(
      sport: sport,
      updated: updated,
      categories: categories,
    );
  }
}

class Category {
  final String name;
  final String id;
  final String gid;
  final String fileGroup;
  final bool isCup;
  final List<Match> matches;

  Category({
    required this.name,
    required this.id,
    required this.gid,
    required this.fileGroup,
    required this.isCup,
    required this.matches,
  });

  factory Category.fromXml(XmlElement element) {
    final matchesElement = element.getElement('matches');
    final matches = <Match>[];

    if (matchesElement != null) {
      for (final match in matchesElement.findElements('match')) {
        matches.add(Match.fromXml(match));
      }
    }

    return Category(
      name: element.getAttribute('name') ?? '',
      id: element.getAttribute('id') ?? '',
      gid: element.getAttribute('gid') ?? '',
      fileGroup: element.getAttribute('file_group') ?? '',
      isCup: (element.getAttribute('iscup') ?? '').toLowerCase() == 'true',
      matches: matches,
    );
  }
}

class Match {
  final String id;
  final String date;
  final String formattedDate;
  final String time;
  final String status;
  final String venue;
  final Team localTeam;
  final Team visitorTeam;
  final String? halfTimeScore;
  final String? fullTimeScore;

  Match({
    required this.id,
    required this.date,
    required this.formattedDate,
    required this.time,
    required this.status,
    required this.venue,
    required this.localTeam,
    required this.visitorTeam,
    this.halfTimeScore,
    this.fullTimeScore,
  });

  factory Match.fromXml(XmlElement element) {
    return Match(
      id: element.getAttribute('id') ?? '',
      date: element.getAttribute('date') ?? '',
      formattedDate: element.getAttribute('formatted_date') ?? '',
      time: element.getAttribute('time') ?? '',
      status: element.getAttribute('status') ?? '',
      venue: element.getAttribute('venue') ?? '',
      localTeam: Team.fromXml(element.getElement('localteam')!),
      visitorTeam: Team.fromXml(element.getElement('visitorteam')!),
      halfTimeScore: element.getElement('ht')?.getAttribute('score'),
      fullTimeScore: element.getElement('ft')?.getAttribute('score'),
    );
  }

  bool get isLive =>
      status != 'FT' &&
      status != 'Postp.' &&
      status != 'Susp.' &&
      !status.contains(':');

  bool get isFinished => status == 'FT';
  bool get isScheduled => status.contains(':');
}

class Team {
  final String id;
  final String name;
  final String goals;

  Team({
    required this.id,
    required this.name,
    required this.goals,
  });

  factory Team.fromXml(XmlElement element) {
    return Team(
      id: element.getAttribute('id') ?? '',
      name: element.getAttribute('name') ?? '',
      goals: element.getAttribute('goals') ?? '?',
    );
  }
}
