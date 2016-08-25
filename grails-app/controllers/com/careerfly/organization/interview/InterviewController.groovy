package com.careerfly.organization.interview

import com.careerfly.geo.Address
import com.careerfly.geo.City
import com.careerfly.organization.Company
import com.careerfly.taggable.Tag

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
                          skills: interviewInstance.skills]

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

        City cityInstance = City.get(params.cityID)
        cityInstance.name = params.companyAddress
        cityInstance.save(flush: true)

        Company companyInstance = Company.get(params.companyID)
        companyInstance.name = params.companyName
        companyInstance.save(flush: true)

        interviewInstance.jobPosition = params.jobPosition

        interviewInstance.qualification = params.qualification

        interviewInstance.workExperience = params.workExperience.split(";")

        Set tech = params.technologies.split(";")
        Set tools = params.tools.split(";")
        Set skills = params.skills.split(";")

        int i = 0
        interviewInstance.technologies.id.each {
            Tag techInstance = Tag.findByName(tech[i])
            if (!techInstance) {
                techInstance = Tag.get(it)
                techInstance.name = tech[i]
                techInstance.save(flush: true)
            }
            i++
        }

        i = 0
        interviewInstance.tools.id.each {
            Tag toolInstance = Tag.findByName(tools[i])
            if (!toolInstance) {
                toolInstance = Tag.get(it)
                toolInstance.name = tools[i]
                toolInstance.save(flush: true)
            }
            i++
        }

        i = 0
        interviewInstance.skills.id.each {
            Tag skillInstance = Tag.findByName(skills[i])
            if (!skillInstance) {
                skillInstance = Tag.get(it)
                skillInstance.name = skills[i]
                skillInstance.save(flush: true)
            }
            i++
        }

        interviewInstance.save(flush: true)
        println "updated"

        redirect(action: 'show', id: interviewInstance.id)
    }

    def delete() {

        Interview interviewInstance = Interview.get(params.id)
        interviewInstance.delete(flush: true)

        Company companyInstance = Company.get(interviewInstance.company.id)
        companyInstance.delete(flush: true)

        Address addressInstance = Address.get(companyInstance.address.id)
        addressInstance.delete(flush: true)

        City cityInstance = City.get(addressInstance.city.id)
        cityInstance.delete(flush: true)

        redirect(action: 'index')
    }
}
