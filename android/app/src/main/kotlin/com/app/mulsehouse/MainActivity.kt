package com.app.mulsehouse

import android.content.Intent
import android.media.audiofx.BassBoost
import android.net.Uri
import android.os.Bundle
import android.provider.Settings.ACTION_SETTINGS
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.util.GeneratedPluginRegister
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
//import io.flutter.plugins.GeneratedPluginRegistrant

import android.provider.Settings.*

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    private fun openBrowser(call: MethodCall, result: Result, url: String?) {
        val activity = this
        if (activity == null) {
            result.error("UNAVAILABLE", "It cannot open the browser without foreground activity", null)
            return
        }
        val intent = Intent(Intent.ACTION_VIEW)
        intent.data = Uri.parse(url)
        activity!!.startActivity(intent)
        result.success(true as Any)
    }

    companion object {
        private val CHANNEL = "flutterplugins.javatpoint.com/interaction"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegister.registerGeneratedPlugins(flutterEngine)

        return MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->

            Log.d("vietnb", "nguoi kia o tron xa")

            val url = call.argument<String>("url")
            if (call.method == "enablepush") {
                val i = Intent(ACTION_SETTINGS)
                startActivity(i)
            } else  if (call.method == "showPhoto") {
                Log.d("vietnb", "goi show photo")
                var intent = Intent(this@MainActivity, ShowPhotoActivity::class.java)
                startActivity(intent)
            } else {
                result.notImplemented()
            }
        }
    }
}

