import 'package:youtubeclone/app/model/default.dart';

import 'statistics.dart';

class Youtuber{
  Statistics statistics;
  Snippet snippet;

  Youtuber({this.statistics, this.snippet});

  factory Youtuber.fromJson(Map<String, dynamic> json) {
    return Youtuber(
      statistics: Statistics.fromJson(json["statistics"]),
      snippet: Snippet.fromJson(json["snippet"]),
    );
  }
//

}