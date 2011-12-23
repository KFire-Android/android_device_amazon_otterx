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

import java.text.DecimalFormat;

import android.util.Log;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.TextView;

public class Sensor_data {
	private static final String ACCEL_DATA = "Accel_Out";
	private static final String MAG_DATA = "Mag_Out";
	private static final String ALS_DATA = "ALS_Out";
	private static final String PROX_DATA = "Proximity_Out";
	private static final String PRESS_DATA = "Pressure_Out";
	private static final String GYRO_DATA = "Gyroscope_Out";
	private static final String TEMP_DATA = "Temperature_Out";
	private static final String INFO_TAG = "Information: ";
	public SensorManager sensmang;
	public Sensor proximity;
	public Sensor alsensor;
	public Sensor accelerometer;
	public Sensor magnetometer;
	public Sensor pressure;
	public Sensor temperature;
	public Sensor gyroscope;
	public TextView prox, prox_lbl, press, press_lbl, temp_lbl, temp;
	public TextView als, als_lbl, accel_lbl, mag_lbl;
	public TextView gyro, gyro_lbl;
	public TextView accel_x, accel_y, accel_z;
	public TextView mag_x, mag_y, mag_z;
	public TextView gyro_x, gyro_y, gyro_z;
	public CheckBox accel_check, mag_check, gyro_check;
	public boolean accel_state, mag_state, gyro_state;
	public Button accel_delay_butt, mag_delay_butt, press_unit_butt, temp_unit_butt;
	public Button gyro_delay_butt;
	public CheckBox prox_check, pressure_check, temperature_check;
	public boolean prox_state, pressure_state, temperature_state;
	public DecimalFormat round;
	public int pressure_measurement = 0;
	public int temperature_measurement = 0;
	private double mmHG_Conv = 0.7500616827042;
	private double inHG_Conv = 0.029529983071;

	public int sensor_delay = sensmang.SENSOR_DELAY_FASTEST;

	public SensorEventListener proxEventListener = new SensorEventListener() {
		public void onAccuracyChanged(Sensor sensor, int accuracy) {
			// TODO Auto-generated method stub
		}
		public void onSensorChanged(SensorEvent event) {

			if (event.values[0] <= 3) {
				Log.d(PROX_DATA, "Proximity State: NEAR");
				prox.setText("Proximity State: NEAR");
			} else {
				Log.d(PROX_DATA, "Proximity State: FAR");
				prox.setText("Proximity State: FAR");
			}
		}
	};

	public SensorEventListener alsEventListener = new SensorEventListener() {
		public void onAccuracyChanged(Sensor sensor, int accuracy) {
			// TODO Auto-generated method stub
		}

		public void onSensorChanged(SensorEvent event) {
			als.setText("ALS Reading: " +
				new DecimalFormat("0.00").format(event.values[0]) +
				" lux");
			Log.d(ALS_DATA, "ALS Reading: " + event.values[0] + " Lux");
		}
	};

	public SensorEventListener accelEventListener = new SensorEventListener() {
		public void onAccuracyChanged(Sensor sensor, int accuracy) {
			// TODO Auto-generated method stub
		}

		public void onSensorChanged(SensorEvent event) {
			if (Main.data.accel_state == true) {
				accel_x.setText("X Data: " + round.format(event.values[0]) + " m/s^2");
				accel_y.setText("Y Data: " + round.format(event.values[1]) + " m/s^2");
				accel_z.setText("Z Data: " + round.format(event.values[2]) + " m/s^2");

				Log.d(ACCEL_DATA, "Accl X Data: " + round.format(event.values[0]) + " m/s^2");
				Log.d(ACCEL_DATA, "Accl Y Data: " + round.format(event.values[1]) + " m/s^2");
				Log.d(ACCEL_DATA, "Accl Z Data: " + round.format(event.values[2]) + " m/s^2");
			} else {
				Log.d(ACCEL_DATA, INFO_TAG + "Received one more data set while disabling");
				Log.d(ACCEL_DATA, "Accl X Data: " + round.format(event.values[0]) + " m/s^2");
				Log.d(ACCEL_DATA, "Accl Y Data: " + round.format(event.values[1]) + " m/s^2");
				Log.d(ACCEL_DATA, "Accl Z Data: " + round.format(event.values[2]) + " m/s^2");

			}
		}
	};

