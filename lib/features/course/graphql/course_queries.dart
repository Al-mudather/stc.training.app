class CourseQueries {
  //TODO: FIlter the instructors so only the ones those there fullName is
  // filled to be displied
  static const GETAllCoursesQuery = '''
        query GetAllCourses(
        \$first:Int,
        \$cursor: String,
        \$orderBy:[String],
        \$execludeIds:[Int],
        \$filters: JSONString,
      ) {
      allCourses(
          first:\$first,
          after: \$cursor,
          orderBy:\$orderBy,
          execludeIds:\$execludeIds,
          filters: \$filters
        ) {
        totalCount,
        edgeCount,
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
            title,
            isPaid,
            courseFee,
            courseFeeInSdg,
            profile,
            cover,
            currency,
            courseSpeciality {
              id,
              pk
            },
            courseinstructorSet {
              edges{
                node{
                  id,
                  isMainInstructor,
                  instructor{
                    id,
                    user {
                      id,
                      fullName,
                      firstName,
                      lastName
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

  static const GetSingleCourseByPkQuery = '''
    query GetCourseByID(\$coursePk:Int) {
      course(id:\$coursePk) {
        id,
        pk,
        courseHours,
        title,
        profile,
        cover,
        courseFee,
        courseFeeInSdg,
        currency,
        brief,
        isPaid,
        enrollmentCount
        courseinstructorSet {
          edges {
            node {
              id,
              pk,
              isMainInstructor,
              instructor {
                id,
                qualification,
                image,
                user {
                  id,
                  firstName,
                  lastName
                }
              }
            }
          }
        },
        courseunitSet {
          edges {
            node{
              id,
              courseunitcontentSet {
                totalCount,
                edges {
                  node {
                    id,
                    modelName,
                    modelValue
                  }
                }
              }
            }
          }
        },
        courseSpeciality {
          id,
          pk
        }, 
        courseLanguage{
          id,
          pk,
          languageName,
          languageCode
        }
      }
    }
  ''';
}
