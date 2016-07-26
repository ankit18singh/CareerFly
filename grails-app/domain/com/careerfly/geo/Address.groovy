package com.careerfly.geo

class Address {

    String lineOne
    String lineTwo
    City city
    String phoneNumber
    Date dateCreated
    Date lastUpdated

    static constraints = {
        lineOne (nullable: true)
        lineTwo (nullable: true)
        phoneNumber (matches: "[0-9]+", nullable: true)
    }
}
