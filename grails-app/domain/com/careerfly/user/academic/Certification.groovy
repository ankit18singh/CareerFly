package com.careerfly.user.academic

import com.careerfly.user.User

class Certification {
    String title
    Date certificationDate
    User candidate
    Date dateCreated
    Date lastUpdated

    static constraints = {
        title(blank: false)
        certificationDate(blank: false)
    }
}
