package com.careerfly.geo

class City {

    String name
    String state
    String zipcode
    String country
    Date dateCreated
    Date lastUpdated

    static constraints = {
        name (blank: false, matches: "[a-zA-Z]+")
        state (blank: true, matches: "[a-zA-Z]+", nullable: true)
        country (matches: "[a-zA-Z]+", nullable: true)
        zipcode(nullable: true)
    }
}
