class CategoryQueries {
  //TODO: FIlter the instructors so only the ones those there fullName is
  // filled to be displied
  static const GETAllCourseSpecialitiesQuery = '''
        query GetAllCourseSpecialities(
        \$first:Int,
      ) {
      allCourseSpecialities(
          first:\$first,
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
            speciality
            courseSet {
              totalCount
            }
          }
        }
      }
    }
  ''';

  static const GetSingleCourseSpecialityByPkQuery = '''
    query GetCourseSpecialityByPk(\$coursePk:Int) {
      courseSpeciality(id:\$coursePk) {
        id,
        pk,
        speciality
        courseSet {
          totalCount
        }
      }
    }
  ''';
}
