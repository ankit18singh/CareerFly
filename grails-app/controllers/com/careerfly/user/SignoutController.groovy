package com.careerfly.user

class SignoutController {

    def index() {
        session.loggedInUser=null
        redirect(action:'index',controller: 'Login')
    }
}
