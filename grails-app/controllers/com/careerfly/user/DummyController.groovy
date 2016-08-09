package com.careerfly.user

import com.careerfly.user.User

class DummyController {

    def index() {
        session.loggedInUser = 4
    }
}
