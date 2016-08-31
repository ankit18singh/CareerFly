package com.careerfly.organization.interview

import com.careerfly.organization.Company
import com.careerfly.taggable.Tag
import com.careerfly.user.User

class Interview {

    Company company
    User candidate
    String jobPosition
    String qualification
    Result result
    Date dateCreated
    Date lastUpdated
    Set workExperience, rounds
    Set<Tag> technologies = [], tools = [], skills = []
    static hasMany = [workExperience: String, technologies: Tag, tools: Tag, skills: Tag, rounds: InterviewRound]

    static constraints = {

        jobPosition(blank: false, matches: "[a-zA-Z]+")
        qualification(blank: false, matches: "[a-zA-Z0-9]+")
        workExperience(nullable: false)
        rounds(nullable: false, matches: "[0-9]+")
        technologies(nullable: false)
        tools(nullable: false)
        skills(nullable: false)
    }

    enum Result {

        ACCEPT(1),
        ON_HOLD(2),
        REJECT(3),
        DECLINE(4)
        int id

        Result(int id) {
            this.id = id
        }
    }
}