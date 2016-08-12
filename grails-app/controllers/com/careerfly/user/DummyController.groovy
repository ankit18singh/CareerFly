package com.careerfly.user

import com.careerfly.user.User

class DummyController {

    def index() {
        // use user id to login in into the system. This user id is getting created from signup page.
        session.loggedInUser = 42
    }
}
