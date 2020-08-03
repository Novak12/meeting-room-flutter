class MeetingRoom {
  final String name;

  final String image;

  final String status;

  final String location;

  MeetingRoom({this.name, this.image, this.status, this.location});

  static List<MeetingRoom> allRooms() {
    var rooms = List<MeetingRoom>();

    rooms.add(MeetingRoom(
      name: "Delhi",
      location: "Changzhi 5F",
      status: "今日可订",
      image: "assets/delhi.png",
    ));
    rooms.add(MeetingRoom(
      name: "London",
      location: "Changzhi 5F",
      status: "今日可订",
      image: "assets/london.png",
    ));
    rooms.add(MeetingRoom(
      name: "Shanghai",
      location: "Changzhi 6F",
      status: "今日已满",
      image: "assets/shanghai.png",
    ));
    rooms.add(MeetingRoom(
      name: "New York",
      location: "Changzhi 6F",
      status: "今日已满",
      image: "assets/nowyork.png",
    ));
    rooms.add(MeetingRoom(
      name: "Chicago",
      location: "Changzhi 6F",
      status: "今日已满",
      image: "assets/chicago.png",
    ));
    rooms.add(MeetingRoom(
      name: "Berlin",
      location: "Changzhi 6F",
      status: "今日已满",
      image: "assets/berlin.png",
    ));
    return rooms;
  }
}
