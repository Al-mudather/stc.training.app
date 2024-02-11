class InstructorQueries {
  //TODO: FIlter the instructors so only the ones those there fullName is
  // filled to be displied
  static const GETAllHomePageSlidersQuery = '''
    fragment CourseFragments on CourseNode {
      pk
      id
      title
      cover
      brief
    }    
      

    query AllHomePageSliders{

      allHomePageSliders(
        orderBy: ["-id"],
        isPublished: true
      ){
        pageInfo {
          endCursor
          startCursor
          hasNextPage
          hasPreviousPage
        }

        edges {

          node {
              
            # here the slider is defined by fragments
            slide {
              ...CourseFragments
            }
            objectId
            id
            pk    
            isPublished
            startDate
            endDate
          }

        }

      }

    }
  ''';
}
