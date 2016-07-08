package com.careerfly.geo

class Address {

    String lineOne
    String lineTwo
    City city
    String phoneNumber
    Date dateCreated
    Date lastUpdated

    static constraints = {
        lineOne (blank: false)
        lineTwo (blank: false)
        phoneNumber (blank: false, matches: "[0-9]+")
    }
}
