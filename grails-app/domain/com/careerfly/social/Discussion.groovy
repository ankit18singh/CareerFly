package com.careerfly.social

import com.careerfly.user.User

import com.careerfly.file.StoredFile

import com.careerfly.taggable.Tag

class Discussion {

    String title
    String body
    String link
    Long upVotes = 0
    Long downVotes = 0
    User author
    Set<Tag> tags = []
    StoredFile file
    Date dateCreated
    Date lastUpdated
    static hasMany = [tags: Tag]

    static constraints = {
        upVotes(min: 0l)
        downVotes(min: 0l)
    }

    List getImmediateChildComments() {
        return Comment.createCriteria().list {
            eq("entity", CommentEntity.DISCUSSION)
            eq("entityID", this.id)
            order("dateCreated", "desc")
        }
    }
}
