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
import java.util.List;

import sensor.test.R;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.util.Log;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.TextView;
import android.widget.Toast;


public class Main extends Activity {
	private static final String TESTING_TAG = "SensorTestOutput";
	private static final String FAIL_TAG = "FAILIED: ";
	private static final String WARN_TAG = "WARNING: ";
	private static final String INFO_TAG = "Information: ";
	private static final String VER_NUM = "1.0";
	static Sensor_data data = new Sensor_data(new DecimalFormat("0.000000"));
	static Sensor_management manage = new Sensor_management();
	public List<Sensor> all;


	public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        this.setTitle(R.string.app_title);
	Log.d(TESTING_TAG, "Texas Instruments Sensor Test Application: " + VER_NUM);
        //Acquire SensorManager
	    data.sensmang = (SensorManager) getSystemService(SENSOR_SERVICE);
	    all = data.sensmang.getSensorList(Sensor.TYPE_ALL);
	    for (int i = 0; i < all.size(); i++) {
		Sensor s = all.get(i);
			Log.d(TESTING_TAG, "Found Sensor: " + s.getName());
			Log.d(TESTING_TAG, "     Vendor: " + s.getVendor());
			Log.d(TESTING_TAG, "     Max: " + s.getMaximumRange());
			Log.d(TESTING_TAG, "     Resolution: " + s.getResolution());
			Log.d(TESTING_TAG, "     Version: " + s.getVersion());
	    };

	   //Proximity initialisation
       data.proximity = data.sensmang.getDefaultSensor(Sensor.TYPE_PROXIMITY);
       data.prox_lbl = (TextView) findViewById(R.id.prox_lbl_id);
       data.prox = (TextView) findViewById(R.id.proximity);
       data.prox_check = (CheckBox) findViewById(R.id.prox_check_box);
       data.prox_state = false;

       if (data.proximity == null) {
	   Log.d(TESTING_TAG, WARN_TAG + "No proximity sensor avaliable.");
	   data.prox_lbl.setText("No Proximity Sensor available");
	   data.prox.setText("Proximity State: N/A");
	   data.prox_check.setClickable(false);
       } else {
           data.prox_lbl.setText(data.proximity.getName());
           data.prox_check.setChecked(data.prox_state);
           data.prox_check.setClickable(true);
           manage.set_sensor_state(Sensor.TYPE_PROXIMITY, data.prox_state, SensorManager.SENSOR_DELAY_FASTEST);

           data.prox_check.setOnClickListener(new OnClickListener() {
           public void onClick(View arg0) {
		        if (data.prox_check.isChecked())
				data.prox_state = true;
				else
			    data.prox_state = false;

		        manage.set_sensor_state(Sensor.TYPE_PROXIMITY, data.prox_state, data.sensor_delay);
			  }
           });
       }

	    //Ambient Light sensor initialisation
        data.alsensor = data.sensmang.getDefaultSensor(Sensor.TYPE_LIGHT);
        data.als_lbl = (TextView) findViewById(R.id.als_lbl_id);
        data.als = (TextView) findViewById(R.id.light);
        data.accel_lbl = (TextView) findViewById(R.id.accel_lbl_id);

        if (data.alsensor == null) {
	   Log.d(TESTING_TAG, WARN_TAG + "No ALS sensor avaliable.");
	   data.als_lbl.setText("No ALS Sensor available");
	} else {
		data.als_lbl.setText(data.alsensor.getName());
            manage.set_sensor_state(Sensor.TYPE_LIGHT, true, data.sensor_delay);
        }

        //Pressure Sensor initialisation
        data.pressure = data.sensmang.getDefaultSensor(Sensor.TYPE_PRESSURE);
        data.press_lbl = (TextView) findViewById(R.id.pressure_lbl_id);
        data.press = (TextView) findViewById(R.id.pressure);
        data.pressure_check = (CheckBox) findViewById(R.id.pressure_check_box);
	    data.press_unit_butt = (Button) findViewById(R.id.press_unit);
        data.pressure_state = false;

