package com.careerfly.taggable

class Tag {

    String name
    Date dateCreated
    Date lastUpdated

    static constraints = {
        name (blank: false)
    }
}
