package com.lumiyaviewer.lumiya.slproto

import android.content.Intent
import android.net.Uri
import android.os.Parcel
import android.os.Parcelable
import android.text.TextUtils
import java.util.List

open class SLURL : Parcelable {
    @JvmStatic var CREATOR: Parcelable.Creator<SLURL> = Parcelable.Creator<SLURL>() {
        /* JADX WARN: Can't rename method to resolve collision */
        fun createFromParcel(parcel: Parcel): SLURL {
            return SLURL(parcel, null)
        }

        /* JADX WARN: Can't rename method to resolve collision */
        fun newArray(i: Int): Array<SLURL> {
            return arrayOfNulls<SLURL>(i)
        }
    }
    private var locationName: String = ""
    private var locationX: Int = 0
    private var locationY: Int = 0
    private var locationZ: Int = 0

    public SLURL(Intent intent) throws Exception {
        var pathSegments: MutableList<String>? = null
        this.locationX = 128
        this.locationY = 128
        this.locationZ = 0
        var data: Uri = intent.getData()
        if (data != null && data.getScheme() != null && data.getHost() != null) {
            if (data.getScheme().equalsIgnoreCase("http") || data.getScheme().equalsIgnoreCase("https")) {
                if (data.getHost().equalsIgnoreCase("maps.secondlife.com") && (pathSegments = data.getPathSegments()) != null && pathSegments.size() >= 2 && pathSegments.get(0).equalsIgnoreCase("secondlife")) {
                    this.locationName = pathSegments.get(1)
                    if (this.locationName.equals("")) {
                        this.locationName = null
                    } else {
                        if (pathSegments.size() >= 3) {
                            this.locationX = Integer.parseInt(pathSegments.get(2))
                        }
                        if (pathSegments.size() >= 4) {
                            this.locationY = Integer.parseInt(pathSegments.get(3))
                        }
                        if (pathSegments.size() >= 5) {
                            this.locationZ = Integer.parseInt(pathSegments.get(4))
                        }
                    }
                }
            } else if (data.getScheme().equalsIgnoreCase("secondlife")) {
                this.locationName = data.getHost()
                var pathSegments2: MutableList<String> = data.getPathSegments()
                if (pathSegments2 != null) {
                    if (pathSegments2.size() >= 1) {
                        this.locationX = Integer.parseInt(pathSegments2.get(0))
                    }
                    if (pathSegments2.size() >= 2) {
                        this.locationY = Integer.parseInt(pathSegments2.get(1))
                    }
                    if (pathSegments2.size() >= 3) {
                        this.locationZ = Integer.parseInt(pathSegments2.get(2))
                    }
                }
            }
        }
        if (this.locationName == null) {
            throw Exception("No SLURL data in the given intent")
        }
    }

    fun SLURL(parcel: Parcel): private {
        this.locationX = 128
        this.locationY = 128
        this.locationZ = 0
        this.locationName = parcel.readString()
        this.locationX = parcel.readInt()
        this.locationY = parcel.readInt()
        this.locationZ = parcel.readInt()
    }

    /* synthetic */ SLURL(Parcel parcel, SLURL slurl) {
        this(parcel)
    }
    fun describeContents(): Int {
        return 0
    }

    fun getLocationName(): String {
        return this.locationName
    }

    fun getLocationX(): Int {
        return this.locationX
    }

    fun getLocationY(): Int {
        return this.locationY
    }

    fun getLocationZ(): Int {
        return this.locationZ
    }

    fun getLoginStartLocation(): String {
        return "uri:" + TextUtils.htmlEncode(this.locationName) + "&amp;" + Integer.toString(this.locationX) + "&amp;" + Integer.toString(this.locationY) + "&amp;" + Integer.toString(this.locationZ)
    }
    fun writeToParcel(parcel: Parcel, i: Int) {
        parcel.writeString(this.locationName)
        parcel.writeInt(this.locationX)
        parcel.writeInt(this.locationY)
        parcel.writeInt(this.locationZ)
    }
}
