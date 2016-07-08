package com.careerfly.user.academic

import com.careerfly.taggable.Tag
import com.careerfly.user.User

class Project {

    String title
    Date certificateDate
    User candidate
    String discription
    Set technologies
    Date dateCreated
    Date lastUpdated
    static hasMany = [technologies : Tag]

    static constraints = {
        title (blank: false)
        certificateDate (blank: false)
        discription (blank: false)
        technologies minSize: 1
    }
}
