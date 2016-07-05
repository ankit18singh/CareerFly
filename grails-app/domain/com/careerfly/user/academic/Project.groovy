package com.careerfly.user.academic

import com.careerfly.taggable.Tag
import com.careerfly.user.User

class Project {
    String title
    Date certificateDate
    User candidate
    String discription
    static hasMany = [technologies : Tag]
    static constraints = {
    }
}
