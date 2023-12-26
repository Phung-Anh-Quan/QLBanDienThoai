package net.app.project.helper;

import java.text.NumberFormat;
import java.util.Locale;

public class FormatCurrency {
    private static Locale vietnamLocale;
    public static Locale getVietNamLocale(){
        if(vietnamLocale == null){
            vietnamLocale = new Locale("vi", "VN");
        }
        return vietnamLocale;
    }
    public static String formatCurrency(double amount) {
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(getVietNamLocale());
        return currencyFormatter.format(amount);
    }
}
