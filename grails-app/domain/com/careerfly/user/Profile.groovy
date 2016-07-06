package com.careerfly.user

import com.careerfly.organisation.College
import com.careerfly.organisation.School
import com.careerfly.taggable.Tag

class Profile {

    User user
    Set skills
    Set interests
    static hasMany = [skills : Tag, interests : Tag]
    School hsc
    School ssc
    College graduation
    College postGraduation
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }
}
