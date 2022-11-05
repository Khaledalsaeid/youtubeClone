class Default{
  String url;
  int width,height;

  Default({this.url,this.width, this.height});

  Map<String, dynamic> toJson() {
    return {
      "url": this.url,
      "width": this.width,
      "height": this.height,
    };


  }

  factory Default.fromJson(Map<String, dynamic> json) {
    return Default(
      url: json["url"],
      width: int.parse(json["width"]),
      height: json["height"],
    );
  }
//

}

class Thumbnails{
  Default thumbnailsDefault;
  Default medium;
  Default high;

  Thumbnails({this.thumbnailsDefault, this.medium, this.high});

  factory Thumbnails.fromJson(Map<String, dynamic> json) {
    return Thumbnails(
      thumbnailsDefault: Default.fromJson(json["thumbnailsDefault"]),
      medium: Default.fromJson(json["medium"]),
      high: Default.fromJson(json["high"]),
    );

  }

  Map<String, dynamic> toJson() {
    return {
      "thumbnailsDefault": this.thumbnailsDefault,
      "medium": this.medium,
      "high": this.high,
    };
  }

//

}

class Snippet{
  Thumbnails thumbnails;
  DateTime publishAt;
  DateTime publishTime;
  String description,title,channelId,liveBroadcastContent,channelTitle;

  Snippet({this.thumbnails, this.publishAt, this.publishTime, this.description,
      this.title, this.channelId, this.liveBroadcastContent, this.channelTitle});

  Map<String, dynamic> toJson() {
    return {
      "thumbnails": this.thumbnails,
      "publishAt": this.publishAt.toIso8601String(),
      "publishTime": this.publishTime.toIso8601String(),
      "description": this.description,
      "title": this.title,
      "channelId": this.channelId,
      "liveBroadcastContent": this.liveBroadcastContent,
      "channelTitle": this.channelTitle,
    };
  }

  factory Snippet.fromJson(Map<String, dynamic> json) {
    return Snippet(
      thumbnails: Thumbnails.fromJson(json["thumbnails"]),
      publishAt: DateTime.parse(json["publishAt"]),
      publishTime: DateTime.parse(json["publishTime"]),
      description: json["description"],
      title: json["title"],
      channelId: json["channelId"],
      liveBroadcastContent: json["liveBroadcastContent"],
      channelTitle: json["channelTitle"],
    );
  }
//

}
class Id{
  String playlistId;
  String kind;

  Id({this.playlistId, this.kind});

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(
      playlistId: json["playlistId"],
      kind: json["kind"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "playlistId": this.playlistId,
      "kind": this.kind,
    };
  }

//

}

class Video{
  Snippet snippet;
  Id id;
  String etag;
  String kind;

  Video({this.snippet, this.id, this.etag, this.kind});

  Map<String, dynamic> toJson() {
    return {
      "snippet": this.snippet,
      "id": this.id,
      "etag": this.etag,
      "kind": this.kind,
    };
  }

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      snippet: Snippet.fromJson(json["snippet"]),
      id: Id.fromJson(json["id"]),
      etag: json["etag"],
      kind: json["kind"],
    );
  }
//

}

class YoutubeVideoResult{
  int totalResults;
  int resultsPerPage;
  String nextPageToken;
  List<Video> items;

  YoutubeVideoResult(
      {this.totalResults, this.resultsPerPage, this.nextPageToken, this.items});

  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) {
    return YoutubeVideoResult(
      totalResults: int.parse(json["totalResults"]),
      resultsPerPage: int.parse(json["resultsPerPage"]),
      nextPageToken: json["nextPageToken"],
      items: List.of(json["items"])
          .map((i) => i /* can't generate it properly yet */)
          .toList(),
    );
  }
//

}