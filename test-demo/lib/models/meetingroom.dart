class MeetingRoom {
  final String name;

  final String image;

  final String population;

  final String country;

  MeetingRoom({this.name, this.image, this.population, this.country});

  static List<MeetingRoom> allRooms() {
    var roomes = List<MeetingRoom>();

    roomes.add(MeetingRoom(
      name: "Delhi",
      country: "India",
      population: "19 mill",
      image: "assets/delhi.png",
    ));
    roomes.add(MeetingRoom(
      name: "London",
      country: "Britain",
      population: "8 mill",
      image: "assets/london.png",
    ));
    roomes.add(MeetingRoom(
      name: "shanghai",
      country: "Canada",
      population: "2.4 mill",
      image: "assets/shanghai.png",
    ));
    roomes.add(MeetingRoom(
      name: "New York",
      country: "USA",
      population: "8.1 mill",
      image: "assets/nowyork.png",
    ));
    roomes.add(MeetingRoom(
      name: "Chicago",
      country: "France",
      population: "2.2 mill",
      image: "assets/chicago.png",
    ));
    roomes.add(MeetingRoom(
      name: "Berlin",
      country: "Germany",
      population: "3.7 mill",
      image: "assets/berlin.png",
    ));
    return roomes;
  }
}
