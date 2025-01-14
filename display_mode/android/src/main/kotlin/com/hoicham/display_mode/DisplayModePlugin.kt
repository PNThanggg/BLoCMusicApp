package com.hoicham.display_mode

import android.app.Activity
import android.content.Context
import android.os.Build
import android.view.Display
import android.view.WindowManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


class DisplayModePlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    companion object {
        private const val METHOD_GET_ACTIVE_MODE = "getActiveMode"
        private const val METHOD_GET_SUPPORTED_MODES = "getSupportedModes"
        private const val METHOD_GET_PREFERRED_MODE = "getPreferredMode"
        private const val METHOD_SET_PREFERRED_MODE = "setPreferredMode"
    }

    private lateinit var channel: MethodChannel
    private var activity: Activity? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "display_mode")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (activity == null) {
            result.error(
                "noActivity",
                "Activity not attached to plugin. App is probably in background.",
                null
            )
            return
        }

        when (call.method) {
            METHOD_GET_ACTIVE_MODE -> {
                getActiveMode(result = result)
            }

            METHOD_GET_SUPPORTED_MODES -> {
                getSupportedModes(result)
            }

            METHOD_GET_PREFERRED_MODE -> {
                getPreferredMode(result)
            }

            METHOD_SET_PREFERRED_MODE -> {
                setPreferredMode(call, result)
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    @Suppress("DEPRECATION")
    private fun getDisplay(): Display? {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            activity!!.display
        } else {
            val windowManager = activity!!.getSystemService(Context.WINDOW_SERVICE) as WindowManager
            return windowManager.defaultDisplay
        }
    }

    private fun getActiveMode(result: Result) {
        if (getDisplay() == null) {
            result.error("noDisplay", "No display found", null)
        } else {
            val mode = getDisplay()!!.mode
            val res = HashMap<String, Any>()
            res["id"] = mode.modeId
            res["width"] = mode.physicalWidth
            res["height"] = mode.physicalHeight
            res["refreshRate"] = mode.refreshRate
            result.success(res)
        }
    }

    private fun getSupportedModes(result: Result) {
        val res: MutableList<HashMap<String, Any>> = mutableListOf()
        val display = getDisplay()
        val modes = display!!.supportedModes

        for (mode in modes) {
            val item = HashMap<String, Any>()
            item["id"] = mode.modeId
            item["width"] = mode.physicalWidth
            item["height"] = mode.physicalHeight
            item["refreshRate"] = mode.refreshRate
            res.add(item)
        }

        result.success(res)
    }

    private fun getPreferredMode(result: Result) {
        val window = activity!!.window
        val params = window.attributes

        val display = getDisplay()
        val modes = display!!.supportedModes

        // look for matching mode and return it
        for (mode in modes) {
            if (params.preferredDisplayModeId == mode.modeId) {
                val item = HashMap<String, Any>()
                item["id"] = mode.modeId
                item["width"] = mode.physicalWidth
                item["height"] = mode.physicalHeight
                item["refreshRate"] = mode.refreshRate
                result.success(item)
                return
            }
        }

        // no match found. return as automatic
        val ret = HashMap<String, Any>()
        ret["id"] = 0
        ret["width"] = 0
        ret["height"] = 0
        ret["refreshRate"] = 0.0
        result.success(ret)
    }

    private fun setPreferredMode(call: MethodCall, result: Result) {
        val mode = call.argument<Int>("mode") ?: -1
        val window = activity!!.window
        val params = window.attributes
        params.preferredDisplayModeId = mode
        window.attributes = params
        result.success(null)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        activity = null
    }
}
