import 'dart:async';

class NumberCounter {

  final _timedStreamController = StreamController<int>();

  late Timer _timer;

  int counter = 0;

  NumberCounter();

  Stream<int> get stream => _timedStreamController.stream;

  void startTimer() {
    ///assign the timer and also starts the timer
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      print('Counting $counter');
      _timedStreamController.sink.add(counter + 1);
      counter ++;
    });
  }

  void stopTime() {
    _timedStreamController.sink.add(0);
    _timer.cancel();
  }

}