class MyMarketingQueries {
  static const MyPyramidAffiliates = '''
    query MyPyramidAffiliates {
      myPyramidAffiliates 
    }
  ''';
  static const MyPyramidBalance = '''
    query MyPyramidBalance {

      myPyramidBalance {
          
        id
        pk
        balance
      }
    }
  ''';
  static const MyPyramidLedgerRewardQuery = '''
    query MyPyramidLedgerReward {

      myPyramidLedgerReward

    }
  ''';

  static const MyPyramidWithdrawsQuery = '''
    query MyPyramidWithdraws {
      myPyramidWithdraws {
          totalCount,
          edgeCount,
          pageInfo {
            startCursor, 
            endCursor,
            hasNextPage,
            hasPreviousPage
          },

          edges {

              node {

                id
                pk
                amount
                isDone
                created
                updated

              }

          }

      }

    }
  ''';
}
