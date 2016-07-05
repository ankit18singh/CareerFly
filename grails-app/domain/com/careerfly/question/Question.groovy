package com.careerfly.question

import com.careerfly.taggable.Tag
import com.careerfly.user.User

class Question {
    String title
    String body
    static hasMany = [tags: Tag]
    Set tags
    User author
    String answer
    String choice1
    String choice2
    String choice3
    String choice4
    Date dateCreated
    Date lastUpdated

    static constraints = {
        title(matches: "[a-z,A-Z,0-9, ]+")
        body(matches: "[a-z,A-Z,0-9, ]+")

    }
}
