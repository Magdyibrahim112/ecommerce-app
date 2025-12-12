class Metadata {
 const Metadata({
    required  this.currentPage,
    required  this.numberOfPages,
    required  this.limit,});

  factory Metadata.fromJson(dynamic json) {
    return Metadata(
        currentPage: json['currentPage'],
        numberOfPages: json['numberOfPages'],
        limit: json['limit']);
  }
 final int currentPage;
  final int numberOfPages;
  final int limit;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['currentPage'] = currentPage;
  //   map['numberOfPages'] = numberOfPages;
  //   map['limit'] = limit;
  //   return map;
  // }

}