	public SensorEventListener magEventListener = new SensorEventListener() {
		public void onAccuracyChanged(Sensor sensor, int accuracy) {
			// TODO Auto-generated method stub
		}

		public void onSensorChanged(SensorEvent event) {
			if (Main.data.mag_state == true) {
				mag_x.setText("X Data: " + round.format(event.values[0]) + " micro Tesla");
				mag_y.setText("Y Data: " + round.format(event.values[1]) + " micro Tesla");
				mag_z.setText("Z Data: " + round.format(event.values[2]) + " micro Tesla");

				Log.d(MAG_DATA, "Mag X Data: " + round.format(event.values[0]) + " micro Tesla");
				Log.d(MAG_DATA, "Mag Y Data: " + round.format(event.values[1]) + " micro Tesla");
				Log.d(MAG_DATA, "Mag Z Data: " + round.format(event.values[2]) + " micro Tesla");
			} else {
				Log.d(MAG_DATA, INFO_TAG + "Received one more data set while disabling");
				Log.d(MAG_DATA, "Mag X Data: " + round.format(event.values[0]) + " micro Tesla");
				Log.d(MAG_DATA, "Mag Y Data: " + round.format(event.values[1]) + " micro Tesla");
				Log.d(MAG_DATA, "Mag Z Data: " + round.format(event.values[2]) + " micro Tesla");
			}
		}
	};

        public SensorEventListener gyroEventListener = new SensorEventListener() {
		public void onAccuracyChanged(Sensor sensor, int accuracy) {
			// TODO Auto-generated method stub
		}

		public void onSensorChanged(SensorEvent event) {
			if (Main.data.gyro_state == true) {
				gyro_x.setText("X Data: " + round.format(event.values[0]) + " rad/s");
				gyro_y.setText("Y Data: " + round.format(event.values[1]) + " rad/s");
				gyro_z.setText("Z Data: " + round.format(event.values[2]) + " rad/s");

				Log.d(GYRO_DATA, "Gyro X Data: " + round.format(event.values[0]) + " rad/s");
				Log.d(GYRO_DATA, "Gyro Y Data: " + round.format(event.values[1]) + " rad/s");
				Log.d(GYRO_DATA, "Gyro Z Data: " + round.format(event.values[2]) + " rad/s");
			} else {
				Log.d(GYRO_DATA, INFO_TAG + "Received one more data set while disabling");
				Log.d(GYRO_DATA, "Gyro X Data: " + round.format(event.values[0]) + " rad/s");
				Log.d(GYRO_DATA, "Gyro Y Data: " + round.format(event.values[1]) + " rad/s");
				Log.d(GYRO_DATA, "Gyro Z Data: " + round.format(event.values[2]) + " rad/s");
			}
		}
	};

	public SensorEventListener pressureEventListener = new SensorEventListener() {
		public void onAccuracyChanged(Sensor sensor, int accuracy) {
			// TODO Auto-generated method stub
		}

		public void onSensorChanged(SensorEvent event) {
			if (event.sensor.getType() == Sensor.TYPE_PRESSURE) {
				if (pressure_measurement == 0) {
					press.setText("Pressure Reading: " + event.values[0] + " N/m^2");
					Log.d(PRESS_DATA, "Pressure Reading: " + event.values[0] + " N/m^2");
				} else if (pressure_measurement == 1) {
					press.setText("Pressure Reading: " + (event.values[0] * mmHG_Conv) + " mmHg");
					Log.d(PRESS_DATA, "Pressure Reading: " + (event.values[0] * mmHG_Conv) + " mmHg");
				} else if (pressure_measurement == 2) {
					press.setText("Pressure Reading: " + (event.values[0] * inHG_Conv) + " inHg");
					Log.d(PRESS_DATA, "Pressure Reading: " + (event.values[0] * inHG_Conv) + " inHg");
				}
			}
		}
	};

	public SensorEventListener temperatureEventListener = new SensorEventListener() {
		public void onAccuracyChanged(Sensor sensor, int accuracy) {
			// TODO Auto-generated method stub
		}

		public void onSensorChanged(SensorEvent event) {
			if (event.sensor.getType() == Sensor.TYPE_TEMPERATURE) {
				if (temperature_measurement == 0) {
					temp.setText("Temperature Reading: " + event.values[0] + " C");
					Log.d(TEMP_DATA, "Temperature Reading: " + event.values[0] + " C");
				} else if (temperature_measurement == 1) {
					temp.setText("Temperature Reading: " + (event.values[0] * 1.8f + 32) + " F");
					Log.d(TEMP_DATA, "Temperature Reading: " + (event.values[0] * 1.8f + 32) + " F");
				}
			}
		}
	};

	public Sensor_data(DecimalFormat round) {
		this.round = round;
	}
}
