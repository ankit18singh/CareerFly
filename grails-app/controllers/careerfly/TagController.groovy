package careerfly
import com.careerfly.taggable.Tag
import org.hibernate.engine.jdbc.spi.SqlExceptionHelper

class TagController {

    def index() {
        [modelIns: new Tag()]
    }
    def save() {

        int i;
        String getToken = params.token;
        String[] tags = getToken.split(",");
        Date date = new Date()

        for(i=0;i<tags.length;i++) {
            String mainTag = tags[i]
            Tag tagging = new Tag([dateCreated: date, lastUpdated: date, name: mainTag]);
               try {
                   tagging.save();
               }
               catch (org.springframework.dao.DuplicateKeyException e ){

                   print("duplicate value")
                       flash.error = "duplicate value"
                       render(view: "index", model: [modelIns: tagging])
                       return
               }
               catch(org.springframework.dao.DataIntegrityViolationException e1){

                    print("field is empty")
                   flash.error = "field is Empty "
                   render(view: "index", model: [modelIns: tagging])
                   return

                }


        }

    }
}
