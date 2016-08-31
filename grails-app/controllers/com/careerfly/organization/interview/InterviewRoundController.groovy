package com.careerfly.organization.interview

class InterviewRoundController {

    def index() {

        Interview interviewInstance = Interview.get(params.id)
        int roundCount = interviewInstance.rounds.size()
        println roundCount

        /*def roundCount = InterviewRound.executeQuery("select count(id) from InterviewRound where candidate = ${session.loggedInUser}")*/

        if(roundCount == 0) {
            roundCount = 1
        }
        else {
            roundCount = roundCount + 1
        }

        [roundCount: roundCount, interviewInstance: interviewInstance.id, errUser: new InterviewRound()]
    }

    def save() {

        println params

        Set dos = params.dos.split(";")
        Set donts = params.donts.split(";")

        Map getDetails = [candidate: session.loggedInUser, title: params.title, experience: params.experience,
                          duration: params.duration, dos: dos, donts: donts]

        InterviewRound roundInstance = new InterviewRound(getDetails)
        roundInstance.save(flush: true)
        println roundInstance
        println roundInstance.errors

        Interview interviewInstance = Interview.get(params.id)
        interviewInstance.rounds.add(roundInstance)
        interviewInstance.save(flush: true)

        if(roundInstance.hasErrors()) {
            render (view: "index", model:[errUser: roundInstance])
            return
        }

        redirect(action: "show", id: roundInstance.id)
    }

    def show() {

        println params

        Interview interviewInstance = Interview.get(params.id)
        println interviewInstance.rounds

        InterviewRound roundInstance = InterviewRound.get(interviewInstance.rounds.id)
        println roundInstance

        [roundInstance: roundInstance]
    }

    def edit() {

        InterviewRound roundInstance = InterviewRound.get(params.id)

        if (roundInstance.candidate.id != session.loggedInUser) {
            flash.message = "You are not allowed to edit this interview"
            redirect(action: "index")
            return
        }

        [roundInstance: roundInstance]
    }

    def update() {

        InterviewRound roundInstance = InterviewRound.get(params.id)
        
        if (roundInstance.candidate.id != session.loggedInUser) {
            redirect(action: 'index')
            return
        }

        Set dos = params.dos.split(";")
        Set donts = params.donts.split(";")

        roundInstance.title = params.title
        roundInstance.experience = params.experience
        roundInstance.duration = params.duration.toInteger()
        roundInstance.dos = dos
        roundInstance.donts = donts

        roundInstance.save(flush: true)
        println roundInstance
        println "updated"

        redirect(action: 'show', id: roundInstance.id)
    }

    def delete() {

        InterviewRound roundInstance = InterviewRound.get(params.id)
        roundInstance.delete(flush: true)
        redirect(action: 'index')
    }
}