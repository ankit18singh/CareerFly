package careerfly
import com.careerfly.taggable.Tag

class TagController {

    def index() { }
    def save() {
        String getToken = params.token;
        String[] tags = getToken.split(",");
        Date date = new Date()
        for(int i=0;i<tags.length;i++){

           String mainTag= tags[i];
            Tag tagging = new Tag([dateCreated:date,lastUpdated:date,name:mainTag]);
            print(tagging.name)
            tagging.save();
        }
    }
}
