class MyMarketingQueries {
  static const MyPyramidAccountQuery = '''
    query MyPyramidAccount {

      myPyramidAccount {
        id
        pk
        pyramidId
        user {
          pk
        }
        parent {
          pk
        }
        pyramidCode
        isBlocked
        isAdmin
        isSuperuser
        created
        updated

      }

    }
  ''';
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
    query MyPyramidWithdraws(\$filters: JSONString, \$orderBy: [String],\$cursor: String, \$limit: Int,) {
      myPyramidWithdraws(filters: \$filters, orderBy: \$orderBy,after: \$cursor, first: \$limit,) {
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
