/*
 * Android Sensor Test Application
 *
 * Copyright 2010 Texas Instruments, Inc. - http://www.ti.com/
 *
 * Written by Dan Murphy <dmurphy@ti.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package sensor.test.com.android.sensor;

import android.app.Activity;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.util.Log;
import android.widget.Toast;

public class Sensor_management extends Activity {
	private static final String TAG = "SensorApp";
	private static final String TESTING_TAG = "SensorTestOutput";
	private static final String FAIL_TAG = "FAILIED: ";
	private static final String WARN_TAG = "WARNING: ";
	private static final String INFO_TAG = "Information: ";
	public SensorManager sensmang;
	public int sensor_to_manage;
	public boolean ok_to_toast = false;

	/**
	 * @param sensor_type - Sensor type from Sensor Manager
	 * @param state - true for turning on the sensor false for turning off the sensor
	 * @return - void
	 */
	public void set_sensor_state(int sensor_type, boolean state, int delay) {
		boolean sensor_return = true;

		if (sensor_type == Sensor.TYPE_ACCELEROMETER) {
			 if (state) {
				 sensor_return = Main.data.sensmang.registerListener(Main.data.accelEventListener,
													 Main.data.accelerometer,
													delay);
			    if (sensor_return != true) {
				Log.e(TESTING_TAG, FAIL_TAG + "Accelerometer failed to register!");
				Main.data.accel_state = false;
				Main.data.accel_check.setChecked(false);
				Main.data.accel_delay_butt.setEnabled(false);
				Main.data.accel_x.setText("X Data: N/A");
				Main.data.accel_y.setText("Y Data: N/A");
				Main.data.accel_z.setText("Z Data: N/A");
			    } else {
				 make_a_toast("Accelerometer Sensor Enabled");
				   Main.data.accel_x.setText("X Data: Enabled");
				   Main.data.accel_y.setText("Y Data: Enabled");
				   Main.data.accel_z.setText("Z Data: Enabled");
				 Log.d(TESTING_TAG, INFO_TAG + "Accelerometer Sensor Enabled.");
			    }
			 } else {
				 Main.data.sensmang.unregisterListener(Main.data.accelEventListener);
				 make_a_toast("Accelerometer Sensor Disabled");
				   Main.data.accel_x.setText("X Data: Disabled");
				   Main.data.accel_y.setText("Y Data: Disabled");
				   Main.data.accel_z.setText("Z Data: Disabled");
			       Log.d(TESTING_TAG, INFO_TAG + "Accelerometer Sensor Disabled.");
			 }

		} else if (sensor_type == Sensor.TYPE_MAGNETIC_FIELD) {
			 if (state) {
				 sensor_return = Main.data.sensmang.registerListener(Main.data.magEventListener,
										     Main.data.magnetometer,
										     delay);
				 if(sensor_return != true) {
					Log.e(TESTING_TAG, FAIL_TAG + "Magnetometer failed to register!");
					Main.data.mag_state = false;
					Main.data.mag_check.setChecked(false);
					Main.data.mag_delay_butt.setEnabled(false);
					Main.data.mag_x.setText("X Data: N/A");
					Main.data.mag_y.setText("Y Data: N/A");
					Main.data.mag_z.setText("Z Data: N/A");

					} else {
						make_a_toast("Magnetometer Sensor Enabled");
						Main.data.mag_x.setText("X Data: Enabled");
						Main.data.mag_y.setText("Y Data: Enabled");
						Main.data.mag_z.setText("Z Data: Enabled");
						Log.d(TESTING_TAG, INFO_TAG + "Magnetometer Sensor Enabled.");
				    }
			 } else {
				   Main.data.sensmang.unregisterListener(Main.data.magEventListener);
				   make_a_toast("Magnetometer Sensor Disabled");
				   Main.data.mag_x.setText("X Data: Disabled");
				   Main.data.mag_y.setText("Y Data: Disabled");
				   Main.data.mag_z.setText("Z Data: Disabled");
				   Log.d(TESTING_TAG, INFO_TAG + "Magnetometer Sensor Disabled.");
			 }

		} else if (sensor_type == Sensor.TYPE_PROXIMITY) {
			 if (state) {
				 sensor_return = Main.data.sensmang.registerListener(Main.data.proxEventListener,
									             Main.data.proximity,
										     delay);
				 if (sensor_return != true) {
					Log.e(TESTING_TAG, FAIL_TAG + "Proximity failed to register!");
					Main.data.prox_state = false;
					Main.data.prox_check.setChecked(false);
					Main.data.prox.setText("Proximity State: N/A");
				 } else {
					  make_a_toast("Proximity Sensor Enabled");
					  Main.data.prox.setText("Proximity State: Enabled");
					  Log.d(TESTING_TAG, INFO_TAG + "Proximity State: Enable");
				 }
			 } else {
			    Main.data.sensmang.unregisterListener(Main.data.proxEventListener);
			    make_a_toast("Proximity Sensor Disabled");
			    Main.data.prox.setText("Proximity State: Disabled");
			    Log.d(TESTING_TAG, INFO_TAG + "Proximity State: Disabled");
			 }

		 } else if (sensor_type == Sensor.TYPE_LIGHT) {
			 if (state) {
				 sensor_return = Main.data.sensmang.registerListener(Main.data.alsEventListener,
													 Main.data.alsensor,
													delay);
				 if (sensor_return != true) {
					Log.e(TESTING_TAG, FAIL_TAG + "Ambient Light Sensor failed to register!");
					Main.data.als.setText("ALS Reading:  N/A");
				 }
			 } else
				 Main.data.sensmang.unregisterListener(Main.data.alsEventListener);

		 } else if (sensor_type == Sensor.TYPE_PRESSURE) {
			 if (state) {
				 sensor_return = Main.data.sensmang.registerListener(Main.data.pressureEventListener,
										     Main.data.pressure,
										     delay);
				 if(sensor_return != true) {
					Log.e(TESTING_TAG, FAIL_TAG + "Pressure Sensor failed to register!");
					Main.data.pressure_state = false;
					Main.data.pressure_check.setChecked(false);
					Main.data.press.setText("Pressure Reading: N/A");
				    } else {
					make_a_toast("Pressure Sensor Enabled");
				        Main.data.press.setText("Pressure Reading: Enabled");
					Log.d(TAG, INFO_TAG + "Pressure Reading: Enable");
				    }
			 } else {
				Main.data.sensmang.unregisterListener(Main.data.pressureEventListener);
				make_a_toast("Pressure Sensor Disabled");
				Main.data.press.setText("Pressure Reading: Disabled");
				Log.d(TAG, INFO_TAG + "Pressure Reading: Disabled");
			 }

		 } else if (sensor_type == Sensor.TYPE_TEMPERATURE) {
			 if (state) {
				 sensor_return = Main.data.sensmang.registerListener(Main.data.temperatureEventListener,
										     Main.data.temperature,
										     delay);
				 if(sensor_return != true) {
					Log.e(TESTING_TAG, FAIL_TAG + "Temperature Sensor failed to register!");
					Main.data.temperature_state = false;
					Main.data.temperature_check.setChecked(false);
					Main.data.temp.setText("Temperature Reading: N/A");
				    } else {
					make_a_toast("Temperature Sensor Enabled");
				        Main.data.temp.setText("Temperature Reading: Enabled");
					    Log.d(TAG, INFO_TAG + "Temperature Reading: Enable");
				    }
				 } else {
					Main.data.sensmang.unregisterListener(Main.data.temperatureEventListener);
					make_a_toast("Temperature Sensor Disabled");
					Main.data.temp.setText("Temperature Reading: Disabled");
					Log.d(TAG, INFO_TAG + "Temperature Reading: Disabled");
				 }

		 } else if (sensor_type == Sensor.TYPE_GYROSCOPE) {
			 if (state) {
				 sensor_return = Main.data.sensmang.registerListener(Main.data.gyroEventListener,
										     Main.data.gyroscope,
										     delay);
				 if(sensor_return != true) {
					Log.e(TESTING_TAG, FAIL_TAG + "Gyroscope Sensor failed to register!");
					Main.data.gyro_state = false;
					Main.data.gyro_check.setChecked(false);
					Main.data.gyro_x.setText("X Data: N/A");
				        Main.data.gyro_y.setText("Y Data: N/A");
				        Main.data.gyro_z.setText("Z Data: N/A");

				    } else {
					make_a_toast("Gyroscope Sensor Enabled");
				        Main.data.gyro_x.setText("X Data: Enabled");
				        Main.data.gyro_y.setText("Y Data: Enabled");
				        Main.data.gyro_z.setText("Z Data: Enabled");
                                        Log.d(TAG, INFO_TAG + "Gyroscope Reading: Enable");
				    }
			 } else {
				Main.data.sensmang.unregisterListener(Main.data.gyroEventListener);
				make_a_toast("Gyroscope Sensor Disabled");
				Main.data.gyro_x.setText("X Data: Disabled");
				Main.data.gyro_y.setText("Y Data: Disabled");
				Main.data.gyro_z.setText("Z Data: Disabled");
                                Log.d(TAG, INFO_TAG + "Gyroscope Reading: Disabled");
			 }

		 } else {
			 Log.e(TAG, WARN_TAG + "Invalid parameter passed to set_sensor_state.");
			 sensor_return = false;
		 }

	}

	/**
	 * @param sensor_type - Sensor type from Sensor Manager
	 * @param delay - Sensor delay from the Sensor Manager
	 * @return 0 for pass and <0 for a failure
	 */
	public boolean set_sensor_delay(int sensor_type, int delay) {
		boolean sensor_return = true;

		if (Main.data.accel_state) {
			Main.data.sensmang.unregisterListener(Main.data.accelEventListener);
			set_sensor_state(Sensor.TYPE_ACCELEROMETER, Main.data.accel_state, delay);
		}
		if (Main.data.mag_state) {
			Main.data.sensmang.unregisterListener(Main.data.magEventListener);
			set_sensor_state(Sensor.TYPE_MAGNETIC_FIELD, Main.data.mag_state, delay);
		}
		if (Main.data.prox_state) {
			Main.data.sensmang.unregisterListener(Main.data.proxEventListener);
			set_sensor_state(Sensor.TYPE_PROXIMITY, true, delay);
		}
		if (Main.data.temperature_state) {
			Main.data.sensmang.unregisterListener(Main.data.temperatureEventListener);
			set_sensor_state(Sensor.TYPE_TEMPERATURE, true, delay);
		}
		if (Main.data.pressure_state) {
			Main.data.sensmang.unregisterListener(Main.data.pressureEventListener);
			set_sensor_state(Sensor.TYPE_PRESSURE, true, delay);
		}
		if (Main.data.gyro_state) {
			Main.data.sensmang.unregisterListener(Main.data.gyroEventListener);
			set_sensor_state(Sensor.TYPE_GYROSCOPE, true, delay);
		}

		Main.data.sensmang.unregisterListener(Main.data.alsEventListener);
	        set_sensor_state(Sensor.TYPE_LIGHT, true, delay);
		return sensor_return;
	}

	/**
	 * @param toast_string - String to present in the toast
	 */
	public void make_a_toast(CharSequence toast_string) {

		if (this.ok_to_toast) {
			 Toast.makeText(getBaseContext(), toast_string,
					Toast.LENGTH_SHORT).show();
		}
	}
	public Sensor_management() {
		super();
	}
}
