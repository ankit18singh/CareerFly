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
    static hasMany = [tags: Tag]
    Set tags
    StoredFile file
    Date dateCreated
    Date lastUpdated

    static constraints = {
        upVotes (minSize: 0)
        downVotes (minSize: 0)
    }
}
