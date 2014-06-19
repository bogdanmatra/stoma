package my.app.stoma.utils;

/**
 * Created by bmatragociu on 4/7/2014.
 */

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;

import java.io.IOException;
import java.util.Locale;


public class JsonDateSerializer extends JsonSerializer<DateTime> {
    private static final String FORMATTER = ("EEEE, dd MMMM yyyy");

    @Override
    public void serialize(DateTime date, JsonGenerator json, SerializerProvider provider)throws IOException {
        Locale locale = LocaleContextHolder.getLocale();
        String formattedDate = DateTimeFormat.forPattern(FORMATTER).withLocale(locale).print(date);
        json.writeString(formattedDate);
    }
}
