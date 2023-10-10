class Blog {
  final String title;
  final String imageUrl;
  final String id;

  Blog({required this.title, required this.id, required this.imageUrl});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
        title: json['title'], id: json['id'], imageUrl: json['image_url']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'image_url': imageUrl};
  }
}
