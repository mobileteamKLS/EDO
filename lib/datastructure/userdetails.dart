class UserDetails {
  final int UserId;
  final int UserAccountTypeId;
  final String FirstName;
  final String MiddleName;
  final String LastName;
  final int OrganizationId;
  final int OrganizationBranchId;
  final String BranchName;
  final bool IsExternalUser;
  final String Password;
  final String Salt;
  final bool IsUserActive;
  final bool IsOrganizationActive;
  final bool IsOrganizationBranchActive;
  final String OrgTypeName;
  final String OrgName;

  UserDetails(
      {required this.UserId,
      required this.UserAccountTypeId,
      required this.FirstName,
      required this.MiddleName,
      required this.LastName,
      required this.OrganizationId,
      required this.OrganizationBranchId,
      required this.BranchName,
      required this.IsExternalUser,
      required this.Password,
      required this.Salt,
      required this.IsUserActive,
      required this.IsOrganizationActive,
      required this.IsOrganizationBranchActive,
      required this.OrgTypeName,
      required this.OrgName});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
        UserId: json['UserId'],
        UserAccountTypeId: json['UserAccountTypeId'],
        FirstName: json['FirstName'],
        MiddleName: json['MiddleName'] == null ? " " : json['MiddleName'],
        LastName: json['LastName'],
        OrganizationId: json['OrganizationId'],
        OrganizationBranchId: json['OrganizationBranchId'],
        BranchName: json['BranchName'],
        IsExternalUser: json['IsExternalUser'],
        Password: json['Password'],
        Salt: json['Salt'],
        IsUserActive: json['IsUserActive'],
        IsOrganizationActive: json['IsOrganizationActive'],
        IsOrganizationBranchActive: json['IsOrganizationBranchActive'],
        OrgTypeName: json['OrgTypeName'],
        OrgName: json['OrgName']);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["UserId"] = UserId;
    map["UserAccountTypeId"] = UserAccountTypeId;
    map["FirstName"] = FirstName;
    map["MiddleName"] = MiddleName;
    map["LastName"] = LastName;
    map["OrganizationId"] = OrganizationId;
    map["OrganizationBranchId"] = OrganizationBranchId;
    map["BranchName"] = BranchName;
    map["IsExternalUser"] = IsExternalUser;
    map["Password"] = Password;
    map["Salt"] = Salt;
    map["IsUserActive"] = IsUserActive;
    map["IsOrganizationActive"] = IsOrganizationActive;
    map["IsOrganizationBranchActive"] = IsOrganizationBranchActive;
    map["OrgTypeName"] = OrgTypeName;
    map["OrgName"] = OrgName;

    return map;
  }
}
