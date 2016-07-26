package com.careerfly.user

class User {

    String firstName
    String lastName
    String email
    String password
    Gender gender
    Date dateCreated
    Date lastUpdated

    static constraints = {
        firstName (blank: false, matches: "[a-zA-Z]+")
        lastName (blank: false, matches: "[a-zA-Z]+")
        email (email: true, unique: true)
        password (blank: false)
    }
}

enum Gender {
    MALE(1), FEMALE(2)
    final int id

    Gender(int id) {
        this.id = id
    }
}