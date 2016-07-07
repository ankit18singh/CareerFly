package com.careerfly.organization.interview

import com.careerfly.user.User

class InterviewRound {

    User candidate
    String title
    String experience
    int duration
    Date dateCreated
    Date lastUpdated
    Set dos, donts
    static hasMany = [dos: String, donts: String]

    static constraints = {
    }
}
