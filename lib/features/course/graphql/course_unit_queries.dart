class CourseUnitQueries {
  static const GetAllCourseUnitsByCourseQuery = '''
      query GetAllCourseUnitsByCourseID(\$cursor: String, \$limit: Int, \$courseID: ID) {
        allCourseUnits(course: \$courseID, after: \$cursor, first: \$limit) {
          pageInfo {
            startCursor, 
            endCursor,
            hasNextPage,
            hasPreviousPage
          },
          totalCount,
          edgeCount,
          edges {
            node {
              id,
              pk,
              title,
              isExternal
              external {

                id
                pk
                courseunitcontentSet{
                  totalCount
                  edges{
                    node{
                      id
                      pk
                      order
                      isFree
                      isMandatory
                      modelName
                      modelValue
                      courseUnit {
                        id,
                        pk,
                        title
                        course {
                          id
                          pk
                        }
                      }
                    }
                  }
                }
              }
              courseunitcontentSet {
                edges {
                  node {
                    id,
                    pk,
                    isFree,
                    isMandatory,
                    modelName,
                    modelValue,
                    courseUnit {
                      id,
                      pk,
                      title
                      course {
                        id
                        pk
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
  ''';
}
