class InstructorQueries {
  //TODO: FIlter the instructors so only the ones those there fullName is
  // filled to be displied
  static const GETAllInstructorsQuery = '''
    query GetAllInstructorsQuery {
      allInstructors{
        totalCount,
        edgeCount,
        pageInfo {
          hasNextPage
          endCursor
        },
        edges{
          node {
            id
            pk
            user {
              id
              pk
              fullName
            }
            qualification
            image
          }
        }
      }
    }
  ''';
}
