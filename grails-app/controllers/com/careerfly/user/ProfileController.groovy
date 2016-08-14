package com.careerfly.user

class ProfileController {

    def beforeInterceptor = {
        if (!session.loggedInUser) {
            flash.message = ">>To continue further, You first need to login >>"
            redirect(controller: "login", action: "index")
            return false
        }
    }

    def index() {

        [userData: User.get(session.loggedInUser)]
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
    }

    def check() {
        SocialProfile socialInstance = SocialProfile.findByUser(User.get(session.loggedInUser))


        if (!socialInstance) {
            redirect(action: "Socialprofile")

        } else {
            render(view: "Social", model: [usersocial: socialInstance])
        }

    }

    def savesocialprofile() {

        SocialProfile socialInstance = new SocialProfile([fb  : params.fb, skype: params.skype, gplus: params.gplus,
                                                          user: User.get(session.loggedInUser)])

        socialInstance.save()

        if (socialInstance.hasErrors()) {
            render(view: 'Socialprofile', model: [usersocial: socialInstance])
            return
        } else {
            flash.message = "Social Profile Saved"
            render(view: "Social", model: [usersocial: socialInstance])
        }


    }

    def updatesocial() {

        SocialProfile updatesocial = SocialProfile.findByUser(User.get(session.loggedInUser))
        updatesocial.fb = params.fb
        updatesocial.skype = params.skype
        updatesocial.gplus = params.gplus
        updatesocial.save(flush: true)

        if (updatesocial.hasErrors()) {
            render(view: 'Social', model: [usersocial: updatesocial])
            flash.message = 'Invalid Fields'
            return
        }

        flash.message = "updated successfully"
        render(view: 'Social', model: [usersocial: updatesocial])

    }

}
