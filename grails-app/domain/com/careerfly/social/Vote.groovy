package com.careerfly.social

import com.careerfly.user.User

class Vote {

    User author
    VoteEntity entity
    VoteType type
    Long entityID
    static constraints = {

    }
}
enum VoteType {
    UP, DOWN
}
enum VoteEntity {
    DISCUSSION, COMMENT
}