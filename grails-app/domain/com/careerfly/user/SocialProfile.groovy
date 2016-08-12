package com.careerfly.user

class SocialProfile {
    String gplus
    String skype
    String fb
    User user

    static constraints = {
        gplus(blank: false, matches: "[a-zA-Z]+")
        skype(blank: false, matches: "[a-zA-Z]+")
        fb(blank: false, matches: "[a-zA-Z]+")
    }
}
