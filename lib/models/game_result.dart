import 'game_card.dart';

class GameResult {
  final int pageIndex;
  final int totalResults;
  final int totalPages;
  final List<GameCard> games;

  GameResult.fromJson(Map<String, dynamic> json)
      : pageIndex = json['page'],
        totalResults = json['number_of_total_results'],
        totalPages = json['number_of_page_results'],
        games = (json['results'] as List)
            .map((json) => GameCard.fromJson(json))
            .toList();
}
