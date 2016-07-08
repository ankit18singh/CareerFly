package com.careerfly.user

import com.careerfly.organization.College
import com.careerfly.organization.School
import com.careerfly.taggable.Tag

class Profile {

    User user
    Set skills
    Set interests
    School hsc
    School ssc
    College graduation
    College postGraduation
    Date dateCreated
    Date lastUpdated
    static hasMany = [skills : Tag, interests : Tag]

    static constraints = {
    }
}
