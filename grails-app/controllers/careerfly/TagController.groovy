package careerfly
import com.careerfly.taggable.Tag
import org.hibernate.engine.jdbc.spi.SqlExceptionHelper

class TagController {

    def index() {

    }

    def save() {

        int i,j;
        String getToken = params.token;
        String[] tags = getToken.split(", ");

        if (!tags[0]) {
            //empty input
            print("field is empty")
            flash.error = "Tag Field should not be Empty....! "
            redirect(view: "index")
            return
        }

        for (i = 0; i < tags.length; i++) {
            for (j = i+1; j < tags.length; j++) {
                 if(tags[i].equalsIgnoreCase(tags[j])) {
                    //repeated values are found
                    print(" ")
                    flash.error = "Enter Tags are not Duplicate ....!Try again"
                    redirect(view: "index")
                    return
                }
            }
        }

        Date date = new Date()

        for(i=0; i<tags.length; i++){
            if(Tag.findByName(tags[i])){
               //discussion_tag mapping
                print("//discussion_tag mapping ");
            }
            else{
                Tag tagging = new Tag([dateCreated: date, lastUpdated: date, name: tags[i]]);
                tagging.save();
            }
        }

    }

}

