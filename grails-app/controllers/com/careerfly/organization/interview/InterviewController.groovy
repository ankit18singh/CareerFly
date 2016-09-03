package com.careerfly.organization.interview

import com.careerfly.geo.Address
import com.careerfly.geo.City
import com.careerfly.organization.Company
import com.careerfly.taggable.Tag

class InterviewController {

    def index() {

        [errCompany: new Company(), errCity: new City()]
    }

    def jobRequirement() {

        session.company = params
        [errInterview: new Interview(), errTech: new Tag(), errTool: new Tag(), errSkill: new Tag()]
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

        if (cityInstance.hasErrors()) {
            render(view: "index", model: [errCity: cityInstance])
            return
        }

        Address addressInstance = new Address([city: cityInstance])
        addressInstance.save()

        Company companyInstance = new Company([name: session.company.name, address: addressInstance])
        companyInstance.save()

        if (companyInstance.hasErrors()) {
            render(view: "index", model: [errCompany: companyInstance])
            return
        }

        tech.each {
            Tag techInstance = Tag.findByName(it)
            if (!techInstance) {
                techInstance = new Tag(name: it)
                techInstance.save()
            }

            if (techInstance.hasErrors()) {
                render(view: "jobRequirement", model: [errTech: techInstance])
                return
            }

            interviewInstance.technologies.add(techInstance)
        }

        tools.each {
            Tag toolInstance = Tag.findByName(it)
            if (!toolInstance) {
                toolInstance = new Tag(name: it)
                toolInstance.save()
            }

            if (toolInstance.hasErrors()) {
                render(view: "jobRequirement", model: [errTool: toolInstance])
                return
            }

            interviewInstance.tools.add(toolInstance)
        }

        skills.each {
            Tag skillInstance = Tag.findByName(it)
            if (!skillInstance) {
                skillInstance = new Tag(name: it)
                skillInstance.save()
            }

            if (skillInstance.hasErrors()) {
                render(view: "jobRequirement", model: [errSkill: skillInstance])
                return
            }

            interviewInstance.skills.add(skillInstance)
        }

        Map getDetails = [company: companyInstance, candidate: session.loggedInUser, jobPosition: params.jobPosition,
                          qualification: params.qualification, result: params.result, workExperience: workExperience,
                          technologies: interviewInstance.technologies, tools: interviewInstance.tools,
                          skills: interviewInstance.skills]

        println getDetails

        interviewInstance = new Interview(getDetails)
        interviewInstance.save(flush: true)
        println interviewInstance

        if (interviewInstance.hasErrors()) {
            render(view: "jobRequirement", model: [errInterview: interviewInstance])
            return
        }

        redirect(action: 'show', id: interviewInstance.id)
    }

    def show() {

        Interview interviewInstance = Interview.get(params.id)
        [interviewInstance: interviewInstance]
    }

    def edit() {

        println params

        Interview interviewInstance = Interview.get(params.id)

        if (interviewInstance.candidate.id != session.loggedInUser) {
            flash.message = "You are not allowed to edit this interview!"
            render(view: "edit")
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

        if (cityInstance.hasErrors()) {
            render(view: "edit", model: [errCity: cityInstance, interviewInstance: interviewInstance])
            return
        }

        Company companyInstance = Company.get(params.companyID)
        companyInstance.name = params.companyName
        companyInstance.save(flush: true)

        if (companyInstance.hasErrors()) {
            render(view: "edit", model: [errCompany: companyInstance, interviewInstance: interviewInstance])
            return
        }

        interviewInstance.jobPosition = params.jobPosition

        interviewInstance.qualification = params.qualification

        interviewInstance.result = params.result

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

            if (techInstance.hasErrors()) {
                render(view: "edit", model: [errTech: techInstance, interviewInstance: interviewInstance])
                return
            }
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

            if (toolInstance.hasErrors()) {
                render(view: "edit", model: [errTool: toolInstance, interviewInstance: interviewInstance])
                return
            }
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

            if (skillInstance.hasErrors()) {
                render(view: "edit", model: [errSkill: skillInstance, interviewInstance: interviewInstance])
                return
            }
        }

        interviewInstance.save(flush: true)

        if (interviewInstance.hasErrors()) {
            render(view: "edit", model: [errInterview: interviewInstance, interviewInstance: interviewInstance])
            return
        }

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

        redirect(controller: 'interviewListing', action: 'index')
    }
}