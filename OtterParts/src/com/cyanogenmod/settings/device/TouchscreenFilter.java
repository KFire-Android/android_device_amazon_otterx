package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;

public class TouchscreenFilter implements OnPreferenceChangeListener {

    private static final String FILE =
            "/sys/devices/platform/omap/omap_i2c.2/i2c-2/2-0041/touch_filter";

    public static boolean isSupported() {
        return Utils.fileExists(FILE);
    }

    /**
     * Restore backlight timeout setting from SharedPreferences. (Write to kernel.)
     * @param context       The context to read the SharedPreferences from
     */
    public static void restore(Context context) {
        if (!isSupported()) {
            return;
        }

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        Utils.writeValue(FILE,
                String.valueOf(sharedPrefs.getInt(DeviceSettings.KEY_TOUCH_SLIDER, 0)));
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        Utils.writeValue(FILE, String.valueOf((Integer) newValue));
        preference.setSummary(String.valueOf((Integer) newValue));
        return true;
    }
}
