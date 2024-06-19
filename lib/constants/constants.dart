class Settings {
//  static const String SERVER_URL = 'http://113.193.225.56:8080/POCMobile/api/';// <-- Local link

//https://edouat.kalelogistics.com/DOAPI/api/ <-- UAT Link
//https://edo.kalelogistics.com/DOAPI/api/ <-- Dev Link
//https://pcs.codexcommunity.com/THWebAPI/api/ <-- Live link


  static const String SERVER_URL =
      'https://pcs.codexcommunity.com/THWebAPI/api/';

  static const SERVICES = {
    "Login": "DOAPILogin",
    "ViewDO": "GetViewDoPrint",
    "DoDetails": "MobileDOIssue",
    "CargoRelease": "MobileCargoRelease",
    "DoTrackAndTrace": "DoQrCode",
    // "ShipmentDetails": "getBookSlotData",
    // "SlotsAvailable": "getSlot",
    // "SaveSlotBooking": "InsertSlotData",
    // "ApproveReject": "ApproveReject",
    // "PortTerminalList": "PortTerminal",
    // "PortData": "PortData",
    // "InsertSlotData": "InsertSlotData",
    // "ForgotPassword": "ForgotPassword",
  };

  static const SMTP_CREDENTIALS = {
    "Host": "smtp25.elasticemail.com",
    "Username": "kalelogisticsandy@gmail.com",
    "Password": "60f0fd9e-84b6-4baa-9983-db9a021e69f7",
    "From": "kalelogisticsandy@gmail.com"
  };
}
