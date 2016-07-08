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
        upVotes (min: 0l)
        downVotes (min: 0l)
    }
}
enum CommentEntity {

    DISCUSSION(1), COMMENT(2), QUESTION(3)
    int id

    CommentEntity(int id){
        this.id = id
    }
}
