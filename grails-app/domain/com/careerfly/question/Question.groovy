package com.careerfly.question

import com.careerfly.taggable.Tag
import com.careerfly.user.User

class Question {

    User author
    String title
    String body
    String answer
    String choice1
    String choice2
    String choice3
    String choice4
    Date dateCreated
    Date lastUpdated
    Set tags
    static hasMany = [tags: Tag]

    static mapping = {
        body type: "text"
    }

    static constraints = {
    }

}
