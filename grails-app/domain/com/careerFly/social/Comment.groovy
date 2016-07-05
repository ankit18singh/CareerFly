package com.careerFly.social
import com.careerFly.user.User

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
