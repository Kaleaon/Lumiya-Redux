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
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

/* loaded from: classes.dex */
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
        this.userLocationRequestHandler = new SimpleRequestHandler<SubscriptionSingleKey>() { // from class: com.lumiyaviewer.lumiya.slproto.modules.SLMinimap.1
            @Override // com.lumiyaviewer.lumiya.react.RequestHandler
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

    /* JADX INFO: Access modifiers changed from: private */
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

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: updateAvatarParcelData, reason: merged with bridge method [inline-methods] */
    public void m222com_lumiyaviewer_lumiya_slproto_modules_SLMinimapmthref0() {
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

    @Override // com.lumiyaviewer.lumiya.slproto.modules.SLModule
    public void HandleCloseCircuit() {
        if (this.userManager != null) {
            this.userManager.getUserLocationsPool().detachRequestHandler(this.userLocationRequestHandler);
        }
        super.HandleCloseCircuit();
    }

    @SLMessageHandler
    public void HandleCoarseLocationUpdate(CoarseLocationUpdate coarseLocationUpdate) {
        boolean myPositionChanged = false;
        boolean userListChanged = false;

        ParcelData initialParcelData = (myAvatarParcelDataIndex >= 0 && myAvatarParcelDataIndex < parcelIDs.length)
                ? parcels.get(Integer.valueOf(parcelIDs[myAvatarParcelDataIndex]))
                : null;

        HashSet<UUID> seenAgentUUIDs = new HashSet<>(coarseLocationUpdate.Location_Fields.size());
        ParcelData currentParcelData = initialParcelData;
        Set<UUID> modifiedAgentUUIDs = null;

        int limit = Math.min(coarseLocationUpdate.Location_Fields.size(), coarseLocationUpdate.AgentData_Fields.size());

        for (int i = 0; i < limit; i++) {
            CoarseLocationUpdate.Location location = coarseLocationUpdate.Location_Fields.get(i);
            ImmutableVector newPos = new ImmutableVector(location.X, location.Y, location.Z * 4.0f);

            if (i == coarseLocationUpdate.Index_Field.You) {
                if (!Objects.equal(newPos, myAvatarPosition)) {
                    myAvatarPosition = newPos;
                    int newParcelIndex = getParcelDataIndex(myAvatarPosition);
                    if (newParcelIndex != myAvatarParcelDataIndex) {
                        myAvatarParcelDataIndex = newParcelIndex;
                        if (myAvatarParcelDataIndex >= 0 && myAvatarParcelDataIndex < parcelIDs.length) {
                            currentParcelData = parcels.get(Integer.valueOf(parcelIDs[myAvatarParcelDataIndex]));
                        }
                        myPositionChanged = true;
                    } else {
                        myPositionChanged = true;
                    }
                }
            } else {
                CoarseLocationUpdate.AgentData agentData = coarseLocationUpdate.AgentData_Fields.get(i);
                UUID agentID = agentData.AgentID;
                if (agentID != null && !UUIDPool.ZeroUUID.equals(agentID)) {
                    UserLocation existingLoc = userPositions.get(agentID);
                    boolean posChanged = false;
                    if (existingLoc != null) {
                        if (!newPos.equals(existingLoc.location)) {
                            existingLoc.location = newPos;
                            posChanged = true;
                        }
                    } else {
                        UUID userID = userManager != null ? userManager.getUserID() : UUIDPool.ZeroUUID;
                        ChatterID chatterID = ChatterID.getUserChatterID(userID, agentID);
                        userPositions.put(agentID, new UserLocation(chatterID, newPos));
                        posChanged = true;
                        userListChanged = true;
                    }

                    if (posChanged) {
                        if (modifiedAgentUUIDs == null) {
                            modifiedAgentUUIDs = new HashSet<>();
                        }
                        modifiedAgentUUIDs.add(agentID);
                    }
                    seenAgentUUIDs.add(agentID);
                }
            }
        }

        Iterator<UUID> it = userPositions.keySet().iterator();
        while (it.hasNext()) {
            UUID uuid = it.next();
            if (!seenAgentUUIDs.contains(uuid)) {
                it.remove();
                if (modifiedAgentUUIDs == null) {
                    modifiedAgentUUIDs = new HashSet<>();
                }
                modifiedAgentUUIDs.add(uuid);
                userListChanged = true;
            }
        }

        boolean distancesUpdated = false;
        if (myAvatarPosition != null) {
            if (myPositionChanged) {
                for (UserLocation userLoc : userPositions.values()) {
                    userLoc.distance = myAvatarPosition.distanceTo(userLoc.location);
                }
                distancesUpdated = true;
            } else if (modifiedAgentUUIDs != null) {
                for (UUID uuid : modifiedAgentUUIDs) {
                    UserLocation userLoc = userPositions.get(uuid);
                    if (userLoc != null) {
                        userLoc.distance = myAvatarPosition.distanceTo(userLoc.location);
                    }
                }
                distancesUpdated = true;
            }
        }

        boolean countChanged = false;
        if (distancesUpdated || userListChanged) {
            int chatRangeCount = 0;
            for (UserLocation userLoc : userPositions.values()) {
                if (userLoc.distance <= CHAT_RANGE) {
                    chatRangeCount++;
                }
            }
            if (chatRangeCount != chatRangeUsersCount) {
                chatRangeUsersCount = chatRangeCount;
                countChanged = true;
            }
            if (nearbyUsersCount != userPositions.size()) {
                nearbyUsersCount = userPositions.size();
                countChanged = true;
            }
        }

        if (currentParcelData != initialParcelData || countChanged) {
            requestUpdateAvatarParcelData();
        }

        if (userManager != null) {
            if (userListChanged) {
                userManager.getChatterList().updateList(ChatterListType.Nearby);
            }

            if (myPositionChanged) {
                userManager.getChatterList().updateDistanceToAllUsers();
            } else if (modifiedAgentUUIDs != null) {
                for (UUID uuid : modifiedAgentUUIDs) {
                    userManager.getChatterList().updateDistanceToUser(uuid);
                }
            }

            if (myPositionChanged || modifiedAgentUUIDs != null) {
                userManager.getUserLocationsPool().requestUpdate(SubscriptionSingleKey.Value);
            }
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
        int i3 = 0;
        while (i3 < length) {
            int i4 = i3 + (parcelOverlay.ParcelData_Field.SequenceID * 16);
            int i5 = 0;
            while (true) {
                int i6 = i5;
                i = i2;
                if (i6 < 64) {
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
                    int i10 = 0;
                    while (true) {
                        int i11 = i10;
                        if (i11 < 4) {
                            int i12 = ((((length * 4) - 1) - ((i3 * 4) + i11)) * 256) + (i6 * 4);
                            int i13 = 0;
                            while (true) {
                                int i14 = i13;
                                if (i14 < 4) {
                                    iArr[i12 + i14] = ((i11 != 0 || i4 == 0 || (bArr[i] & Byte.MIN_VALUE) == 0) && (i14 != 0 || i6 == 0 || (bArr[i] & 64) == 0)) ? i7 : -1;
                                    i13 = i14 + 1;
                                }
                            }
                            i10 = i11 + 1;
                        }
                    }
                    i2 = i + 1;
                    i5 = i6 + 1;
                }
            }
            i3++;
            i2 = i;
        }
        this.minimapBitmap = new MinimapBitmap(this.minimapBitmap, 0, (3 - parcelOverlay.ParcelData_Field.SequenceID) * 64, iArr);
        if (this.userManager != null) {
            this.userManager.getMinimapBitmapPool().setData(SubscriptionSingleKey.Value, this.minimapBitmap);
        }
    }

    @SLEventQueueMessageHandler(eventName = SLCapEventQueue.CapsEventType.ParcelProperties)
    public void HandleParcelProperties(LLSDNode event) {
        boolean avatarParcelChanged = false;
        try {
            LLSDNode parcelDataArray = event.byKey("ParcelData");
            int count = parcelDataArray.getCount();
            for (int i = 0; i < count; i++) {
                LLSDNode parcelNode = parcelDataArray.byIndex(i);
                try {
                    ParcelData parcelData = new ParcelData(parcelNode);
                    int parcelID = parcelData.getParcelID();
                    parcels.put(Integer.valueOf(parcelID), parcelData);
                    boolean[] bitmap = parcelData.getParcelBitmap();
                    if (bitmap != null) {
                        int len = Math.min(bitmap.length, parcelIDs.length);
                        for (int cell = 0; cell < len; cell++) {
                            if (bitmap[cell]) {
                                parcelIDs[cell] = parcelID;
                                if (cell == myAvatarParcelDataIndex) {
                                    avatarParcelChanged = true;
                                }
                            }
                        }
                    }
                } catch (LLSDException e) {
                    Debug.Warning(e);
                }
            }
        } catch (LLSDException e) {
            e.printStackTrace();
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
        Iterator<T> it = this.userPositions.values().iterator();
        while (it.hasNext()) {
            arrayList.add(((UserLocation) it.next()).chatterID);
        }
        return arrayList;
    }

    public void requestUpdateAvatarParcelData() {
        this.agentCircuit.execute(new Runnable() { // from class: com.lumiyaviewer.lumiya.slproto.modules.-$Lambda$eaDiotW55nmaHN5_b1ikeJpLLsk
            private final /* synthetic */ void $m$0() {
                ((SLMinimap) this).m222com_lumiyaviewer_lumiya_slproto_modules_SLMinimapmthref0();
            }

            @Override // java.lang.Runnable
            public final void run() {
                $m$0();
            }
        });
    }
}
