package com.careerFly.social
import com.careerFly.user.User

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