package careerfly.careerfly.User

import com.careerfly.user.Gender

import com.careerfly.user.User

class UserController {

    def index() {
        [user: new User()]
    }
    def signup () {

        User userInstance = new User([gender:params.Gender,email:params.email,firstName: params.firstName,
                                    lastName:params.lastName,password:params.confirmpassword])

        if (params.password!= params.confirmpassword) {
            flash.message = "password MisMatch"
            render(view: 'index', model: [user: userInstance])
        }

        userInstance.save()
        if (userInstance.hasErrors()) {
            render(view: 'index', model: [user: userInstance])
            return
        }
        else if (params.password==params.confirmpassword) {
            println "Hello"
            //userInstance.save()
            flash.message = "You are Successfully Registered"
            redirect (action: "index",controller: "Login")
        }

    }
}
