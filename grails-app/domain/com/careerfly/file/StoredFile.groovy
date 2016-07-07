package com.careerfly.file

class StoredFile {

    String name
    String path
    Date dateCreated
    Date lastUpdated

    static constraints = {
        name (blank: false)
        path (blank: false)
    }
}
