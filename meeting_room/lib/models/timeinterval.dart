class TimeInterval {
  final String time;

  TimeInterval({this.time});
  static List<TimeInterval> timeIntervallist() {
    var timeList = List<TimeInterval>();

    timeList.add(TimeInterval(time: "9:30"));
    timeList.add(TimeInterval(time: "10:30"));
    timeList.add(TimeInterval(time: "11:30"));
    timeList.add(TimeInterval(time: "13:30"));
    timeList.add(TimeInterval(time: "14:30"));
    timeList.add(TimeInterval(time: "15:30"));
    timeList.add(TimeInterval(time: "16:30"));
    timeList.add(TimeInterval(time: "17:30"));
    timeList.add(TimeInterval(time: "18:30"));

    return timeList;
  }
}
