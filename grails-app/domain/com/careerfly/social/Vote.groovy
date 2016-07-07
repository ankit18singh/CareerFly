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
    UP(1), DOWN(2)
}
enum VoteEntity {
    DISCUSSION(1), COMMENT(2)
}