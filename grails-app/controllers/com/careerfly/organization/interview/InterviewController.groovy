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

        session.caompany = session.company
        session.loggedInUser = session.loggedInUser

        println params

        Set workExperience = params.workExperience.split(";")
        Set technologies = params.technologies.split(";")
        Set tools = params.tools.split(";")
        Set skills = params.skills.split(";")

        City loco = new City([name: session.company.address])
        loco.save()

        Address adds = new Address([city: loco])
        adds.save()

        Company ins = new Company([name: session.company.name, address: adds])
        ins.save()

        Tag techTag = new Tag([name: technologies])
        techTag.save()

        Tag toolTag = new Tag([name: tools])
        toolTag.save()

        Tag skillTag = new Tag([name: skills])
        skillTag.save()

        Map getDetails = [company: ins, candidate: session.loggedInUser, jobPosition: params.jobPosition,
                          qualification: params.qualification, result:params.result, workExperience: workExperience,
                          tools: toolTag, technologies: techTag, skills: skillTag, rounds: params.rounds]
        println getDetails

        Interview addDetails = new Interview(getDetails)
        addDetails.save(flush: true)

        session.getCompany = ins
        session.getCity = loco
        session.getAddress = adds
        session.techTag = techTag
        session.toolTag = toolTag
        session.skillTag = skillTag
        session.getInterview = addDetails
        session.intRound = addDetails
        redirect(action: 'show')
    }

    def show() {
        Interview interviewInstance = Interview.get(params.id)

        [interviewInstance: interviewInstance]
    }

    def edit() {
        [getCompany: session.getCompany, getCity: session.getCity, getTech: session.techTag, getTool: session.toolTag,
         getSkill: session.skillTag, getInterview: session.getInterview]
    }

    def update() {
        println params

        session.cityID = params.cityID
        session.companyID = params.companyID
        session.interviewID = params.interviewID
        session.techID = params.techID
        session.toolID = params.toolID
        session.skillID = params.skillID

        City updateCity = City.get(session.cityID)
        updateCity.name = params.companyAddress
        updateCity.save(flush: true)
        println updateCity
        println updateCity.errors

        Company updateOrg = Company.get(session.companyID)
        updateOrg.name = params.companyName
        updateOrg.save(flush: true)
        println updateOrg
        println updateOrg.errors

        Interview updateInterview = Interview.get(session.interviewID)
        updateInterview.jobPosition = params.jobPosition
        updateInterview.qualification = params.qualification
        updateInterview.result = params.result
        updateInterview.rounds = params.rounds
        updateInterview.workExperience = params.workExperience.split(";")
        updateInterview.save(flush: true)
        println updateInterview
        println updateInterview.errors

        Tag updateTech = Tag.get(session.techID)
        updateTech.name = params.technologies.split(";")
        updateTech.save(flush: true)
        println updateTech
        println updateTech.errors

        Tag updateTool = Tag.get(session.toolID)
        updateTool.name = params.tools.split(";")
        updateTool.save(flush: true)
        println updateTool
        println updateTool.errors

        Tag updateSkill = Tag.get(session.skillID)
        updateSkill.name = params.skills.split(";")
        updateSkill.save(flush: true)
        println updateSkill
        println updateSkill.errors
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
