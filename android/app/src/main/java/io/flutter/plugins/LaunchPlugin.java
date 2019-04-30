package io.flutter.plugins;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.provider.MediaStore;
import android.widget.Toast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * @author pm
 * @date 2019/4/29
 * @email puming@zdsoft.cn
 */
public class LaunchPlugin implements MethodChannel.MethodCallHandler {
    private Activity mActivity;

    public LaunchPlugin(Activity mActivity) {
        this.mActivity = mActivity;
    }

    private static final String CHANNEL = "samples.flutter.io/launch";

    public static void registerWith(PluginRegistry.Registrar registrar) {
        if (registrar.activity() == null) {
            // When a background flutter view tries to register the plugin, the registrar has no activity.
            // We stop the registration process as this plugin is foreground only.
            return;
        }
        final MethodChannel channel =
                new MethodChannel(registrar.messenger(), CHANNEL);

        channel.setMethodCallHandler(new LaunchPlugin(registrar.activity()));
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

    }

    private void launchCamera() {
        // 跳转到系统照相机
        Intent cameraIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        if (cameraIntent.resolveActivity(mActivity.getPackageManager()) != null) {
            // 设置系统相机拍照后的输出路径
            // 创建临时文件
//            mTmpFile = OtherUtils.createFile(getApplicationContext());


//            cameraIntent.putExtra(MediaStore.EXTRA_OUTPUT, Uri.fromFile(mTmpFile));
//            mActivity.startActivityForResult(cameraIntent, REQUEST_CAMERA);
        }

    }
}
