<div class="comments bg-success">
    <div class="media">
        <div class="media-left">
            <a href="#">
                <asset:image class="media-class img-circle" src="dp.png"
                             width="64px"/>
            </a>
        </div>

        <div class="media-body">
            <h4 class="media-heading">${commentInstance.author.firstName + " " + commentInstance.author.lastName}</h4>

            <p>${raw(commentInstance.body)}</p>

            <div class="row">
                <div class="col-sm-1 col-md-1">
                    <a href="/discuss/commentUpVote/${commentInstance.id}"
                       class="btn btn-default"><span
                            class="badge">${commentInstance.upVotes}</span><i
                            class="fa fa-thumbs-up" aria-hidden="true"></i></a>
                </div>

                <div class="col-sm-1 col-md-1">
                    <a href="/discuss/commentDownVote/${commentInstance.id}"
                       class="btn btn-default"><span
                            class="badge">${commentInstance.downVotes}</span><i
                            class="fa fa-thumbs-down" aria-hidden="true"></i></a>
                </div>
            </div>

            <g:form controller="discuss" action="subComment" method="post"
                    id="${commentInstance.id}">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <g:textArea name="replyBox"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <g:submitButton name="reply" class="btn btn-success pull-right"/>
                    </div>
                </div>
            </g:form>

            <g:each in="${commentInstance.getImmediateChildComments()}" var="comment">
                <g:render template="comment" model="[commentInstance: comment]"></g:render>
            </g:each>
        </div>
    </div>
</div>