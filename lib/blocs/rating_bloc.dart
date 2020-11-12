import 'dart:async';

class RatingBloc {
  int rating;
  final myStreamController = StreamController<int>.broadcast();
  StreamSink<int> get ratingSink => myStreamController.sink;
  Stream<int> get ratingStream => myStreamController.stream;

  RatingBloc() {
    rating = 0;
    ratingStream.listen((event) {
      rating = event;
      return rating;
    });
  }

  void closeBloc() {
    myStreamController.close();
  }
}
