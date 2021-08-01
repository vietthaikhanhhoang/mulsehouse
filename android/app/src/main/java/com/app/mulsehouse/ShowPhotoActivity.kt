package com.app.mulsehouse

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.Toast

class ShowPhotoActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_show_photo)

        Log.d("vietnb", "den man hinh showphoto")

        val btnClose = findViewById<Button>(R.id.btnClose)
        btnClose.setOnClickListener {
            Log.d("vietnb", "click close ShowPhoto 1")
        }
    }
}