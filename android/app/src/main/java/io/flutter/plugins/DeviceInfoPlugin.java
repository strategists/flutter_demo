package io.flutter.plugins;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.util.Log;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

import static android.content.Context.BATTERY_SERVICE;

/**
 * @author pm
 * @date 2019/4/29
 * @email puming@zdsoft.cn
 */
public class DeviceInfoPlugin implements MethodChannel.MethodCallHandler {
    private static final String TAG = "DeviceInfoPlugin";
    private static final String CHANNEL = "samples.flutter.io/device_info";
    private Context mContext;

    private DeviceInfoPlugin(Context mContext) {
        this.mContext = mContext;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        if (registrar.activity() == null) {
            // When a background flutter view tries to register the plugin, the registrar has no activity.
            // We stop the registration process as this plugin is foreground only.
            return;
        }
        final MethodChannel channel =
                new MethodChannel(registrar.messenger(), CHANNEL);

        channel.setMethodCallHandler(new DeviceInfoPlugin(registrar.context()));
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if (methodCall.method.equals("getBatteryLevel")) {
            int batteryLevel = getBatteryLevel();
            if (batteryLevel != -1) {
                result.success(batteryLevel);
            } else {
                result.error("UNAVAILABLE", "Battery level not available.", null);
            }
            Log.d(TAG, "onMethodCall: batteryLevel=" + batteryLevel);
        } else {
            result.notImplemented();
        }
    }

    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) mContext.getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager != null ? batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY) : -1;
        } else {
            Intent intent = new ContextWrapper(mContext.getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }

        return batteryLevel;
    }
}
