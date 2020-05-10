class Member {
  final String name;
  final String image;
  final String role;
  final int goalRatio;
  final bool accepted;

  Member({this.name, this.image, this.role, this.goalRatio, this.accepted});

  factory Member.fromJson(json) {
    return Member(
      name: json['name'],
      image: json['image'],
      role: json['role'],
      goalRatio: json['goalRatio'],
      accepted: json['accepted']
    );
  }
}