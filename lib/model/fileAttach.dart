class FileAttach {
  String name;
  String volume;

  FileAttach({required this.name,required this.volume});
}

List <FileAttach> files1 = [
  FileAttach(name: "helloworld.docs", volume: "300Kb"),
  FileAttach(name: "halongTrip.docs", volume: "10Kb"),
  FileAttach(name: "helloworld2.docs", volume: "30Kb"),
];

List <FileAttach> files2 = [
  FileAttach(name: "helloworld3.docs", volume: "300Kb"),
  FileAttach(name: "danangTrip.docs", volume: "10Kb"),
  FileAttach(name: "susan0175.docs", volume: "30Kb"),
];


List <FileAttach> files3 = [
  FileAttach(name: "UIUX.dart", volume: "30MB"),
  FileAttach(name: "halongTrip.docs", volume: "10Kb"),
  FileAttach(name: "helloworld2.docs", volume: "30Kb"),
];

List<List<FileAttach>> allFile = [files1,files2,files3];