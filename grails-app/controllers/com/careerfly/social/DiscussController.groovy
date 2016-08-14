package com.careerfly.social

import com.careerfly.user.User



class DiscussController {

    def index() {

        //[viewAll: Discussion.list()]
        println(params.int('newsFeeds'))
        Integer value = params.int('newsFeeds')

        if(value == 1) {
            [viewAll: Discussion.list()]
        }
        else if(value == 2) {
            [viewAll: Discussion.listOrderByLastUpdated(order:"desc")]
        }
        else if(value == 3) {
            [viewAll: Discussion.listOrderByUpVotes(order:"desc")]
        }

    }

    def save(String newtitle, String newbody, String newlink) {

        User userInstance = User.get(session.loggedInUser)

        Discussion discussionInstance= new Discussion([title: newtitle, body: newbody, link: newlink, author: userInstance,
                                                       file: 1])
        println "discussion body-- > ${discussionInstance.body}"
        discussionInstance.save()
        if(discussionInstance.hasErrors()){
            println "error caught!!"
            flash.error = "Please Enter Discussion Correctly"
            render(view: "create", model:[reloadSaveCreateInstance: discussionInstance])
            return
        }/*
        println "author id--> $discussionInstance.author"*/
        else{
            redirect(action: 'forum', id: discussionInstance.id, author: discussionInstance.author)
        }

    }

    def create() {
        [reloadSave: new Discussion()]
    }

    def forum(Long id) {
        println "FORUM id -->$id"
            println "Parent comment Instance in Forum -- > ${id}"

            Discussion forumInstance = Discussion.get(params.id)

            render(view: 'forum', model: [forumInstanceModel: forumInstance])
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
        if(updatedInstance.hasErrors()){
            flash.error = "Please Enter Values Correctly!"
            render(view: "edit", model:[reloadSaveUpdateInstance: updatedInstance])
            return
        }
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
            discussionInstance.downVotes++

        } else {
            voteInstance = new Vote()
            voteInstance.author = loggedInUserInstance
            voteInstance.entity = VoteEntity.DISCUSSION
            voteInstance.type = VoteType.UP
            voteInstance.entityID = discussionInstance.id // params.id
            voteInstance.save()

            discussionInstance.upVotes++
            if(discussionInstance.downVotes!=0) {
                discussionInstance.downVotes--
            }

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
            discussionInstance.upVotes++
        }

        else {
            voteInstance = new Vote()
            voteInstance.author = loggedInUserInstance1
            voteInstance.entity = VoteEntity.DISCUSSION
            voteInstance.type = VoteType.DOWN
            voteInstance.entityID = discussionInstance.id
            voteInstance.save()

            discussionInstance.downVotes++
            if(discussionInstance.upVotes!=0) {
                discussionInstance.upVotes--
            }
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

        Comment commentInstance = new Comment(author: loggedInUserInstance3, body: params.discussionComment, entity:
                CommentEntity.DISCUSSION, entityID: discussionInstance.id, downVotes: 0l, upVotes: 0l)
        /*commentInstance.author = loggedInUserInstance3
        println "author--> $commentInstance.author"
        commentInstance.body = discussionComment
        println "cmmnt --> $commentInstance.body"
        if(commentInstance.body == ""){
            println "blank space"
        }
        commentInstance.entity = CommentEntity.DISCUSSION
        println "entity--> $commentInstance.entity"
        commentInstance.entityID = discussionInstance.id
        println "Entity--> $commentInstance.entityID"
        commentInstance.upVotes = 0l
        println "upvote--> $commentInstance.upVotes"
        commentInstance.downVotes = 0l
        println "downvote--> $commentInstance.downVotes"
        */
        println "conclusion--> $commentInstance"
        commentInstance.save()

        if(commentInstance.hasErrors())
        {
            println "error caught for commetn"
            flash.error = "Blank Comment Cannot be posted!"
            render(view: "forum", model:[reloadCommentInstanceModel: commentInstance])
            return
        }
        
        redirect(action: "forum", id: discussionInstance.id)
    }
    def commentUpVote() {

        Comment commentInstance = Comment.get(params.id)
      //  println ("comment vote "+ commentInstance.id)
        if(!commentInstance) {
            flash.message = "No comment found"
            redirect(action: "index")
            return
        }
        User loggedInUserInstance1 = User.get(session.loggedInUser)

        Vote voteInstance = Vote.createCriteria().get {
            eq("author", loggedInUserInstance1)
            eq("entity", VoteEntity.COMMENT)
            eq("entityID", commentInstance.id)
            eq("type", VoteType.UP)
        }
        if(voteInstance) {
            voteInstance.delete()
            commentInstance.upVotes--
            commentInstance.downVotes++
        }
        else {
            voteInstance = new Vote()
            voteInstance.author = loggedInUserInstance1
            voteInstance.entity = VoteEntity.COMMENT
            voteInstance.type = VoteType.UP
            voteInstance.entityID = commentInstance.id
            voteInstance.save()

            commentInstance.upVotes++
            println ("upvote")
            if(commentInstance.downVotes!=0) {
                commentInstance.downVotes--
            }
        }
        println ("COMMENT UP"+commentInstance.upVotes)
        println("comment id :"+commentInstance.id)
        commentInstance.save()

        println "Comment - discussion - id : ---- ${commentInstance.entityID}"
        redirect(action: "forum",  id: commentInstance.entityID)


    }

    def commentDownVote() {
        Comment commentInstance = Comment.get(params.id)
        if (!commentInstance) {
            flash.message = "No discussion found"
            redirect(action: "index")
            return
        }

        User loggedInUserInstance1 = User.get(session.loggedInUser)

        Vote voteInstance = Vote.createCriteria().get {
            eq("author", loggedInUserInstance1)
            eq("entity", VoteEntity.COMMENT)
            eq("entityID", commentInstance.id)
            eq("type", VoteType.DOWN)
        }
        if(voteInstance) {
            voteInstance.delete()

            commentInstance.downVotes--
            commentInstance.upVotes++
        }

        else {
            voteInstance = new Vote()
            voteInstance.author = loggedInUserInstance1
            voteInstance.entity = VoteEntity.COMMENT
            voteInstance.type = VoteType.DOWN
            voteInstance.entityID = commentInstance.id
            voteInstance.save()

            commentInstance.downVotes++
            if(commentInstance.upVotes!=0) {
                commentInstance.upVotes--
            }
        }
        println ("COMMENT DOWN"+commentInstance.downVotes)
        commentInstance.save()
        redirect(action: "forum", id: commentInstance.entityID)
    }

    def subComment() {

        User loggedInUserInstance = User.get(session.loggedInUser)
        Comment parentCommentIdInstance = Comment.get(params.id)
        println "parent id--> ${parentCommentIdInstance}"

        Comment subCommentInstance = new Comment()
        subCommentInstance.author = loggedInUserInstance
        subCommentInstance.body = params.replyBox
        subCommentInstance.downVotes = 0l
        subCommentInstance.upVotes = 0l
        subCommentInstance.entity = CommentEntity.COMMENT
        subCommentInstance.entityID = parentCommentIdInstance.id
        subCommentInstance.save()
        println "success!"

        redirect(action: "forum", id: parentCommentIdInstance.entityID)
    }
}

