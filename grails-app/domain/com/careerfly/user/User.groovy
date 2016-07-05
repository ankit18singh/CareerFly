package com.careerfly.user

class User {
    String firstName
    String lastName
    String email
    String password
    Gender gender

    static constraints = {
    }
}
enum Gender {
    MALE, FEMALE
}
