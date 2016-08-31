package com.careerfly.social

class DummyController {

    def index() {
        session.loggedInUser = params.id ?: 1
    }
}
