package com.example.briefnet
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import android.view.WindowManager.LayoutParams.FLAG_SECURE
class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Prevent screenshots
        window.setFlags(FLAG_SECURE, FLAG_SECURE)
    }
}
