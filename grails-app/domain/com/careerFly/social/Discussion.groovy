package com.careerFly.social
import com.careerFly.user.User
import com.careerFly.file.StoredFile
import com.careerFly.taggable.Tag

class Discussion {

    String title
    String body
    String link
    Long upVotes
    Long downVotes
    User author
    static hasMany = [tags: Tag]
    StoredFile file

    static constraints = {
    }
}
