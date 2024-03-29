class AccountQueries {
  static const String MyProfileAccountQuery = '''
    query GetMyProfileData {
      me {
        id,
        pk,
        firstName,
        lastName,
        fullName,
        certificateName
        certificateNameConfirm
        email,
        gender,
        phoneNumber,
        phoneNumber2,
        phoneNumber3
        isAttachmentTransactionManager
        isPyramidAdmin
        isPyramidMarketer
        userCurrency
      }
    }
  ''';
}
