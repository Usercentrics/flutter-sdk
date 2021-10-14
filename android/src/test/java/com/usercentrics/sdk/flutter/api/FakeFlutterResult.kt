package com.usercentrics.sdk.flutter.api

internal class FakeFlutterResult : FlutterResult {

    var successCount: Int = 0
        private set
    var successResultArgument: Any? = null
        private set

    override fun success(result: Any?) {
        successCount++
        successResultArgument = result
    }

    var errorCount: Int = 0
        private set
    var errorCodeArgument: String? = null
        private set
    var errorMessageArgument: String? = null
        private set
    var errorDetailsArgument: Any? = null
        private set

    override fun error(errorCode: String?, errorMessage: String?, errorDetails: Any?) {
        errorCount++
        errorCodeArgument = errorCode
        errorMessageArgument = errorMessage
        errorDetailsArgument = errorDetails
    }

    var notImplementedCount: Int = 0
        private set

    override fun notImplemented() {
        notImplementedCount++
    }

}