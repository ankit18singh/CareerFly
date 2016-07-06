package com.careerfly.geo

class City {
    String name
    String state
    String zipcode
    String country
    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(blank: false, matches: "[a-zA-Z]+")
        state(blank: false, matches: "[a-zA-Z]+")
        zipcode(blank: false, matches: "[0-9]+")
        country(blank: false, matches: "[a-zA-Z]+")
    }
}
