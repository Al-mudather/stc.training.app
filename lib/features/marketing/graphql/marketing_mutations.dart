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
  static const String WithDrawPyramidBalanceMutation = '''
    mutation WithdrawPyramidBalance(\$amount: Float!, \$input: MakePyramidWithdrawInput!) {

  makePyramidWithdraw(amount:\$amount, input: \$input) {

      success
      errors
      pyramidWithdraw: instance {
        id
        pk
        pyramidAccount {
            pk
        }
        amount
        isDone
        created
        updated
      }

  }

}
  ''';
}
