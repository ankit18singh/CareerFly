package com.careerfly.social

import com.careerfly.taggable.Tag
import com.careerfly.user.User

class DiscussController {

    def index() {
        println(params.int('newsFeeds'))
        Integer value = params.int('newsFeeds')

        if (value == null) {
            [viewAll: Discussion.list()]
        } else if (value == 1) {
            [viewAll: Discussion.list()]
        } else if (value == 1) {
            [viewAll: Discussion.list()]
        } else if (value == 2) {
            [viewAll: Discussion.listOrderByLastUpdated(order: "desc")]
        } else if (value == 3) {
            [viewAll: Discussion.listOrderByUpVotes(order: "desc")]
        }
    }

    def save(String newtitle, String newbody, String newlink , String token) {

        User userInstance = User.get(session.loggedInUser)
        int i,j;
        Set discussTag = token.split(", ");
        //Discussion discussionInstance = new Discussion()
        Discussion discussionInstance = new Discussion()
        println discussionInstance
        println discussionInstance.errors
        println "!!!!!!!!!!!"
        /*if (!discussTag[0]) {
           //empty input
           print("field is empty")
           flash.error = "Tag Field should not be Empty....! "
           redirect(view: "create" ,model : [LastValue : params.token] )
           return
       }

       for (i =0; i < discussTag.length; i++) {
           for (j = i+1; j < discussTag.length; j++) {
               if(discussTag[i].equalsIgnoreCase(discussTag[j])) {
                   //repeated values are found
                   print("repeated ")
                   flash.error = "${discussTag[j]} is repeated in tag. please use once ...!"
                   render(view: "create", model:[reloadSaveCreateInstance: discussionInstance])
                   return
               }
           }
       }

       Date date = new Date()

      /* for(i=0; i<discussTag.length; i++){
           if(Tag.findByName(discussTag[i])){
               //discussion_tag mapping
           }
           else{
               Tag tagging = new Tag([dateCreated: date, lastUpdated: date, name: discussTag[i]]);
               tagging.save();
               //discussion_tag mapping
           }
       }*/
        Tag tagInstance
        discussTag.each {
            tagInstance = Tag.findByName(it)
            println(tagInstance)
            println "!@#######"
            if(!tagInstance){
                println "here at tag!"
                tagInstance = new Tag([name:it]);
                tagInstance.save();
                println tagInstance
                println "@!@!@s"
            }
            println tagInstance
            println discussionInstance
            discussionInstance.tags.add(tagInstance)
        }
        Map discussMap = [title: newtitle, body: newbody, link: newlink, tags :discussionInstance.tags, author: userInstance,
                          file : 1]
        discussionInstance = new Discussion(discussMap)
        println "discussion body-- > ${discussionInstance.body}"
        discussionInstance.save(flush: true)
        if (discussionInstance.hasErrors()) {
            println "error caught!!"
            flash.error = "Please Enter Discussion Correctly"
            render(view: "create", model: [reloadSaveCreateInstance: discussionInstance])
            return
        } else {
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

        updatedInstance.title = newtitle
        updatedInstance.body = newbody
        updatedInstance.link = newlink

        updatedInstance.save(flush: true)
        redirect(action: "forum", id: updatedInstance.id)
    }

    def delete() {
        Discussion discussionInstance = Discussion.get(params.id)
        if (!discussionInstance) {
            flash.message = "No discussion found"
            redirect(action: "index")

        } else {

            discussionInstance.delete(flush: true)
            redirect(action: "index")
        }
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
            if (discussionInstance.downVotes != 0) {
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
        if (voteInstance) {
            voteInstance.delete()

            discussionInstance.downVotes--
            discussionInstance.upVotes++
        } else {
            voteInstance = new Vote()
            voteInstance.author = loggedInUserInstance1
            voteInstance.entity = VoteEntity.DISCUSSION
            voteInstance.type = VoteType.DOWN
            voteInstance.entityID = discussionInstance.id
            voteInstance.save()

            discussionInstance.downVotes++
            if (discussionInstance.upVotes != 0) {
                discussionInstance.upVotes--
            }
        }
        println discussionInstance.downVotes
        discussionInstance.save()
        redirect(action: "forum", id: discussionInstance.id)

    }

    def comment(Long id, String discussionComment) {
        Discussion discussionInstance = Discussion.get(params.id)
        User loggedInUserInstance3 = User.get(session.loggedInUser)

        Comment commentInstance = new Comment(body: discussionComment)
        commentInstance.author = loggedInUserInstance3
        if (commentInstance.body == "") {
            println "blank space"
        }

        commentInstance.entity = CommentEntity.DISCUSSION
        commentInstance.entityID = discussionInstance.id
        commentInstance.upVotes = 0l
        commentInstance.downVotes = 0l
        commentInstance.save(flush: true)

        if (commentInstance.hasErrors()) {
            println "error caught for commetn"
            flash.error = "Blank Comment Cannot be posted!"
            render(view: "forum", model: [reloadCommentInstanceModel: commentInstance])
            return
        }

        redirect(action: "forum", id: discussionInstance.id)
    }

    def commentUpVote() {

        Comment commentInstance = Comment.get(params.id)
        //  println ("comment vote "+ commentInstance.id)
        if (!commentInstance) {
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
        if (voteInstance) {
            voteInstance.delete()
            commentInstance.upVotes--
            commentInstance.downVotes++
        } else {
            voteInstance = new Vote()
            voteInstance.author = loggedInUserInstance1
            voteInstance.entity = VoteEntity.COMMENT
            voteInstance.type = VoteType.UP
            voteInstance.entityID = commentInstance.id
            voteInstance.save()

            commentInstance.upVotes++
            println("upvote")
            if (commentInstance.downVotes != 0) {
                commentInstance.downVotes--
            }
        }
        println("COMMENT UP" + commentInstance.upVotes)
        println("comment id :" + commentInstance.id)
        commentInstance.save()

        println "Comment - discussion - id : ---- ${commentInstance.entityID}"
        redirect(action: "forum", id: commentInstance.entityID)


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
        if (voteInstance) {
            voteInstance.delete()

            commentInstance.downVotes--
            commentInstance.upVotes++
        } else {
            voteInstance = new Vote()
            voteInstance.author = loggedInUserInstance1
            voteInstance.entity = VoteEntity.COMMENT
            voteInstance.type = VoteType.DOWN
            voteInstance.entityID = commentInstance.id
            voteInstance.save()

            commentInstance.downVotes++
            if (commentInstance.upVotes != 0) {
                commentInstance.upVotes--
            }
        }
        println("COMMENT DOWN" + commentInstance.downVotes)
        commentInstance.save()
        redirect(action: "forum", id: commentInstance.entityID)
    }

    def subComment() {

        User loggedInUserInstance = User.get(session.loggedInUser)
        Comment parentCommentIdInstance = Comment.get(params.id)

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

    def search() {
        List searchInstance = Discussion.createCriteria().list {
            like("title", "%${params.searchBox}%")
        }

        if (searchInstance) {
            println "search result= ${searchInstance}"
            render(view: "searchResult", model: [searchInstanceModel: searchInstance])
        } else {
            render("none")
        }
    }

    def searchResult() {

    }
}