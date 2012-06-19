/*
 * Copyright (C) 2011 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.util.Log;

import com.cyanogenmod.settings.device.R;

public class TouchscreenFragmentActivity extends PreferenceFragment {

    private static final String PREF_ENABLED = "1";
    private static final String TAG = "OtterParts_Touchscreen";

    private SeekBarPreference mTouchSlider;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        addPreferencesFromResource(R.xml.touchscreen_preferences);

        PreferenceScreen prefSet = getPreferenceScreen();

        SharedPreferences sharedPrefs =
                PreferenceManager.getDefaultSharedPreferences(getActivity());

        mTouchSlider = (SeekBarPreference) prefSet.findPreference(DeviceSettings.KEY_TOUCH_SLIDER);
        mTouchSlider.setDefault(sharedPrefs.getInt(DeviceSettings.KEY_TOUCH_SLIDER, 0));
        mTouchSlider.setOnPreferenceChangeListener(new TouchscreenFilter());
        mTouchSlider.setSummary(String.valueOf(
                sharedPrefs.getInt(DeviceSettings.KEY_TOUCH_SLIDER, 0)));
    }

    public static void restore(Context context) {
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
    }
}
