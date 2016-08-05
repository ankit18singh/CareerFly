package com.careerfly.social

class DummyController {

    def index() {
        session.loggedInUser = 1
    }
}
