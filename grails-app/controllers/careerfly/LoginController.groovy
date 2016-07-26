

package careerfly

import com.careerfly.user.User

class LoginController {

    def beforeInterceptor = {

        if(session.loggedInUser){

            redirect(controller: "Profile" , action: "index")

            return false

        }

    }

    def index() {

    }

    def save() {

        User u

        if(params.email && params.password) {

            u = User.findByEmailAndPassword("${params.email}", "${params.password}")

            if(u) {

                session.loggedInUser = u.id

                redirect(controller: "Profile", action: "index" )

            } else {

                flash.message="Invalid user id or password"

                redirect( action: "index")

            }

        }

        else {

            if (u.hasErrors()) {

                render(view: 'index', model: [myUser: u])

                return

            }

        }

    }

}

