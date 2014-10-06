package my.app.stoma.utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

/**
 * Created by bmatragociu on 10/6/2014.
 */
public class JSoupStripClass {

    public static String jsoupStrip(String content){
        String result="";
        Document doc = Jsoup.parseBodyFragment(content);
        Element body = doc.body();
        if (!body.children().isEmpty()) {
            result = body.children().first().outerHtml();
        }else{
            result=body.outerHtml();
        }
        if (result == null) result = body.outerHtml();
        return result;
    }

}
