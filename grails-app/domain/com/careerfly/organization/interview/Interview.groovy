package com.careerfly.organization.interview

import com.careerfly.organization.Company
import com.careerfly.taggable.Tag
import com.careerfly.user.User

class Interview {
    Company company
    User candidate
    String jobPosition
    String qualification
    static Set hasMany = [workExperience: String, technologies: Tag, tools: Tag, skills: Tag, rounds: InterviewRound]
    Result result

    static constraints = {
        jobPosition(matches: "[a-z,A-Z, ]+")
        qualification(matches: "[a-z,A-Z,0-9, ]+")
        workExperience(matches: "[a-z,A-Z,0-9, ]+")
        skills(matches: "[a-z,A-Z,0-9, ]+")
        rounds(matches: "[0-9]st|nd|rd|th")
    }
}

enum Result {
    ACCEPT,ONHOLD,REJECT,DECLINE
}
