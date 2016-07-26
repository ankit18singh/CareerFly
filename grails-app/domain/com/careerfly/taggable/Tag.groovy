package com.careerfly.taggable

import com.careerfly.social.Discussion

class Tag {

    String name
    Date dateCreated
    Date lastUpdated
   // Discussion obj

    static constraints = {
       name nullable: true;
    }

   // static belongsTo = [discussion : Discussion]

   /* static mapping = {
        table 'Tag'
        obj column: 'code_1'
    }*/
}
