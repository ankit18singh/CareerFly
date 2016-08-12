package com.careerfly.user

import com.careerfly.user.Gender

import com.careerfly.user.User

class UserController {

    def index() {
        [user: new User()]
    }
    def signup () {

            User userInstance = new User([gender: params.Gender, email: params.email, firstName: params.firstName,
                                          lastName: params.lastName, password: params.confirmpassword])

            if (params.password != params.confirmpassword) {
                flash.message = "Password MisMatch"
                render(view: 'index', model: [user: userInstance])
                return
            }
            userInstance.save()

            if (userInstance.hasErrors()) {
                render(view: 'index', model: [user: userInstance]) 
            } else if (params.password == params.confirmpassword) {
                flash.message = "You are Successfully Registered"
                redirect(action: "index", controller: "Login")
            }
    }
}
