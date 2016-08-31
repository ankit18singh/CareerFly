package com.careerfly.organization

import com.careerfly.geo.Address

abstract class Organization {

    String name
    Address address
    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(blank: false)
    }
}
