package careerfly

import com.careerfly.social.Discussion
import java.text.SimpleDateFormat

class DiscussController {

    def index() {
        [viewAll: Discussion.list()]
    }

    def create(){

    }

    def save(String newtitle, String newbody, String newlink) {

        Date dt = new Date()
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
        String currentTime = sdf.format(dt)
        //println currentTime

        Discussion disc= new Discussion([title: newtitle, body: newbody, link: newlink, author: 1, file: 1,
                                         upVotes: 0, downVotes: 0,dateCreated: currentTime, lastUpdated: currentTime])
        disc.save()
        //println "disc--> $disc.id"

        redirect(action: 'forum', id: disc.id)
    }


    def forum(Long id) {
        //println "id -->$id"
        Discussion dd = Discussion.get(params.id)
        //println "id--> $params.id"
        render(view: 'forum', model:[Current: dd])
    }

    def edit() {
        [discussionEdit: Discussion.get(params.id)]
    }

    def update() {

        Discussion updated = Discussion.get(params.id)

        //println "id--> $params.id"

        updated.title = params.newtitle
        updated.body = params.newbody
        updated.link = params.newlink
        updated.tags = params.newtag

        updated.save(flush: true)
        redirect(action: "forum", id: updated.id)
    }

    def delete() {

        Discussion del = Discussion.get(params.id)
        del.delete(flush: true)
        redirect(action: "index")
    }

}
