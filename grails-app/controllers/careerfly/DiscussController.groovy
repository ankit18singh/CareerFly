package careerfly

import com.careerfly.social.Discussion
import java.text.SimpleDateFormat

class DiscussController {

    def index() {

        [viewAll: Discussion.list()]
    }

    def save(String newtitle, String newbody, String newlink) {

        Date dt = new Date()
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
        String currentTime = sdf.format(dt)
        //println currentTime

        Discussion discussionInstance= new Discussion([title: newtitle, body: newbody, link: newlink, author: 1,
                                                       file: 1, upVotes: 0, downVotes: 0,dateCreated: currentTime,
                                                       lastUpdated: currentTime])
        discussionInstance.save()
        //println "disc--> $disc.id"

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

        Discussion deleteInstance = Discussion.get(params.id)
        deleteInstance.delete(flush: true)
        redirect(action: "index")
    }

}
