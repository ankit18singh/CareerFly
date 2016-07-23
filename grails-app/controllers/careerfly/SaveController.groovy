package careerfly

import com.careerfly.user.Gender
import com.careerfly.user.User

class SaveController {

    def index() {
        [Register: new User()]
    }
    def register(){


        User signup=new User([gender: Gender.MALE,email:params.email,firstName: params.firstname,lastName:params.lastname,password:params.confirmpassword])
        signup.save()
        if (signup.hasErrors()) {
            flash.message="Invalid Registration"
            redirect(action: "index",model: [Register:signup])
            return
        }
        else if(params.password==params.confirmpassword) {
            flash.message="You are Successfully Registered"
            redirect(action: "index",controller: "Login")
        }
        else if(params.password!=params.confirmpassword){
            flash.message="Password Mismatch"
            redirect(action: "index",model: [Register:signup])
            return
        }

    }
}
