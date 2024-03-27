class MarketingMutations {
  static const String CollectTheRewardsMutation = '''
    mutation ClaimPyramidLedgerBalance(\$input: ClaimPyramidLedgerBalanceInput!) {

  claimPyramidLedgerBalance(input: \$input) {

      success
      errors
      pyramidBalance: instance {

        id
        pk
        balance
        created
        updated

      }

  }

}
  ''';
}
