package com.careerfly.social
import com.careerfly.user.User

class Comment {

    String body
    Long upVotes
    Long downVotes
    User author
    enum CommentEntity{
        DISCUSSION,COMMENT,QUESTION
    }
    CommentEntity entity
    Long entityID
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }
}
