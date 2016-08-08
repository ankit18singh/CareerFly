package com.careerfly.social

import com.careerfly.user.User

import java.text.SimpleDateFormat

class DiscussController {

    def index() {

        [viewAll: Discussion.list()]
    }

    def save(String newtitle, String newbody, String newlink) {

        User userInstance = User.get(session.loggedInUser)

        Discussion discussionInstance= new Discussion([title: newtitle, body: newbody, link: newlink, author: userInstance,
                                                       file: 1])
        discussionInstance.save()/*
        println "author id--> $discussionInstance.author"*/
        redirect(action: 'forum', id: discussionInstance.id, author: discussionInstance.author)
    }

    def forum(Long id) {
        //println "id -->$id"
        Discussion forumInstance = Discussion.get(params.id)
        //User loggedInUserInstance = User.get(session.loggedInUser)
        //println "comment --> ${commentInstance.body}"
        //println "author id--> $params.author"
        render(view: 'forum', model:[forumInstanceModel: forumInstance])

    }

    def edit() {

       /* Discussion discussionInstance = Discussion.get(params.author)
        println "author id--> ${discussionInstance}"
       */ [discussionEdit: Discussion.get(params.id)]
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
            // Means we have to remove the up vote
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
        println discussionInstance.upVotes

        discussionInstance.save()
        redirect(action: "forum", id: discussionInstance.id)
    }
    def downVote() {
        Discussion discussionInstance = Discussion.get(params.id)
        if (!discussionInstance) {
            flash.message = "No discussion found"
            redirect(action: "index")
            return
        }

        User loggedInUserInstance1 = User.get(session.loggedInUser)

        Vote voteInstance = Vote.createCriteria().get {
            eq("author", loggedInUserInstance1)
            eq("entity", VoteEntity.DISCUSSION)
            eq("entityID", discussionInstance.id)
            eq("type", VoteType.DOWN)
        }
        if(voteInstance) {
            voteInstance.delete()

            discussionInstance.downVotes--
        }

        else {
            voteInstance = new Vote()
            voteInstance.author = loggedInUserInstance1
            voteInstance.entity = VoteEntity.DISCUSSION
            voteInstance.type = VoteType.DOWN
            voteInstance.entityID = discussionInstance.id
            voteInstance.save()

            discussionInstance.downVotes++
        }
        println discussionInstance.downVotes
        discussionInstance.save()
        redirect(action: "forum", id: discussionInstance.id)

    }

    def comment(Long id) {

        Discussion discussionInstance = Discussion.get(params.id)
        println "id--> ${discussionInstance.id}"
        println "user --> $session.loggedInUser"
        User loggedInUserInstance3 = User.get(session.loggedInUser)

        Comment commentInstance = new Comment()
        commentInstance.author = loggedInUserInstance3
        println "author--> $commentInstance.author"
        commentInstance.body = params.discussionComment
        println "cmmnt --> $commentInstance.body"
        commentInstance.entity = CommentEntity.DISCUSSION
        println "entity--> $commentInstance.entity"
        commentInstance.entityID = discussionInstance.id
        println "Entity--> $commentInstance.entityID"
        commentInstance.upVotes = 0l
        println "upvote--> $commentInstance.upVotes"
        commentInstance.downVotes = 0l
        println "downvote--> $commentInstance.downVotes"
        commentInstance.save()
        println "conclusion--> $commentInstance"

        redirect(action: "forum", id: discussionInstance.id)
    }

}