        if (data.pressure == null) {
	   Log.d(TESTING_TAG, WARN_TAG + "No pressure sensor avaliable.");
	   data.press_lbl.setText("No Pressure Sensor available");
	   data.press.setText("Pressure Reading: N/A");
           data.press_unit_butt.setText("N/A");
	   data.pressure_check.setClickable(false);
	   data.press_unit_butt.setEnabled(false);
        } else {
            data.press_lbl.setText(data.pressure.getName());
            data.pressure_check.setChecked(data.pressure_state);
            data.pressure_check.setClickable(true);
            manage.set_sensor_state(Sensor.TYPE_PRESSURE, data.pressure_state, data.sensor_delay);
            registerForContextMenu(findViewById(R.id.press_unit));
	        data.pressure_check.setOnClickListener(new OnClickListener() {
            public void onClick(View arg0) {
		        if (data.pressure_check.isChecked())
				data.pressure_state = true;
			else
			        data.pressure_state = false;
			manage.set_sensor_state(Sensor.TYPE_PRESSURE,  data.pressure_state, data.sensor_delay);
		}
            });
        }
        //Temperature Sensor initialisation
        data.temperature = data.sensmang.getDefaultSensor(Sensor.TYPE_TEMPERATURE);
        data.temp_lbl = (TextView) findViewById(R.id.temp_lbl_id);
        data.temp = (TextView) findViewById(R.id.temperature);
        data.temperature_check = (CheckBox) findViewById(R.id.temp_check_box);
	    data.temp_unit_butt = (Button) findViewById(R.id.temp_unit);
        data.temperature_state = false;

        if ( data.temperature == null) {
		   Log.d(TESTING_TAG, WARN_TAG + "No temperature sensor avaliable.");
		   data.temp_lbl.setText("No temperature Sensor available");
		   data.temp.setText("Temperature Reading: N/A");
	       data.temp_unit_butt.setText("N/A");
		   data.temperature_check.setClickable(false);
		   data.temp_unit_butt.setEnabled(false);
        } else {
            data.temp_lbl.setText(data.temperature.getName());
            data.temperature_check.setChecked(data.temperature_state);
            data.temperature_check.setClickable(true);
            manage.set_sensor_state(Sensor.TYPE_TEMPERATURE, data.temperature_state, data.sensor_delay);
            registerForContextMenu(findViewById(R.id.temp_unit));
	        data.temperature_check.setOnClickListener(new OnClickListener() {
            public void onClick(View arg0) {
		        if (data.temperature_check.isChecked())
				data.temperature_state = true;
			else
			        data.temperature_state = false;
			manage.set_sensor_state(Sensor.TYPE_TEMPERATURE,  data.temperature_state, data.sensor_delay);
		}
            });
        }
        //Accelerometer sensor initialisation
	    data.accelerometer = data.sensmang.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
	    data.accel_lbl = (TextView) findViewById(R.id.accel_lbl_id);
	    data.accel_x = (TextView) findViewById(R.id.accel_x);
	    data.accel_y = (TextView) findViewById(R.id.accel_y);
	    data.accel_z = (TextView) findViewById(R.id.accel_z);
	    data.accel_delay_butt = (Button) findViewById(R.id.acc_delay);
	    data.accel_check = (CheckBox) findViewById(R.id.accel_check_box);

	    if (data.accelerometer == null) {
		   Log.d(TESTING_TAG, WARN_TAG + "No Accelerometer sensor avaliable.");
		   data.accel_lbl.setText("No Accelerometer Sensor available");
		   data.accel_check.setClickable(false);
		   data.accel_delay_butt.setEnabled(false);
		   data.accel_delay_butt.setText("N/A");
			   data.accel_x.setText("X Data: N/A");
			   data.accel_y.setText("Y Data: N/A");
			   data.accel_z.setText("Z Data: N/A");

	    } else {
		   data.accel_lbl.setText(data.accelerometer.getName());
		   registerForContextMenu(findViewById(R.id.acc_delay));
		   data.accel_state = false;
		   data.accel_check.setChecked(data.accel_state);
		   manage.set_sensor_state(Sensor.TYPE_ACCELEROMETER, data.accel_state, data.sensor_delay);
		   data.accel_check.setOnClickListener(new OnClickListener() {
		   public void onClick(View arg0) {
			   if (data.accel_check.isChecked())
				   data.accel_state = true;
			   else
				   data.accel_state = false;
			   manage.set_sensor_state(Sensor.TYPE_ACCELEROMETER, data.accel_state, data.sensor_delay);
		   }
	   });
       }

