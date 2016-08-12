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
    def Socialprofile() {
        [usersocial : SocialProfile.get(session.loggedInUser)]

    }
    def savesocialprofile() {
        SocialProfile socialInstance = new SocialProfile([fb:params.fb,skype:params.skype,gplus:params.gplus,
                user:User.get(session.loggedInUser)])

        socialInstance.save()
        flash.message = "Save Social Profile"
        render(view: "Socialprofile",model: [usersocial: socialInstance])

    }
    def logout() {
        session.loggedInUser=null
        redirect(action:'index',controller: 'Login')
    }
}
