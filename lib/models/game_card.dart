class GameCard {
  final int id;
  final platforms;
  final String title;
  final String image;
  final String description;

  GameCard(this.id, this.platforms, this.title, this.image, this.description);

  GameCard.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        platforms = json["platforms"],
        title = json["name"],
        image = json["image"],
        description = json["deck"];
}
