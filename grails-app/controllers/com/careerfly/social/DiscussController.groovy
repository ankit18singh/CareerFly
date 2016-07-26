package com.careerfly.social

import com.careerfly.user.User

import java.text.SimpleDateFormat

class DiscussController {

    def index() {

        [viewAll: Discussion.list()]
    }

    def save(String newtitle, String newbody, String newlink) {
        Discussion discussionInstance= new Discussion([title: newtitle, body: newbody, link: newlink, author: 1,
                                                       file: 1])
        discussionInstance.save()

        redirect(action: 'forum', id: discussionInstance.id)
    }

    def forum(Long id) {
        //println "id -->$id"
        Discussion forumInstance = Discussion.get(params.id)
        //println "id--> $params.id"
        render(view: 'forum', model:[forumInstanceModel: forumInstance])
    }

    def edit() {

        [discussionEdit: Discussion.get(params.id)]
    }

    def update(String newtitle, String newbody, String newlink) {

        Discussion updatedInstance = Discussion.get(params.id)

        //println "id--> $params.id"

        updatedInstance.title = newtitle
        updatedInstance.body = newbody
        updatedInstance.link = newlink
        //updatedInstance.tags = newtag

        updatedInstance.save(flush: true)
        redirect(action: "forum", id: updatedInstance.id)
    }

    def delete() {
        Discussion discussionInstance = Discussion.get(params.id)
        if (!discussionInstance) {
            flash.message = "No discussion found"
            redirect(action: "index")
            return
        }

        discussionInstance.delete(flush: true)
        redirect(action: "index")
    }

    def upVote() {
        Discussion discussionInstance = Discussion.get(params.id)
        if (!discussionInstance) {
            flash.message = "No discussion found"
            redirect(action: "index")
            return
        }

        User loggedInUserInstance = User.get(session.loggedInUser)

        Vote voteInstance = Vote.createCriteria().get {
            eq("author", loggedInUserInstance)
            eq("entity", VoteEntity.DISCUSSION)
            eq("entityID", discussionInstance.id)
            eq("type", VoteType.UP)
        }

        // If there is already existing up vote instance for the current user and for the given discussion
        if (voteInstance) {
            // Means we have to remvoe the up vote
            voteInstance.delete()

            discussionInstance.upVotes--
        } else {
            voteInstance = new Vote()
            voteInstance.author = loggedInUserInstance
            voteInstance.entity = VoteEntity.DISCUSSION
            voteInstance.type = VoteType.UP
            voteInstance.entityID = discussionInstance.id // params.id
            voteInstance.save()

            discussionInstance.upVotes++
        }

        // Below are common lines for both if/else condition
        discussionInstance.save()
        redirect(action: "forum", id: discussionInstance.id)
    }
}
