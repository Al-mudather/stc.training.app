class EnrollmentQueries {
  //TODO: FIlter the instructors so only the ones those there fullName is
  // filled to be displied
  static const GETAllEnrollmentsForCurrentUserQuery = '''
        query AllEnrollmentsForCurrentUser(\$cursor: String, \$limit: Int, \$filters: JSONString,){
  allEnrollmentsForCurrentUserV2(after: \$cursor, first: \$limit,filters: \$filters){
    pageInfo {
      startCursor,
      endCursor,
      hasNextPage,
      hasPreviousPage
    },
    edges{
      node{
        id,
        pk,
        course{
          id,
          pk,
          title,
          cover,
          courseunitSet{
            totalCount,
            edgeCount,
            edges{
              node {
                id,
                pk,
                courseunitcontentSet {
                  totalCount,
                  edgeCount
                }
              }
            }
          }
        },
        learningprogressSet {
          totalCount,
          edgeCount,
          edges {
            node{
              id,
              pk
            }
          }
        }
      }
    }
  }
}
  ''';

  // static const GetSingleCourseByPkQuery = '''
  //   query GetCourseByID(\$coursePk:Int) {
  //     course(id:\$coursePk) {
  //       id,
  //       pk,
  //       courseHours,
  //       title,
  //       profile,
  //       cover,
  //       courseFee,
  //       courseFeeInSdg,
  //       currency,
  //       brief,
  //       isPaid,
  //       enrollmentCount
  //       courseinstructorSet {
  //         edges {
  //           node {
  //             id,
  //             pk,
  //             isMainInstructor,
  //             instructor {
  //               id,
  //               qualification,
  //               image,
  //               user {
  //                 id,
  //                 firstName,
  //                 lastName
  //               }
  //             }
  //           }
  //         }
  //       },
  //       courseunitSet {
  //         edges {
  //           node{
  //             id,
  //             courseunitcontentSet {
  //               totalCount,
  //               edges {
  //                 node {
  //                   id,
  //                   modelName,
  //                   modelValue
  //                 }
  //               }
  //             }
  //           }
  //         }
  //       },
  //       courseSpeciality {
  //         id,
  //         pk
  //       },
  //       courseLanguage{
  //         id,
  //         pk,
  //         languageName,
  //         languageCode
  //       }
  //     }
  //   }
  // ''';
}
