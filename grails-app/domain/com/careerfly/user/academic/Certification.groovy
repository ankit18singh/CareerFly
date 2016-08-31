package com.careerfly.user.academic

import com.careerfly.user.User

class Certification {
    String title
    User candidate
    Date certificationDate
    Date dateCreated
    Date lastUpdated

    static constraints = {
        title(blank: false)
        certificationDate(nullable: false)
    }
}
