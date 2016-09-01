package com.careerfly.organization.interview

class InterviewRoundController {

    def index() {

        Interview interviewInstance = Interview.get(params.id)
        int roundCount = interviewInstance.rounds.size()
        println roundCount

        if(roundCount == 0) {
            roundCount = 1
        } else {
            roundCount = roundCount + 1
        }

        [roundCount: roundCount, interviewInstance: interviewInstance.id, errRound: new InterviewRound()]
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

        if (roundInstance.hasErrors()) {
            render(view: "index", model: [errRound: roundInstance, roundCount: params.rc])
            return
        }

        Interview interviewInstance = Interview.get(params.id)
        interviewInstance.rounds.add(roundInstance)
        interviewInstance.save(flush: true)

        redirect(action: "show", id: interviewInstance.id, roundCount: params.rc)
    }

    def show() {

        println params
        println params.roundCount
        println params.interviewID
        println "122222"

        Interview interviewInstance = Interview.get(params.id)
        println interviewInstance.rounds

        int roundCount = interviewInstance.rounds.size()
        println roundCount

        InterviewRound roundInstance = InterviewRound.get(interviewInstance.rounds.id)
        println roundInstance

        if (!roundInstance) {
            flash.message = "Currently there is no Interview Round for this company."
            render(view: "show", model: [interviewInstance: interviewInstance])
            return
        }

        [roundInstance: roundInstance, roundCount: roundCount, interviewInstance: interviewInstance]
    }

    def edit() {

        println params

        InterviewRound roundInstance = InterviewRound.get(params.roundID)

        if (roundInstance.candidate.id != session.loggedInUser) {
            flash.message = "You are not allowed to edit this interview"
            redirect(action: "index")
            return
        }

        [roundInstance: roundInstance, errRound: new InterviewRound(), roundCount: params.rc, interviewInstance:
                params.interviewID]
    }

    def update() {

        println params

        InterviewRound roundInstance = InterviewRound.get(params.id)
        println roundInstance.candidate.id

        if (roundInstance.candidate.id != session.loggedInUser) {
            flash.message = "Your session is expired! You cannot edit that round."
            redirect(controller: 'interviewListing', action: 'index')
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
        println roundInstance.errors

        if (roundInstance.hasErrors()) {
            render(view: "edit", model: [errRound: roundInstance, id: params.interviewID, roundInstance: roundInstance] )
            return
        }

        println "updated"

        redirect(action: 'show', id: params.interviewID)
    }

    def delete() {

        InterviewRound roundInstance = InterviewRound.get(params.id)
        roundInstance.delete(flush: true)
        redirect(action: 'index')
    }
}