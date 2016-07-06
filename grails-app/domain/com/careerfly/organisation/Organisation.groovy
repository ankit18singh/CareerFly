package com.careerfly.organisation

import com.careerfly.geo.Address

abstract class Organisation {
    String name
    Address address
    Date dateCreated
    Date lastUpdated

    static constraints = {
        name(blank: false)
    }
}
