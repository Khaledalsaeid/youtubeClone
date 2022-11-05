class Statistics{
  String viewCount,
  likeCount,
  favoriteCount
  ,commentCount;

  Statistics({
      this.viewCount, this.likeCount, this.favoriteCount, this.commentCount});

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      viewCount: json["viewCount"],
      likeCount: json["likeCount"],
      favoriteCount: json["favoriteCount"],
      commentCount: json["commentCount"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "viewCount": this.viewCount,
      "likeCount": this.likeCount,
      "favoriteCount": this.favoriteCount,
      "commentCount": this.commentCount,
    };
  } 
//


}