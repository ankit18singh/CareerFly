package careerfly

import com.careerfly.user.User

class ProfileController {

    def beforeInterceptor = {
        if(!session.loggedInUser){
            flash.message= ">>To continue further, You first need to login"
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
        User update = User.get(params.id)
        println "updated!!" + update
        println update.lastName
        update.firstName = params.firstName
        update.lastName = params.lastName
        println params.firstName
        println update.firstName
        update.email = params.email
        update.password = params.password
        update.save(flush: true)
        if (update.hasErrors()) {
            render(view: 'index', model: [userData: update])
            return
        }
        println update.errors
        flash.message= "updated successfully"
        redirect(action: 'index')
    }

}
