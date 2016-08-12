package com.careerfly.user

class ProfileController {

    def beforeInterceptor = {
        if(!session.loggedInUser){
            flash.message= ">>To continue further, You first need to login >>"
            redirect(controller: "login" , action: "index")
            return false
        }
    }
    def index() {
        //User usr=User.findById(session.loggedInUser)
        [userData : User.get(session.loggedInUser)]
    }

    def update() {
        User updateInstance = User.get(session.loggedInUser)
        updateInstance.firstName = params.firstName
        updateInstance.lastName = params.lastName
        updateInstance.password = params.password
        updateInstance.save(flush: true)

        if (updateInstance.hasErrors()) {
            render(view: 'index', model: [userData: updateInstance])
            return
        }

        flash.message = "updated successfully"
        redirect(action: 'index')
    }
}
