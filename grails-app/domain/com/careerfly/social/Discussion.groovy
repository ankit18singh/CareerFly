package com.careerfly.social

import com.careerfly.user.User

import com.careerfly.file.StoredFile

import com.careerfly.taggable.Tag

class Discussion {

    String title
    String body
    String link
    Long upVotes
    Long downVotes
    User author
    Set tags
    StoredFile file
    Date dateCreated
    Date lastUpdated
    static hasMany = [tags: Tag]

    static constraints = {
        upVotes (min: 0l)
        downVotes (min: 0l)
    }
}
