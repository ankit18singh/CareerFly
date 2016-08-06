package com.careerfly.organization.interview

import com.careerfly.geo.Address
import com.careerfly.geo.City
import com.careerfly.organization.Company
import com.careerfly.organization.interview.Interview
import com.careerfly.organization.interview.InterviewRound
import com.careerfly.organization.interview.Result
import com.careerfly.taggable.Tag
import com.careerfly.user.User

class InterviewController {

    def index() { }

    def jobRequirement() {

        println params
        session.company = params
    }

    def save() {

        println params

        Interview interviewInstance = new Interview()

        Set workExperience = params.workExperience.split(";")
        Set tech = params.technologies.split(";")
        Set tools = params.tools.split(";")
        Set skills = params.skills.split(";")

        City cityInstance = new City([name: session.company.address])
        cityInstance.save()

        Address addressInstance = new Address([city: cityInstance])
        addressInstance.save()

        Company companyInstance = new Company([name: session.company.name, address: addressInstance])
        companyInstance.save()

        tech.each {
            Tag techInstance = Tag.findByName(it)
            if (!techInstance) {
                techInstance = new Tag(name: it)
                techInstance.save()
            }
            println techInstance
            println techInstance.errors
            interviewInstance.technologies.add(techInstance)
        }

        tools.each {
            Tag toolInstance = Tag.findByName(it)
            if (!toolInstance) {
                toolInstance = new Tag(name: it)
                toolInstance.save()
            }
            interviewInstance.tools.add(toolInstance)
        }

        skills.each {
            Tag skillInstance = Tag.findByName(it)
            if (!skillInstance) {
                skillInstance = new Tag(name: it)
                skillInstance.save()
            }
            interviewInstance.skills.add(skillInstance)
        }

        Map getDetails = [company: companyInstance, candidate: session.loggedInUser, jobPosition: params.jobPosition,
                          qualification: params.qualification, result:params.result, workExperience: workExperience,
                          technologies: interviewInstance.technologies, tools: interviewInstance.tools,
                          skills: interviewInstance.skills, rounds: params.rounds]

        println getDetails

        interviewInstance = new Interview(getDetails)
        interviewInstance.save(flush: true)
        println interviewInstance

        redirect(action: 'show', id: interviewInstance.id)
    }

    def show() {

        Interview interviewInstance = Interview.get(params.id)
        [interviewInstance: interviewInstance]
    }

    def edit() {

        Interview interviewInstance = Interview.get(params.id)

        if (interviewInstance.candidate.id != session.loggedInUser) {
            flash.message = "You are not allowed to edit this interview"
            redirect(action: "index")
            return
        }

        [interviewInstance: interviewInstance]
    }

    def update() {
        
        println params
        Interview interviewInstance = Interview.get(params.id)

        if (interviewInstance.candidate.id != session.loggedInUser) {
            redirect(action: "index")
            return
        }


        println "here 1111"
        println params.cityID
        City updateCity = City.get(params.cityID)
        updateCity.name = params.companyAddress
        updateCity.save(flush: true)
        println updateCity
        println updateCity.errors
        println "here 2222"
        println params.companyID
        Company updateOrg = Company.get(params.companyID)
        updateOrg.name = params.companyName
        updateOrg.save(flush: true)
        println updateOrg
        println updateOrg.errors
        println "here 3333"
        interviewInstance.jobPosition = params.jobPosition
        println "here 4444"
        interviewInstance.qualification = params.qualification
        println "here 5555"
        interviewInstance.result = params.result
        println "here 6666"
        interviewInstance.workExperience = params.workExperience.split(";")
        println "here 7777"
        interviewInstance.addToRounds([rounds: params.rounds])
        println "here 8888"
        interviewInstance.save(flush: true)
        if (interviewInstance.hasErrors()) {
            println interviewInstance.errors
        }
        else {
            println "NO"
        }
        println interviewInstance.errors
        println "here 9999"
        println interviewInstance
        println "here 0000"
        Set tech = params.technologies.split(";")
        println tech + "!!!!!!!!!!!!!!!!!!"
        Set tools = params.tools.split(";")
        println tools + "@@@@@@@@@@@@@@@@@"
        Set skills = params.skills.split(";")
        println skills + "################"
        /*tech.each {
            Tag techInstance = Tag.findByName(it)
            if (!techInstance) {
                techInstance = Tag.get(interviewInstance.technologies.id)
                techInstance.save(flush: true)
            }
            println techInstance
            println techInstance.errors
        }
        println "here!!!!!!!!!!"
        tools.each {
            Tag toolInstance = Tag.findByName(it)
            if (!toolInstance) {
                toolInstance = Tag.get(interviewInstance.tools.id)
                toolInstance.save(flush: true)
            }
        }
        println "here!!!!!!!!!!"
        skills.each {
            Tag skillInstance = Tag.findByName(it)
            if (!skillInstance) {
                skillInstance = Tag.get(interviewInstance.skills.id)
                skillInstance.save(flush: true)
            }
        }*/
        println "here!!!!!!!!!!"

    }

    def delete() {

        Interview deleteInterview = Interview.get(session.getInterview.id)
        deleteInterview.delete(flush: true)

        Company deleteCompany = Company.get(session.getCompany.id)
        deleteCompany.delete(flush: true)

        Address deleteAddress = Address.get(session.getAddress.id)
        deleteAddress.delete(flush: true)

        City deleteCity = City.get(session.getCity.id)
        deleteCity.delete(flush: true)

        Tag deleteTech = Tag.get(session.techTag.id)
        deleteTech.delete(flush: true)

        Tag deleteTool = Tag.get(session.toolTag.id)
        deleteTool.delete(flush: true)

        Tag deleteSkill = Tag.get(session.skillTag.id)
        deleteSkill.delete(flush: true)

        redirect(action: 'index')
    }
}
