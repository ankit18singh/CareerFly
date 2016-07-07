package com.careerfly.social

import com.careerfly.user.User

class Comment {

    String body
    Long upVotes
    Long downVotes
    User author
    CommentEntity entity
    Long entityID
    Date dateCreated
    Date lastUpdated

    static constraints = {
        upVotes (minSize: 0)
        downVotes (minSize: 0)
    }
}
enum CommentEntity {
    DISCUSSION(1), COMMENT(2), QUESTION(3)
}
