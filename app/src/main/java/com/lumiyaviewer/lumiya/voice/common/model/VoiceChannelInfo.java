package com.lumiyaviewer.lumiya.voice.common.model;

import android.net.Uri;
import android.os.Bundle;
import com.google.common.base.Objects;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class VoiceChannelInfo {
    public final boolean isConference;
    public final boolean isSpatial;
    public final String voiceChannelURI;

    public VoiceChannelInfo(Uri uri) {
        this.voiceChannelURI = uri.getQueryParameter("voiceChannelURI");
        this.isSpatial = Objects.equal(uri.getQueryParameter("isSpatial"), "true");
        this.isConference = Objects.equal(uri.getQueryParameter("isConference"), "true");
    }

    public VoiceChannelInfo(Bundle bundle) {
        this.voiceChannelURI = bundle.getString("voiceChannelURI");
        this.isSpatial = bundle.getBoolean("isSpatial");
        this.isConference = bundle.getBoolean("isConference");
    }

    public VoiceChannelInfo(String voiceChannelURI, boolean isSpatial, boolean isConference) {
        this.voiceChannelURI = voiceChannelURI;
        this.isSpatial = isSpatial;
        this.isConference = isConference;
    }

    /** Spatial parcel channel: "{regionUUID}-{parcelLocalId}" */
    public static VoiceChannelInfo forParcel(@Nonnull UUID regionUUID, int parcelLocalId) {
        return new VoiceChannelInfo(regionUUID.toString() + "-" + parcelLocalId, true, true);
    }

    /** Non-spatial P2P call: "{agentUUID}" */
    public static VoiceChannelInfo forUser(@Nonnull UUID agentUUID) {
        return new VoiceChannelInfo(agentUUID.toString(), false, false);
    }

    /** Estate-wide spatial channel */
    public static VoiceChannelInfo forEstate() {
        return new VoiceChannelInfo("Estate", true, true);
    }

    @Nullable
    public UUID getAgentUUID() {
        if (voiceChannelURI == null || isSpatial) return null;
        try {
            return UUID.fromString(voiceChannelURI);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    public void appendToUri(Uri.Builder builder) {
        builder.appendQueryParameter("voiceChannelURI", this.voiceChannelURI);
        builder.appendQueryParameter("isSpatial", !this.isSpatial ? "false" : "true");
        builder.appendQueryParameter("isConference", !this.isConference ? "false" : "true");
    }

    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        VoiceChannelInfo other = (VoiceChannelInfo) obj;
        if (this.isSpatial != other.isSpatial || this.isConference != other.isConference) return false;
        return this.voiceChannelURI == null ? other.voiceChannelURI == null : this.voiceChannelURI.equals(other.voiceChannelURI);
    }

    public int hashCode() {
        return (((!this.isSpatial ? 0 : 1) + ((this.voiceChannelURI == null ? 0 : this.voiceChannelURI.hashCode()) * 31)) * 31) + (this.isConference ? 1 : 0);
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putString("voiceChannelURI", this.voiceChannelURI);
        bundle.putBoolean("isSpatial", this.isSpatial);
        bundle.putBoolean("isConference", this.isConference);
        return bundle;
    }
}
