package com.careerfly.organization.interview

import com.careerfly.user.User

class InterviewListingController {

    def index() {

        User userInstance = User.get(session.loggedInUser)

        List interview = Interview.findAllByCandidate(userInstance)

        [userInstance: userInstance, interview: interview]
    }
}
