package net.app.project.helper;

import java.text.Normalizer;
import java.util.regex.Pattern;

public class HanleString {
    private static HanleString instance;
    private HanleString() {
    }
    public static HanleString getInstance() {
        if (instance == null) {
            instance = new HanleString();
        }
        return instance;
    }
    public String removeDiacriticalMarks(String input) {
        String normalized = Normalizer.normalize(input, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(normalized).replaceAll("");
    }
}
