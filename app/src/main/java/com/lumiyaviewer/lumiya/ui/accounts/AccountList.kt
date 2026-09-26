package com.lumiyaviewer.lumiya.ui.accounts

import android.content.Context
import android.content.SharedPreferences
import android.os.Parcel
import android.os.Parcelable
import androidx.preference.PreferenceManager
import java.util.UUID

class AccountList(private val context: Context) {

    private val accounts = mutableListOf<AccountInfo>()

    init {
        loadAccounts()
    }

    class AccountInfo : Parcelable {
        var loginName: String
        var passwordHash: String
        var gridUUID: UUID?

        constructor(prefs: SharedPreferences, prefix: String) {
            loginName = prefs.getString("${prefix}_login_name", "") ?: ""
            passwordHash = prefs.getString("${prefix}_pwd_hash", "") ?: ""
            gridUUID = UUID.fromString(prefs.getString("${prefix}_grid", "") ?: "")
        }

        private constructor(parcel: Parcel) {
            loginName = parcel.readString() ?: ""
            passwordHash = parcel.readString() ?: ""
            val gridStr = parcel.readString() ?: ""
            gridUUID = if (gridStr == "") null else UUID.fromString(gridStr)
        }

        constructor(loginName: String, passwordHash: String, gridUUID: UUID?) {
            this.loginName = loginName
            this.passwordHash = passwordHash
            this.gridUUID = gridUUID
        }

        override fun describeContents(): Int = 0

        fun saveToPreferences(editor: SharedPreferences.Editor, prefix: String) {
            editor.putString("${prefix}_login_name", loginName)
            editor.putString("${prefix}_pwd_hash", passwordHash)
            editor.putString("${prefix}_grid", gridUUID.toString())
        }

        override fun writeToParcel(parcel: Parcel, flags: Int) {
            parcel.writeString(loginName)
            parcel.writeString(passwordHash)
            parcel.writeString(gridUUID?.toString() ?: "")
        }

        companion object CREATOR : Parcelable.Creator<AccountInfo> {
            override fun createFromParcel(parcel: Parcel): AccountInfo = AccountInfo(parcel)
            override fun newArray(size: Int): Array<AccountInfo?> = arrayOfNulls(size)
        }
    }

    fun addNewAccount(accountInfo: AccountInfo) {
        accounts.add(accountInfo)
    }

    fun deleteAccount(accountInfo: AccountInfo) {
        accounts.remove(accountInfo)
    }

    fun findAccount(loginName: String, gridUUID: UUID): AccountInfo? {
        return accounts.find { it.loginName == loginName && it.gridUUID == gridUUID }
    }

    fun findOrAddAccount(loginName: String, passwordHash: String, gridUUID: UUID): AccountInfo {
        val existing = accounts.find { it.loginName == loginName && it.gridUUID == gridUUID }
        if (existing != null) {
            existing.passwordHash = passwordHash
            savePreferences()
            return existing
        }
        val newAccount = AccountInfo(loginName, passwordHash, gridUUID)
        accounts.add(newAccount)
        savePreferences()
        return newAccount
    }

    fun getAccountList(): List<AccountInfo> = accounts

    fun getAccountList(outList: MutableList<AccountInfo>): List<AccountInfo> {
        outList.clear()
        outList.addAll(accounts)
        return outList
    }

    fun loadAccounts() {
        accounts.clear()
        val prefs = PreferenceManager.getDefaultSharedPreferences(context.applicationContext)
        val count = prefs.getInt("accounts_count", 0)
        for (i in 0 until count) {
            accounts.add(AccountInfo(prefs, "account_$i"))
        }
    }

    fun savePreferences() {
        val editor = PreferenceManager.getDefaultSharedPreferences(context.applicationContext).edit()
        editor.putInt("accounts_count", accounts.size)
        for (i in accounts.indices) {
            accounts[i].saveToPreferences(editor, "account_$i")
        }
        editor.apply()
    }
}