	    //Magnetometer sensor initialisation
	    data.magnetometer = data.sensmang.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD);
	    data.mag_lbl = (TextView) findViewById(R.id.mag_lbl_id);
	    data.mag_x = (TextView) findViewById(R.id.mag_x);
	    data.mag_y = (TextView) findViewById(R.id.mag_y);
	    data.mag_z = (TextView) findViewById(R.id.mag_z);
	    data.mag_delay_butt = (Button) findViewById(R.id.mag_delay);
	    data.mag_check = (CheckBox) findViewById(R.id.mag_check_box);

	    if (data.magnetometer == null) {
		   Log.d(TESTING_TAG, WARN_TAG + "No Magnetometer sensor avaliable.");
		   data.mag_lbl.setText("No Magnetometer Sensor available");
		   data.mag_check.setClickable(false);
		   data.mag_delay_butt.setEnabled(false);
		   data.mag_delay_butt.setText("N/A");
			   data.mag_x.setText("X Data: N/A");
			   data.mag_y.setText("Y Data: N/A");
			   data.mag_z.setText("Z Data: N/A");

	    } else {
		   data.mag_lbl.setText(data.magnetometer.getName());
		   registerForContextMenu(findViewById(R.id.mag_delay));
		   data.mag_state = false;
		   data.mag_check.setChecked(data.accel_state);
		   manage.set_sensor_state(Sensor.TYPE_MAGNETIC_FIELD, data.mag_state, data.sensor_delay);
		   data.mag_check.setOnClickListener(new OnClickListener() {
		   public void onClick(View arg0) {
			   if (data.mag_check.isChecked())
				   data.mag_state = true;
			   else
				   data.mag_state = false;
			   manage.set_sensor_state(Sensor.TYPE_MAGNETIC_FIELD, data.mag_state, data.sensor_delay);
		   }
	   });
       }
        //Gyroscope sensor initialisation
	    data.gyroscope = data.sensmang.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
	    data.gyro_lbl = (TextView) findViewById(R.id.gyro_lbl_id);
	    data.gyro_x = (TextView) findViewById(R.id.gyro_x);
	    data.gyro_y = (TextView) findViewById(R.id.gyro_y);
	    data.gyro_z = (TextView) findViewById(R.id.gyro_z);
	    data.gyro_delay_butt = (Button) findViewById(R.id.gyro_delay);
	    data.gyro_check = (CheckBox) findViewById(R.id.gyro_check_box);

	    if (data.gyroscope == null) {
		   Log.d(TESTING_TAG, WARN_TAG + "No Gyroscope sensor avaliable.");
		   data.gyro_lbl.setText("No Gyroscope Sensor available");
		   data.gyro_check.setClickable(false);
		   data.gyro_delay_butt.setEnabled(false);
		   data.gyro_delay_butt.setText("N/A");
			   data.gyro_x.setText("X Data: N/A");
			   data.gyro_y.setText("Y Data: N/A");
			   data.gyro_z.setText("Z Data: N/A");

	    } else {
		   data.gyro_lbl.setText(data.gyroscope.getName());
		   registerForContextMenu(findViewById(R.id.gyro_delay));
		   data.gyro_state = false;
		   data.gyro_check.setChecked(data.gyro_state);
		   manage.set_sensor_state(Sensor.TYPE_GYROSCOPE, data.gyro_state, data.sensor_delay);
		   data.gyro_check.setOnClickListener(new OnClickListener() {
		   public void onClick(View arg0) {
			   if (data.gyro_check.isChecked())
				   data.gyro_state = true;
			   else
				   data.gyro_state = false;
			   manage.set_sensor_state(Sensor.TYPE_GYROSCOPE, data.gyro_state, data.sensor_delay);
		   }
	   });
       }
    }

	@Override
	protected void onResume() {
	    data.accel_state = data.accel_check.isChecked();
	    data.prox_state = data.prox_check.isChecked();
	    data.mag_state = data.mag_check.isChecked();
	    data.pressure_state = data.pressure_check.isChecked();
	    data.temperature_state = data.temperature_check.isChecked();
	    data.gyro_state = data.gyro_check.isChecked();

	    manage.set_sensor_state(Sensor.TYPE_PROXIMITY, data.prox_state, data.sensor_delay);
	    manage.set_sensor_state(Sensor.TYPE_LIGHT, true, data.sensor_delay);
	    manage.set_sensor_state(Sensor.TYPE_ACCELEROMETER, data.accel_state, data.sensor_delay);
	    manage.set_sensor_state(Sensor.TYPE_MAGNETIC_FIELD, data.mag_state, data.sensor_delay);
	    manage.set_sensor_state(Sensor.TYPE_PRESSURE, data.pressure_state, data.sensor_delay);
	    manage.set_sensor_state(Sensor.TYPE_TEMPERATURE, data.temperature_state, data.sensor_delay);
	    manage.set_sensor_state(Sensor.TYPE_GYROSCOPE, data.gyro_state, data.sensor_delay);
	    manage.ok_to_toast = false;
	    super.onResume();
	}

	@Override
	protected void onStop() {
		manage.set_sensor_state(Sensor.TYPE_PROXIMITY, false, data.sensor_delay);
		manage.set_sensor_state(Sensor.TYPE_LIGHT, false, data.sensor_delay);
		manage.set_sensor_state(Sensor.TYPE_ACCELEROMETER, false, data.sensor_delay);
		manage.set_sensor_state(Sensor.TYPE_MAGNETIC_FIELD, false, data.sensor_delay);
		manage.set_sensor_state(Sensor.TYPE_PRESSURE, false, data.sensor_delay);
		manage.set_sensor_state(Sensor.TYPE_TEMPERATURE, false, data.sensor_delay);
		manage.set_sensor_state(Sensor.TYPE_GYROSCOPE, false, data.sensor_delay);
	    manage.ok_to_toast = false;
	    super.onStop();
	}
    @Override
    public void onCreateContextMenu(ContextMenu menu, View v,ContextMenuInfo menuInfo) {

	super.onCreateContextMenu(menu, v, menuInfo);
	if (v.getId() == R.id.acc_delay) {
		if (data.accel_state == true) {
			menu.setHeaderTitle("Accelerometer Delay Menu");
			Main.manage.sensor_to_manage = Sensor.TYPE_ACCELEROMETER;
		menu.add(0, 0, 0, "Fastest");
			menu.add(0, 1, 0, "Gamer");
			menu.add(0, 2, 0, "UI");
			menu.add(0, 3, 0, "Normal");
		} else {
			Log.e(TESTING_TAG, WARN_TAG + "Accelerometer not enabled");
			return;
		}
	} else if (v.getId() == R.id.mag_delay) {
		if (data.mag_state == true) {
			menu.setHeaderTitle("Magnetometer Delay Menu");
			Main.manage.sensor_to_manage = Sensor.TYPE_MAGNETIC_FIELD;
		menu.add(0, 0, 0, "Fastest");
			menu.add(0, 1, 0, "Gamer");
			menu.add(0, 2, 0, "UI");
			menu.add(0, 3, 0, "Normal");
		} else {
			Log.e(TESTING_TAG, WARN_TAG + "Magnetometer not enabled");
			return;
		}
         } else if (v.getId() == R.id.gyro_delay) {
		if (data.gyro_state == true) {
			menu.setHeaderTitle("Gyroscope Delay Menu");
			Main.manage.sensor_to_manage = Sensor.TYPE_GYROSCOPE;
		menu.add(0, 0, 0, "Fastest");
			menu.add(0, 1, 0, "Gamer");
			menu.add(0, 2, 0, "UI");
			menu.add(0, 3, 0, "Normal");
		} else {
			Log.e(TESTING_TAG, WARN_TAG + "Gyroscope not enabled");
			return;
		}
	} else if (v.getId() == R.id.press_unit) {
			if (data.pressure_state == true) {
				Main.manage.sensor_to_manage = Sensor.TYPE_PRESSURE;
			menu.setHeaderTitle("Pressure Unit Menu");
		menu.add(0, 0, 0, "Pascals");
			menu.add(0, 1, 0, "mmHg");
			menu.add(0, 2, 0, "inHg");
			} else {
			Log.e(TESTING_TAG, WARN_TAG + "Pressure Sensor not enabled");
			return;
		}
	} else if (v.getId() == R.id.temp_unit) {
		if (data.temperature_state == true) {
			Main.manage.sensor_to_manage = Sensor.TYPE_TEMPERATURE;
			menu.setHeaderTitle("Temperature Unit Menu");
			menu.add(0, 0, 0, "Celcius");
			menu.add(0, 1, 0, "Farenheit");
			} else {
			Log.e(TESTING_TAG, WARN_TAG + "Temperature Sensor not enabled");
			return;
		}
	}else {
		return;
	}
	}

    @Override
    public boolean onContextItemSelected(MenuItem item) {
        boolean err = false;
	int delay = SensorManager.SENSOR_DELAY_NORMAL;

	if (Main.manage.sensor_to_manage == Sensor.TYPE_PRESSURE) {
		 if(item.getItemId() == 0) {
			 data.pressure_measurement = 0;
			Log.d(TESTING_TAG, INFO_TAG + "Setting Pressure data to Pascals");
	        } else if(item.getItemId() == 1){
			data.pressure_measurement = 1;
			Log.d(TESTING_TAG, INFO_TAG + "Setting Pressure data to mmHg");
	        } else if(item.getItemId() == 2){
			data.pressure_measurement = 2;
			Log.d(TESTING_TAG, INFO_TAG + "Setting Pressure data to inHg");
	        } else {
			Log.e(TESTING_TAG, FAIL_TAG + "Unknown Pressure scale requested");
			return false;
	        }
	} else if (Main.manage.sensor_to_manage == Sensor.TYPE_TEMPERATURE) {
		 if(item.getItemId() == 0) {
				data.temperature_measurement = 0;
				Log.d(TESTING_TAG, INFO_TAG + "Setting Temperature data to Celcius");
	        } else if(item.getItemId() == 1){
			 data.temperature_measurement = 1;
			 Log.d(TESTING_TAG, INFO_TAG + "Setting Temperature to Farenheit");
	        } else {
			Log.e(TESTING_TAG, FAIL_TAG + "Unknown Pressure scale requested");
			return false;
	        }
	} else {
	        if(item.getItemId() == 0) {
			Toast.makeText(getBaseContext(), "Setting to Fastest Speed",
					Toast.LENGTH_SHORT).show();
			delay = SensorManager.SENSOR_DELAY_FASTEST;
			Log.d(TESTING_TAG, INFO_TAG + "Fastest data rate requested");
	        } else if(item.getItemId() == 1){
			Toast.makeText(getBaseContext(), "Setting to Gaming Speed",
					Toast.LENGTH_SHORT).show();
			delay = SensorManager.SENSOR_DELAY_GAME;
			Log.d(TESTING_TAG, INFO_TAG + "Gaming data rate requested");
	        } else if(item.getItemId() == 2){
			Toast.makeText(getBaseContext(), "Setting to UI Speed",
					Toast.LENGTH_SHORT).show();
			delay = SensorManager.SENSOR_DELAY_UI;
			Log.d(TESTING_TAG, INFO_TAG + "UI data rate requested");
	        } else if(item.getItemId() == 3){
			Toast.makeText(getBaseContext(), "Setting to Normal Speed",
					Toast.LENGTH_SHORT).show();
			delay = SensorManager.SENSOR_DELAY_NORMAL;
			Log.d(TESTING_TAG, INFO_TAG + "Normal data rate requested");
	        } else {
			Log.e(TESTING_TAG, FAIL_TAG + "Unknown data rate requested");
			return false;
	        }

	        data.sensor_delay = delay;

	        err = manage.set_sensor_delay(Main.manage.sensor_to_manage, delay);
	        if (err != true) {
			Toast.makeText(getBaseContext(), "Delay was not set",
					Toast.LENGTH_SHORT).show();
			Log.e(TESTING_TAG, FAIL_TAG + "Sensor delay was not set");
			return err;
	        }
	}

        return true;
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);
        int groupId = 0;
        int menuItemOrder = Menu.NONE;
        MenuItem quitmenuItem = menu.add(groupId, 0, menuItemOrder, "Quit");
        quitmenuItem.setIcon(R.drawable.exit);
        MenuItem aboutmenuItem = menu.add(groupId, 1, menuItemOrder, "About This Application");
        aboutmenuItem.setIcon(R.drawable.about);

        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle item selection
        switch (item.getItemId()) {
        //Quit
        case 0:
		this.onStop();
		finish();
		break;
        //Help
        case 1:
            AlertDialog.Builder helpbox = new AlertDialog.Builder(this);
            helpbox.setMessage("Texas Instruments Sensor Test Application Version: " + VER_NUM);
            helpbox.setNeutralButton("Ok", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface arg0, int arg1) {
		// Do nothing as there is nothing to do
            }
            });
            helpbox.show();
		return true;
        default:
            return super.onOptionsItemSelected(item);
        }
        return true;
    }
}
