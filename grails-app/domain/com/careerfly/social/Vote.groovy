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

class VoteEntity{
    enum entity{
        DISCUSSION, COMMENT
    }
}
class VoteType{
    enum type{
        UP, DOWN
    }
}