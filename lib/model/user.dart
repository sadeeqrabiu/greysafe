class UserProfile {
  String? firstname;
  String? lastName;
  String? middleName;
  String? Email;
  String? Address;
  String? lga;
  String? gender;

  UserProfile();

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastName': lastName,
        'middleName': middleName,
        'Email': Email,
        'Address': Address,
        'lga': lga,
        'gender': gender
      };
}
