package com.careerfly.user

class SocialProfile {
    String gplus
    String skype
    String fb
    User user

    static constraints = {
        gplus(nullable: true, matches: "[a-zA-Z]+[0-9]]")
        skype(nullable: true, matches: "[a-zA-Z]+[0-9]")
        fb(nullable: true, matches: "[a-zA-Z]+[0-9]")
    }
}
