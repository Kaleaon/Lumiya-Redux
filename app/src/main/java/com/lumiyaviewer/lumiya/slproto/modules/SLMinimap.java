package com.lumiyaviewer.lumiya.slproto.modules;

import android.graphics.Bitmap;
import android.graphics.Color;
import com.google.common.base.Objects;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.react.RequestHandler;
import com.lumiyaviewer.lumiya.react.ResultHandler;
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.caps.SLCapEventQueue;
import com.lumiyaviewer.lumiya.slproto.handler.SLEventQueueMessageHandler;
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import com.lumiyaviewer.lumiya.slproto.messages.CoarseLocationUpdate;
import com.lumiyaviewer.lumiya.slproto.messages.ParcelOverlay;
import com.lumiyaviewer.lumiya.slproto.modules.voice.SLVoice;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo;
import com.lumiyaviewer.lumiya.slproto.types.ImmutableVector;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ParcelData;
import com.lumiyaviewer.lumiya.slproto.users.manager.ChatterListType;
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.utils.UUIDPool;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class SLMinimap extends SLModule {
    public static final float CHAT_RANGE = 20.0f;
    private static final int parcelBitmapSize = 256;
    public static final int parcelDataSize = 64;
    private static final byte parcelOverlayFlagBorderSouth = Byte.MIN_VALUE;
    private static final byte parcelOverlayFlagBorderWest = 64;
    private static final byte parcelOverlayFlagPrivate = 32;
    private static final byte parcelOverlayTypeAuction = 5;
    private static final byte parcelOverlayTypeForSale = 4;
    private static final byte parcelOverlayTypeMask = 15;
    private static final byte parcelOverlayTypeOwnedByGroup = 2;
    private static final byte parcelOverlayTypeOwnedByOther = 1;
    private static final byte parcelOverlayTypeOwnedBySelf = 3;
    private static final byte parcelOverlayTypePublic = 0;
    private static final int parcelUpsampleFactor = 4;
    private boolean afterTeleport;
    private int chatRangeUsersCount;

    @Nonnull
    private volatile MinimapBitmap minimapBitmap;
    private int myAvatarParcelDataIndex;

    @Nullable
    private ImmutableVector myAvatarPosition;
    private int nearbyUsersCount;
    private final int[] parcelIDs;
    private final Map<Integer, ParcelData> parcels;
    private final RequestHandler<SubscriptionSingleKey> userLocationRequestHandler;
    private final ResultHandler<SubscriptionSingleKey, UserLocations> userLocationsResultHandler;
    private final UserManager userManager;
    private final Map<UUID, UserLocation> userPositions;

    public static class MinimapBitmap {
        private final int bitmapHeight;
        private final int bitmapWidth;
        final int[] colors;

        MinimapBitmap(int i, int i2) {
            this.bitmapWidth = i;
            this.bitmapHeight = i2;
            this.colors = new int[i * i2];
        }

        MinimapBitmap(MinimapBitmap minimapBitmap, int i, int i2, int[] iArr) {
            this.bitmapWidth = minimapBitmap.bitmapWidth;
            this.bitmapHeight = minimapBitmap.bitmapHeight;
            this.colors = Arrays.copyOf(minimapBitmap.colors, minimapBitmap.colors.length);
            System.arraycopy(iArr, 0, this.colors, (this.bitmapHeight * i2) + i, iArr.length);
        }

        public Bitmap makeBitmap() {
            return Bitmap.createBitmap(this.colors, this.bitmapWidth, this.bitmapHeight, Bitmap.Config.ARGB_8888);
        }

        public void updateBitmap(Bitmap bitmap) {
            bitmap.setPixels(this.colors, 0, this.bitmapWidth, 0, 0, this.bitmapWidth, this.bitmapHeight);
        }
    }

    public static class UserLocation {

        @Nonnull
        public final ChatterID chatterID;
        public volatile float distance = Float.NaN;

        @Nonnull
        public volatile ImmutableVector location;

        UserLocation(@Nonnull ChatterID chatterID, @Nonnull ImmutableVector immutableVector) {
            this.chatterID = chatterID;
            this.location = immutableVector;
        }
    }

    public static class UserLocations {
        public final float myAvatarHeading;

        @Nullable
        public final ImmutableVector myAvatarPosition;
        public final Map<UUID, UserLocation> userPositions;

        UserLocations(@Nullable ImmutableVector immutableVector, float f, Map<UUID, UserLocation> map) {
            this.myAvatarPosition = immutableVector;
            this.myAvatarHeading = f;
            this.userPositions = map;
        }
    }

    SLMinimap(SLAgentCircuit sLAgentCircuit) {
        super(sLAgentCircuit);
        this.minimapBitmap = new MinimapBitmap(256, 256);
        this.parcelIDs = new int[4096];
        this.parcels = new ConcurrentHashMap();
        this.nearbyUsersCount = 0;
        this.chatRangeUsersCount = 0;
        this.userPositions = new ConcurrentHashMap(1, 0.75f, 2);
        this.myAvatarPosition = null;
        this.afterTeleport = false;
        this.myAvatarParcelDataIndex = -1;
        this.userLocationRequestHandler = new SimpleRequestHandler<SubscriptionSingleKey>() {
            @Override
            public void onRequest(@Nonnull SubscriptionSingleKey subscriptionSingleKey) {
                if (SLMinimap.this.userLocationsResultHandler != null) {
                    SLMinimap.this.userLocationsResultHandler.onResultData(subscriptionSingleKey, new UserLocations(SLMinimap.this.myAvatarPosition, SLMinimap.this.getMyAvatarHeading(), SLMinimap.this.userPositions));
                }
            }
        };
        this.userManager = UserManager.getUserManager(this.agentCircuit.circuitInfo.agentID);
        if (this.userManager != null) {
            this.userLocationsResultHandler = this.userManager.getUserLocationsPool().attachRequestHandler(this.userLocationRequestHandler);
        } else {
            this.userLocationsResultHandler = null;
        }
        this.afterTeleport = sLAgentCircuit.getAuthReply().fromTeleport ? !sLAgentCircuit.getAuthReply().isTemporary : false;
    }

    public float getMyAvatarHeading() {
        return (this.agentCircuit.getModules().avatarControl.getAgentHeading() * 3.1415927f) / 180.0f;
    }

    private int getParcelDataIndex(ImmutableVector immutableVector) {
        int floor = (int) Math.floor((immutableVector.getX() * 64.0f) / 256.0f);
        int floor2 = (int) Math.floor((immutableVector.getY() * 64.0f) / 256.0f);
        if (floor < 0) {
            floor = 0;
        } else if (floor >= 64) {
            floor = 63;
        }
        return ((floor2 >= 0 ? floor2 >= 64 ? 63 : floor2 : 0) * 64) + floor;
    }

    public void updateAvatarParcelData() {
        ParcelData parcelData = this.myAvatarParcelDataIndex >= 0 ? this.parcels.get(Integer.valueOf(this.parcelIDs[this.myAvatarParcelDataIndex])) : null;
        if (parcelData != null && this.afterTeleport) {
            this.afterTeleport = false;
            this.userManager.getChatterList().getActiveChattersManager().notifyTeleportComplete(parcelData.getName());
        }
        SLVoice sLVoice = this.agentCircuit.getModules().voice;
        if (parcelData != null) {
            sLVoice.setCurrentParcel(parcelData.getParcelID());
        }
        this.userManager.setCurrentLocationInfo(CurrentLocationInfo.create(parcelData, this.nearbyUsersCount, this.chatRangeUsersCount, sLVoice.getCurrentParcelVoiceChannel()));
    }

    @Override
    public void HandleCloseCircuit() {
        if (this.userManager != null) {
            this.userManager.getUserLocationsPool().detachRequestHandler(this.userLocationRequestHandler);
        }
        super.HandleCloseCircuit();
    }

    /* JADX WARN: Removed duplicated region for block: B:66:0x019a  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01a7  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x01c0  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x013c  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x017b  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0188  */
    @com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void HandleCoarseLocationUpdate(CoarseLocationUpdate coarseLocationUpdate) {
        boolean z = false;
        boolean z2;
        boolean z3 = false;
        ParcelData parcelData = this.myAvatarParcelDataIndex >= 0 ? this.parcels.get(Integer.valueOf(this.parcelIDs[this.myAvatarParcelDataIndex])) : null;
        HashSet hashSet = new HashSet(coarseLocationUpdate.Location_Fields.size());
        ParcelData parcelData2 = parcelData;
        HashSet hashSet2 = null;
        boolean z4 = false;
        boolean z5 = false;
        for (int i = 0; i < coarseLocationUpdate.Location_Fields.size() && i < coarseLocationUpdate.AgentData_Fields.size(); i++) {
            CoarseLocationUpdate.Location location = coarseLocationUpdate.Location_Fields.get(i);
            ImmutableVector immutableVector = new ImmutableVector(location.X, location.Y, location.Z * 4);
            if (i != coarseLocationUpdate.Index_Field.You) {
                UUID uuid = coarseLocationUpdate.AgentData_Fields.get(i).AgentID;
                if (!UUIDPool.ZeroUUID.equals(uuid)) {
                    UserLocation userLocation = this.userPositions.get(uuid);
                    if (userLocation == null) {
                        this.userPositions.put(uuid, new UserLocation(ChatterID.getUserChatterID(this.userManager.getUserID(), uuid), immutableVector));
                        z2 = true;
                        z5 = true;
                    } else if (immutableVector.equals(userLocation.location)) {
                        z2 = false;
                    } else {
                        userLocation.location = immutableVector;
                        z2 = true;
                    }
                    if (z2) {
                        if (hashSet2 == null) {
                            hashSet2 = new HashSet();
                        }
                        hashSet2.add(uuid);
                    }
                    hashSet.add(uuid);
                }
            } else if (!Objects.equal(immutableVector, this.myAvatarPosition)) {
                this.myAvatarPosition = immutableVector;
                int parcelDataIndex = getParcelDataIndex(this.myAvatarPosition);
                if (parcelDataIndex != this.myAvatarParcelDataIndex) {
                    this.myAvatarParcelDataIndex = parcelDataIndex;
                    parcelData2 = this.parcels.get(Integer.valueOf(this.parcelIDs[this.myAvatarParcelDataIndex]));
                    z4 = true;
                } else {
                    z4 = true;
                }
            }
        }
        Iterator<UUID> it = this.userPositions.keySet().iterator();
        while (it.hasNext()) {
            UUID next = it.next();
            if (!hashSet.contains(next)) {
                it.remove();
                if (hashSet2 == null) {
                    hashSet2 = new HashSet();
                }
                hashSet2.add(next);
                z5 = true;
            }
        }
        if (this.myAvatarPosition == null) {
            z = false;
        } else if (z4) {
            for (UserLocation userLocation2 : this.userPositions.values()) {
                userLocation2.distance = this.myAvatarPosition.distanceTo(userLocation2.location);
            }
            z = true;
        } else if (hashSet2 != null) {
            Iterator it2 = hashSet2.iterator();
            while (it2.hasNext()) {
                UserLocation userLocation3 = this.userPositions.get((UUID) it2.next());
                if (userLocation3 != null) {
                    userLocation3.distance = this.myAvatarPosition.distanceTo(userLocation3.location);
                }
            }
            z = true;
        }
        if (z || z5) {
            Iterator<UserLocation> it3 = this.userPositions.values().iterator();
            int i2 = 0;
            while (it3.hasNext()) {
                i2 = ((UserLocation) it3.next()).distance <= 20.0f ? i2 + 1 : i2;
            }
            if (i2 != this.chatRangeUsersCount) {
                this.chatRangeUsersCount = i2;
                z3 = true;
            }
            if (this.nearbyUsersCount != this.userPositions.size()) {
                this.nearbyUsersCount = this.userPositions.size();
                z3 = true;
            }
        }
        if (parcelData2 != parcelData || z3) {
            requestUpdateAvatarParcelData();
        }
        if (z5) {
            this.userManager.getChatterList().updateList(ChatterListType.Nearby);
        }
        if (z4) {
            this.userManager.getChatterList().updateDistanceToAllUsers();
        } else if (hashSet2 != null) {
            Iterator it4 = hashSet2.iterator();
            while (it4.hasNext()) {
                this.userManager.getChatterList().updateDistanceToUser((UUID) it4.next());
            }
        }
        if (z4 || hashSet2 != null) {
            this.userManager.getUserLocationsPool().requestUpdate(SubscriptionSingleKey.Value);
        }
    }

    @SLMessageHandler
    public void HandleParcelOverlay(ParcelOverlay parcelOverlay) {
        int i;
        Debug.Log("ParcelOverlay: SequenceID = " + parcelOverlay.ParcelData_Field.SequenceID);
        byte[] bArr = parcelOverlay.ParcelData_Field.Data;
        int length = bArr.length / 64;
        int[] iArr = new int[length * 4 * 64 * 4];
        int i2 = 0;
        for (int i3 = 0; i3 < length; i3++) {
            int i4 = i3 + (parcelOverlay.ParcelData_Field.SequenceID * 16);
            for (int i6 = 0; i6 < 64; i6++) {
                    i = i2;
                    int i7 = 0;
                    switch ((byte) (bArr[i] & 15)) {
                        case 0:
                            i7 = Color.rgb(0, 192, 0);
                            break;
                        case 1:
                            i7 = Color.rgb(32, 128, 32);
                            break;
                        case 2:
                            i7 = Color.rgb(0, 128, 128);
                            break;
                        case 3:
                            i7 = Color.rgb(0, 255, 255);
                            break;
                        case 4:
                            i7 = Color.rgb(128, 128, 0);
                            break;
                        case 5:
                            i7 = Color.rgb(255, 255, 0);
                            break;
                    }
                    if ((bArr[i] & 32) != 0) {
                        int red = Color.red(i7);
                        int green = Color.green(i7);
                        int blue = Color.blue(i7);
                        int i8 = red + 64;
                        if (i8 >= 255) {
                            int i9 = i8 - 255;
                            i8 -= i9;
                            green -= i9;
                            blue -= i9;
                            if (green < 0) {
                                green = 0;
                            }
                            if (blue < 0) {
                                blue = 0;
                            }
                        }
                        i7 = Color.rgb(i8, green, blue);
                    }
                    for (int pixelY = 0; pixelY < 4; pixelY++) {
                        int rowOffset = ((((length * 4) - 1) - ((i3 * 4) + pixelY)) * 256) + (i6 * 4);
                        for (int pixelX = 0; pixelX < 4; pixelX++) {
                            iArr[rowOffset + pixelX] = ((pixelY != 0 || i4 == 0 || (bArr[i] & Byte.MIN_VALUE) == 0) && (pixelX != 0 || i6 == 0 || (bArr[i] & 64) == 0)) ? i7 : -1;
                        }
                    }
                    i2 = i + 1;
            }
        }
        this.minimapBitmap = new MinimapBitmap(this.minimapBitmap, 0, (3 - parcelOverlay.ParcelData_Field.SequenceID) * 64, iArr);
        if (this.userManager != null) {
            this.userManager.getMinimapBitmapPool().setData(SubscriptionSingleKey.Value, this.minimapBitmap);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:39:? A[RETURN, SYNTHETIC] */
    @com.lumiyaviewer.lumiya.slproto.handler.SLEventQueueMessageHandler(eventName = com.lumiyaviewer.lumiya.slproto.caps.SLCapEventQueue.CapsEventType.ParcelProperties)
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void HandleParcelProperties(LLSDNode event) {
        boolean avatarParcelChanged = false;
        try {
            LLSDNode parcelData = event.byKey("ParcelData");
            for (int parcelIndex = 0; parcelIndex < parcelData.getCount(); parcelIndex++) {
                ParcelData parcel = new ParcelData(parcelData.byIndex(parcelIndex));
                int parcelId = parcel.getParcelID();
                this.parcels.put(Integer.valueOf(parcelId), parcel);
                boolean[] bitmap = parcel.getParcelBitmap();
                int limit = Math.min(bitmap.length, this.parcelIDs.length);
                for (int bitmapIndex = 0; bitmapIndex < limit; bitmapIndex++) {
                    if (bitmap[bitmapIndex]) {
                        this.parcelIDs[bitmapIndex] = parcelId;
                        avatarParcelChanged |= bitmapIndex == this.myAvatarParcelDataIndex;
                    }
                }
            }
        } catch (LLSDException exception) {
            Debug.Warning(exception);
        }
        if (avatarParcelChanged) {
            requestUpdateAvatarParcelData();
        }
    }

    public Float getDistanceToUser(@Nullable UUID uuid) {
        if (uuid == null) {
            return null;
        }
        UserLocation userLocation = this.userPositions.get(uuid);
        return userLocation != null ? Float.valueOf(userLocation.distance) : Float.valueOf(Float.NaN);
    }

    @Nullable
    public LLVector3 getNearbyAgentLocation(UUID uuid) {
        SLObjectInfo avatarObject;
        if (this.gridConn != null && this.gridConn.parcelInfo != null && (avatarObject = this.gridConn.parcelInfo.getAvatarObject(uuid)) != null) {
            return avatarObject.getAbsolutePosition();
        }
        if (!Objects.equal(uuid, this.circuitInfo.agentID) || this.myAvatarPosition == null) {
            return null;
        }
        return new LLVector3(this.myAvatarPosition.getX(), this.myAvatarPosition.getY(), this.myAvatarPosition.getZ());
    }

    public List<ChatterID> getNearbyChatterList() {
        ArrayList arrayList = new ArrayList(this.userPositions.size());
        Iterator<?> it = this.userPositions.values().iterator();
        while (it.hasNext()) {
            arrayList.add(((UserLocation) it.next()).chatterID);
        }
        return arrayList;
    }

    public void requestUpdateAvatarParcelData() {
        this.agentCircuit.execute(new Runnable() {
            private final /* synthetic */ void $m$0() {
                SLMinimap.this.updateAvatarParcelData();
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
    }
}
