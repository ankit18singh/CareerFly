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

        println "${params}"
        User updateInstance = User.get(session.loggedInUser)
        println updateInstance
        println updateInstance.lastName
        updateInstance.firstName = params.firstName
        updateInstance.lastName = params.lastName
        println params.firstName
        println updateInstance.firstName
        updateInstance.email = params.email
        updateInstance.password = params.password
        if (updateInstance.hasErrors()) {
            render(view: 'index', model: [userData: updateInstance])
        }
        updateInstance.save(flush: true)
        println updateInstance.errors
        flash.message= "updated successfully"
        redirect(action: 'index')
    }

}
