package com.careerfly.organization.interview

import com.careerfly.user.User

class InterviewRound {
    User candidate
    String title
    static Set hasMany = [dos: String, donts: String]
    String experience
    int duration

    static constraints = {
        title(matches: "[a-z,A-Z,0-9, ]+")
        duration(matches: "[0-9]")
    }
}
