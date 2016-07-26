package careerfly

import com.careerfly.organization.interview.Interview
import com.careerfly.organization.interview.InterviewRound
import com.careerfly.user.User

class InterviewRoundController {

    def index() {

        session.loggedInUser = session.loggedInUser

        def roundCount = InterviewRound.executeQuery("select count(id) from InterviewRound where candidate = ${session.loggedInUser} ")

        if(roundCount == 0) {
            roundCount = 1
        }
        else {
            roundCount = roundCount.get(0) + 1
        }
        session.rc = roundCount
        [roundCount: roundCount, errUser: new InterviewRound()]
    }

    def save() {

        println params

        Set dos = params.dos.split(";")
        Set donts = params.donts.split(";")

        Map getDetails = [candidate: session.loggedInUser, title: params.title, experience: params.experience,
                          duration: params.duration, dos: dos, donts: donts]

        InterviewRound saveDetails = new InterviewRound(getDetails)
        saveDetails.save(flush: true)

        session.getID = saveDetails

        if(saveDetails.hasErrors()) {
            render (view: "index", model:[errUser: saveDetails])
            return
        }

        Interview saveRound = Interview.get(session.intRound.id)
        List getID = InterviewRound.findAllById(session.getID.id)

        saveRound.rounds = getID
        saveRound.save(flush: true)

        session.userDetails = saveDetails
        redirect(action: "show")
    }

    def show() {

        session.rc = session.rc
        List findUser = User.findAllById(session.loggedInUser)
        List fetchDetails = InterviewRound.findAllByIdAndCandidate(session.userDetails.id, findUser)
        session.user = fetchDetails
        [showDetails: fetchDetails, rc: session.rc]
    }

    def edit() {
        [editDetails: session.userDetails, rc: session.rc]
    }

    def update() {

        session.getID = params.id
        InterviewRound updateDetails = InterviewRound.get(session.getID)
        updateDetails.title = params.title
        updateDetails.experience = params.experience
        updateDetails.duration = params.duration.toInteger()

        Set dos = params.dos.split(";")
        Set donts = params.donts.split(";")

        updateDetails.dos = dos
        updateDetails.donts = donts
        updateDetails.save(flush: true)
        println "updated"
        redirect(action: 'show')
    }

    def delete() {

        session.userDetails = session.userDetails
        InterviewRound deleteDetails = InterviewRound.get(session.userDetails.id)
        deleteDetails.delete(flush: true)
        redirect(action: 'index')
    }
}