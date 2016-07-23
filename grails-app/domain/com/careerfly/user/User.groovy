package com.careerfly.user

class User {

    String firstName
    String lastName
    String email
    String password


    static constraints = {
        firstName (blank: false, matches: "[a-zA-Z]+")
        lastName (blank: false, matches: "[a-zA-Z]+")
        email (email: true, unique: true)
        password (blank: false)
    }
}

