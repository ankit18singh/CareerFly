package com.careerfly.social
import com.careerfly.user.User

class Comment {

    String body
    Long upVotes
    Long downVotes
    User author
    CommentEntity entity
    Long entityID

    static constraints = {
    }
}
class CommentEntity {
    enum entity{
        DISCUSSION, COMMENT, QUESTION
    }

}
