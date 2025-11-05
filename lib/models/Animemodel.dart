class Anime {
  final int? id;
  final String? title;
  final String? Image;

  Anime({
    required this.id,
    required this.title,
    required this.Image,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['id'],
      title: json['title']?['english'],
      Image: json['coverImage']?['large'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': {'english': title,
        'coverImage': {'large': Image,
        }
      }
    };
  }
}
