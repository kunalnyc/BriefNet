class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String videoUrl;
  final String category;
  final int duration; // Duration of the video in seconds
  final DateTime uploadDate;

  Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.category,
    required this.duration,
    required this.uploadDate,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
      videoUrl: json['videoUrl'],
      category: json['category'],
      duration: json['duration'],
      uploadDate: DateTime.parse(json['uploadDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'thumbnailUrl': thumbnailUrl,
      'videoUrl': videoUrl,
      'category': category,
      'duration': duration,
      'uploadDate': uploadDate.toIso8601String(),
    };
  }
}
