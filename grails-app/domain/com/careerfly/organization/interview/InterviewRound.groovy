package com.careerfly.organization.interview

import com.careerfly.user.User

class InterviewRound {
    User candidate
    String title
    static hasMany = [dos: String, donts: String]
    Set dos, donts
    String experience
    int duration
    Date dateCreated
    Date lastUpdated

    static constraints = {
        title(matches: "[a-z,A-Z,0-9, ]+")
        duration(matches: "[0-9]")
    }
}
