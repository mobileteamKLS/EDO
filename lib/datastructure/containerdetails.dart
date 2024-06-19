class ContainerDetails {
  final int CntId;
  final int DoRequestId;
  final int HBLid;
  final String ContainerNo;
  final String Size;
  final String Type;
  final String TruckNo;
  final String Weight;
  final bool isCargoRelease;
  final String CargoDateTime;

  ContainerDetails({
    required this.CntId,
    required this.DoRequestId,
    required this.HBLid,
    required this.ContainerNo,
    required this.Size,
    required this.Type,
    required this.TruckNo,
    required this.Weight,
    required this.isCargoRelease,
    required this.CargoDateTime,
  });

  factory ContainerDetails.fromJson(Map<String, dynamic> json) {
    return ContainerDetails(
      CntId: json['CntId'],
      DoRequestId: json['DoRequestId'],
      HBLid: json['HBLid'],
      ContainerNo: json['ContainerNo'],
      Size: json['Size'],
      Type: json['Type'],
      TruckNo: json['TruckNo'],
      Weight: json['Weight'],
      isCargoRelease: json['isCargoRelease'],
      CargoDateTime: json['CargoDateTime'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["CntId"] = CntId;
    map["DoRequestId"] = DoRequestId;
    map["HBLid"] = HBLid;
    map["ContainerNo"] = ContainerNo;
    map["Size"] = Size;
    map["Type"] = Type;
    map["TruckNo"] = TruckNo;
    map["Weight"] = Weight;
    map["isCargoRelease"] = isCargoRelease;
    map["CargoDateTime"] = CargoDateTime;

    return map;
  }
}
