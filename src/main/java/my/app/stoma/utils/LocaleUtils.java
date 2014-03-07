package my.app.stoma.utils;

import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by bmatragociu on 3/7/14.
 */

public final class LocaleUtils {

    private LocaleUtils() {
    }

    public static String getLanguage(HttpServletRequest request) {

        return RequestContextUtils.getLocaleResolver(request)
                .resolveLocale(request).getLanguage();
    }
}
