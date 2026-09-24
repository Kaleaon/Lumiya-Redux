package com.lumiyaviewer.lumiya.slproto.inventory;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteStatement;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Table;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.orm.DBHandle;
import com.lumiyaviewer.lumiya.orm.DBObject;
import com.lumiyaviewer.lumiya.orm.InventoryEntryDBObject;
import com.lumiyaviewer.lumiya.slproto.assets.SLWearable;
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType;
import com.lumiyaviewer.lumiya.utils.SimpleStringParser;
import java.util.Iterator;
import java.util.UUID;
import javax.annotation.Nullable;

public class SLInventoryEntry extends InventoryEntryDBObject implements Parcelable {
    public static final Parcelable.Creator<SLInventoryEntry> CREATOR = new Parcelable.Creator<SLInventoryEntry>() {
        /* JADX WARN: Can't rename method to resolve collision */
        @Override
        public SLInventoryEntry createFromParcel(Parcel parcel) {
            return new SLInventoryEntry(parcel, (SLInventoryEntry) null);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override
        public SLInventoryEntry[] newArray(int i) {
            return new SLInventoryEntry[i];
        }
    };
    private static final String DELIM_ANY = " \t\n";
    private static final String DELIM_EOL = "\n";
    public static final int FT_ANIMATION = 20;
    public static final int FT_BASIC_ROOT = 52;
    public static final int FT_BODYPART = 13;
    public static final int FT_CALLINGCARD = 2;
    public static final int FT_CLOTHING = 5;
    public static final int FT_CURRENT_OUTFIT = 46;
    public static final int FT_ENSEMBLE_END = 45;
    public static final int FT_ENSEMBLE_START = 26;
    public static final int FT_FAVORITE = 23;
    public static final int FT_GESTURE = 21;
    public static final int FT_INBOX = 50;
    public static final int FT_LANDMARK = 3;
    public static final int FT_LOST_AND_FOUND = 16;
    public static final int FT_LSL_TEXT = 10;
    public static final int FT_MESH = 49;
    public static final int FT_MY_OUTFITS = 48;
    public static final int FT_NOTECARD = 7;
    public static final int FT_OBJECT = 6;
    public static final int FT_OUTBOX = 51;
    public static final int FT_OUTFIT = 47;
    public static final int FT_ROOT_INVENTORY = 8;
    public static final int FT_SNAPSHOT_CATEGORY = 15;
    public static final int FT_SOUND = 1;
    public static final int FT_TEXTURE = 0;
    public static final int FT_TRASH = 14;
    public static final int II_FLAGS_WEARABLES_MASK = 255;
    public static final int IT_ANIMATION = 19;
    public static final int IT_ATTACHMENT = 17;
    public static final int IT_BODYPART = 13;
    public static final int IT_CALLINGCARD = 2;
    public static final int IT_CATEGORY = 8;
    public static final int IT_CLOTHING = 5;
    public static final int IT_COUNT = 21;
    public static final int IT_GESTURE = 20;
    public static final int IT_LANDMARK = 3;
    public static final int IT_LOST_AND_FOUND = 16;
    public static final int IT_LSL = 10;
    public static final int IT_LSL_BYTECODE = 11;
    public static final int IT_NOTECARD = 7;
    public static final int IT_OBJECT = 6;
    public static final int IT_ROOT_CATEGORY = 9;
    public static final int IT_SCRIPT = 4;
    public static final int IT_SNAPSHOT = 15;
    public static final int IT_SOUND = 1;
    public static final int IT_TEXTURE = 0;
    public static final int IT_TEXTURE_TGA = 12;
    public static final int IT_TRASH = 14;
    public static final int IT_WEARABLE = 18;
    public static final int PERM_COPY = 32768;
    public static final int PERM_FULL = Integer.MAX_VALUE;
    public static final int PERM_MODIFY = 16384;
    public static final int PERM_TRANSFER = 8192;

    public SLInventoryEntry() {
    }

    public SLInventoryEntry(Cursor cursor) {
        super(cursor);
    }

    public SLInventoryEntry(SQLiteDatabase sqLiteDatabase, long j) throws DBObject.DatabaseBindingException {
        super(sqLiteDatabase, j);
    }

    private SLInventoryEntry(Parcel parcel) {
        super(parcel);
    }

    /* synthetic */ SLInventoryEntry(Parcel parcel, SLInventoryEntry inventoryEntry) {
        this(parcel);
    }

    public SLInventoryEntry(DBHandle dbHandle, long j) throws DBObject.DatabaseBindingException {
        super(dbHandle != null ? dbHandle.getDB() : null, j);
    }

    public static SLInventoryEntry find(SQLiteDatabase sqLiteDatabase, UUID uuid) {
        try {
            Cursor query = sqLiteDatabase.query(InventoryEntryDBObject.tableName, fieldNames, "uuid_low = ? AND uuid_high = ?", new String[]{Long.toString(uuid.getLeastSignificantBits()), Long.toString(uuid.getMostSignificantBits())}, null, null, null);
            if (!query.moveToFirst()) {
                query.close();
                return null;
            }
            SLInventoryEntry inventoryEntry = new SLInventoryEntry(query);
            query.close();
            return inventoryEntry;
        } catch (SQLiteException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static SLInventoryEntry findOrCreate(SQLiteDatabase sqLiteDatabase, UUID uuid) throws DBObject.DatabaseBindingException {
        if (sqLiteDatabase == null) {
            throw new DBObject.DatabaseBindingException(SLInventoryEntry.class, "database is null");
        }
        if (uuid == null) {
            throw new DBObject.DatabaseBindingException(SLInventoryEntry.class, "folderUUID is null");
        }
        Cursor query = sqLiteDatabase.query(InventoryEntryDBObject.tableName, fieldNames, "uuid_low = ? AND uuid_high = ?", new String[]{Long.toString(uuid.getLeastSignificantBits()), Long.toString(uuid.getMostSignificantBits())}, null, null, null);
        if (query.moveToFirst()) {
            SLInventoryEntry inventoryEntry = new SLInventoryEntry(query);
            query.close();
            return inventoryEntry;
        }
        query.close();
        SLInventoryEntry inventoryEntry2 = new SLInventoryEntry();
        inventoryEntry2.uuid = uuid;
        return inventoryEntry2;
    }

    public static SLInventoryEntry findOrCreateForUpdate(SQLiteDatabase sqLiteDatabase, UUID uuid) throws DBObject.DatabaseBindingException {
        if (sqLiteDatabase == null) {
            throw new DBObject.DatabaseBindingException(SLInventoryEntry.class, "database is null");
        }
        if (uuid == null) {
            throw new DBObject.DatabaseBindingException(SLInventoryEntry.class, "folderUUID is null");
        }
        Cursor query = sqLiteDatabase.query(InventoryEntryDBObject.tableName, new String[]{"_id"}, "uuid_low = ? AND uuid_high = ?", new String[]{Long.toString(uuid.getLeastSignificantBits()), Long.toString(uuid.getMostSignificantBits())}, null, null, null);
        if (!query.moveToFirst()) {
            query.close();
            SLInventoryEntry inventoryEntry = new SLInventoryEntry();
            inventoryEntry.uuid = uuid;
            return inventoryEntry;
        }
        SLInventoryEntry inventoryEntry2 = new SLInventoryEntry();
        inventoryEntry2._id = query.getLong(0);
        inventoryEntry2.uuid = uuid;
        query.close();
        return inventoryEntry2;
    }

    private static int getDrawableResourceForType(int i) {
        switch (i) {
            case 0:
            case 12:
            case 15:
                return R.drawable.inv_image;
            case 1:
                return R.drawable.inv_sound;
            case 2:
                return R.drawable.inv_vcard;
            case 3:
                return R.drawable.inv_landmark;
            case 4:
            case 10:
            case 11:
                return R.drawable.inv_script;
            case 5:
            case 17:
            case 18:
                return R.drawable.inv_clothes;
            case 6:
                return R.drawable.inv_object;
            case 7:
                return R.drawable.inv_notecard;
            case 8:
            case 9:
                return R.drawable.inv_folder;
            case 13:
                return R.drawable.inv_human;
            case 14:
                return R.drawable.inv_trash;
            case 16:
                return R.drawable.inv_recycle;
            case 19:
                return R.drawable.inv_animation;
            case 20:
                return R.drawable.inv_smile;
            default:
                return -1;
        }
    }

    public static SQLiteStatement getInsertStatement(SQLiteDatabase sqLiteDatabase) throws DBObject.DatabaseBindingException {
        if (sqLiteDatabase == null) {
            throw new DBObject.DatabaseBindingException("Database is closed");
        }
        if (!sqLiteDatabase.isOpen()) {
            throw new DBObject.DatabaseBindingException("Database is closed");
        }
        try {
            return sqLiteDatabase.compileStatement(InventoryEntryDBObject.insertQuery);
        } catch (SQLiteException e) {
            DBObject.DatabaseBindingException databaseBindingException = new DBObject.DatabaseBindingException(e.getMessage());
            databaseBindingException.initCause(e);
            throw databaseBindingException;
        }
    }

    public static SQLiteStatement getUpdateStatement(SQLiteDatabase sqLiteDatabase) throws DBObject.DatabaseBindingException {
        if (sqLiteDatabase == null) {
            throw new DBObject.DatabaseBindingException("Database is closed");
        }
        if (!sqLiteDatabase.isOpen()) {
            throw new DBObject.DatabaseBindingException("Database is closed");
        }
        try {
            return sqLiteDatabase.compileStatement("UPDATE Entries SET parent_id=?,uuid_high=?,uuid_low=?,parentUUID_high=?,parentUUID_low=?,name=?,isFolder=?,typeDefault=?,version=?,sessionID_high=?,sessionID_low=?,fetchFailed=?,description=?,flags=?,invType=?,assetType=?,creationDate=?,_blobField=? WHERE uuid_high = ? AND uuid_low = ?");
        } catch (SQLiteException e) {
            DBObject.DatabaseBindingException databaseBindingException = new DBObject.DatabaseBindingException(e.getMessage());
            databaseBindingException.initCause(e);
            throw databaseBindingException;
        }
    }

    private static void parsePermissions(SimpleStringParser simpleStringParser, SLInventoryEntry inventoryEntry) throws SimpleStringParser.StringParsingException {
        simpleStringParser.expectToken("{", DELIM_EOL);
        while (true) {
            String nextToken = simpleStringParser.nextToken(DELIM_ANY);
            if (nextToken.equals("}")) {
                return;
            }
            if (nextToken.equals("base_mask")) {
                inventoryEntry.baseMask = simpleStringParser.getHexToken(DELIM_EOL);
            } else if (nextToken.equals("owner_mask")) {
                inventoryEntry.ownerMask = simpleStringParser.getHexToken(DELIM_EOL);
            } else if (nextToken.equals("group_mask")) {
                inventoryEntry.groupMask = simpleStringParser.getHexToken(DELIM_EOL);
            } else if (nextToken.equals("everyone_mask")) {
                inventoryEntry.everyoneMask = simpleStringParser.getHexToken(DELIM_EOL);
            } else if (nextToken.equals("next_owner_mask")) {
                inventoryEntry.nextOwnerMask = simpleStringParser.getHexToken(DELIM_EOL);
            } else if (nextToken.equals("creator_id")) {
                inventoryEntry.creatorUUID = UUID.fromString(simpleStringParser.nextToken(DELIM_EOL));
            } else if (nextToken.equals("owner_id")) {
                inventoryEntry.ownerUUID = UUID.fromString(simpleStringParser.nextToken(DELIM_EOL));
            } else if (nextToken.equals("last_owner_id")) {
                inventoryEntry.lastOwnerUUID = UUID.fromString(simpleStringParser.nextToken(DELIM_EOL));
            } else if (nextToken.equals("group_id")) {
                inventoryEntry.groupUUID = UUID.fromString(simpleStringParser.nextToken(DELIM_EOL));
            } else {
                simpleStringParser.nextToken(DELIM_EOL);
            }
        }
    }

    private static void parseSaleInfo(SimpleStringParser simpleStringParser, SLInventoryEntry inventoryEntry) throws SimpleStringParser.StringParsingException {
        simpleStringParser.expectToken("{", DELIM_EOL);
        while (true) {
            String nextToken = simpleStringParser.nextToken(DELIM_ANY);
            if (nextToken.equals("}")) {
                return;
            }
            if (nextToken.equals("sale_type")) {
                inventoryEntry.saleType = SLSaleType.getByString(simpleStringParser.nextToken(DELIM_EOL)).getTypeCode();
            } else if (nextToken.equals("sale_price")) {
                inventoryEntry.salePrice = simpleStringParser.getIntToken(DELIM_EOL);
            } else {
                simpleStringParser.nextToken(DELIM_EOL);
            }
        }
    }

    public static SLInventoryEntry parseString(SimpleStringParser simpleStringParser) throws SimpleStringParser.StringParsingException {
        SLInventoryEntry inventoryEntry = new SLInventoryEntry();
        simpleStringParser.expectToken("{", DELIM_EOL);
        while (true) {
            String nextToken = simpleStringParser.nextToken(DELIM_ANY);
            if (nextToken.equals("}")) {
                return inventoryEntry;
            }
            if (nextToken.equals("item_id")) {
                inventoryEntry.uuid = UUID.fromString(simpleStringParser.nextToken(DELIM_EOL));
            } else if (nextToken.equals("parent_id")) {
                inventoryEntry.parentUUID = UUID.fromString(simpleStringParser.nextToken(DELIM_EOL));
            } else if (nextToken.equals("asset_id")) {
                inventoryEntry.assetUUID = UUID.fromString(simpleStringParser.nextToken(DELIM_EOL));
            } else if (nextToken.equals("type")) {
                inventoryEntry.assetType = SLAssetType.getByString(simpleStringParser.nextToken(DELIM_EOL)).getTypeCode();
            } else if (nextToken.equals("inv_type")) {
                inventoryEntry.invType = SLInventoryType.getByString(simpleStringParser.nextToken(DELIM_EOL)).getTypeCode();
            } else if (nextToken.equals("flags")) {
                inventoryEntry.flags = simpleStringParser.getHexToken(DELIM_EOL);
            } else if (nextToken.equals("name")) {
                inventoryEntry.name = simpleStringParser.getPipeTerminatedString(DELIM_EOL);
            } else if (nextToken.equals("desc")) {
                inventoryEntry.description = simpleStringParser.getPipeTerminatedString(DELIM_EOL);
            } else if (nextToken.equals("creation_date")) {
                inventoryEntry.creationDate = simpleStringParser.getIntToken(DELIM_EOL);
            } else if (nextToken.equals("permissions")) {
                simpleStringParser.nextToken(DELIM_EOL);
                parsePermissions(simpleStringParser, inventoryEntry);
            } else if (nextToken.equals("sale_info")) {
                simpleStringParser.nextToken(DELIM_EOL);
                parseSaleInfo(simpleStringParser, inventoryEntry);
            } else {
                simpleStringParser.nextToken(DELIM_EOL);
            }
        }
    }

    public static Cursor query(SQLiteDatabase sqLiteDatabase, String str, String[] strArr, String str2) {
        if (sqLiteDatabase == null) {
            return null;
        }
        try {
            return InventoryEntryDBObject.query(sqLiteDatabase, str, strArr, str2);
        } catch (DBObject.DatabaseBindingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Cursor query(DBHandle dbHandle, String str, String[] strArr, String str2) {
        if (dbHandle == null) {
            return null;
        }
        try {
            return InventoryEntryDBObject.query(dbHandle, str, strArr, str2);
        } catch (DBObject.DatabaseBindingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public int getActionDescriptionResId() {
        SLAssetType byType = SLAssetType.getByType(this.assetType);
        if (byType != null) {
            return byType.getActionDescription();
        }
        switch (this.invType) {
            case 0:
            case 15:
                return this.assetType == SLAssetType.AT_TEXTURE.getTypeCode() ? R.string.asset_action_view : R.string.asset_action_rez;
            case 3:
                return R.string.asset_action_teleport;
            case 6:
                return R.string.asset_action_rez;
            case 7:
                return R.string.asset_action_edit;
            case 10:
                return R.string.asset_action_edit;
            default:
                return -1;
        }
    }

    public int getDrawableResource() {
        SLAssetType byType;
        return this.isFolder ? R.drawable.inv_folder : (isLink() || (byType = SLAssetType.getByType(this.assetType)) == null) ? getDrawableResourceForType(this.invType) : byType.getDrawableResource();
    }

    public String getReadableTextForLink() {
        return SLInventoryType.getByType(this.invType).getReadableName() + ": " + this.name;
    }

    public int getSubtypeDrawableResource() {
        if (!this.isFolder) {
            if (this.assetType == SLAssetType.AT_LINK.getTypeCode() || this.assetType == SLAssetType.AT_LINK_FOLDER.getTypeCode()) {
                return R.drawable.inv_link;
            }
            return -1;
        }
        switch (this.typeDefault) {
            case 0:
            case 15:
                return R.drawable.inv_image;
            case 1:
                return R.drawable.inv_sound;
            case 2:
                return R.drawable.inv_vcard;
            case 3:
            case 23:
                return R.drawable.inv_landmark;
            case 5:
            case 46:
            case 47:
            case 48:
                return R.drawable.inv_clothes;
            case 6:
            case 49:
                return R.drawable.inv_object;
            case 7:
                return R.drawable.inv_notecard;
            case 10:
                return R.drawable.inv_script;
            case 13:
                return R.drawable.inv_human;
            case 14:
                return R.drawable.inv_trash;
            case 16:
                return R.drawable.inv_recycle;
            case 20:
                return R.drawable.inv_animation;
            case 21:
                return R.drawable.inv_smile;
            default:
                return -1;
        }
    }

    public int getTypeDescriptionResId() {
        SLAssetType byType = SLAssetType.getByType(this.assetType);
        if (byType != null) {
            return byType.getTypeDescription();
        }
        switch (this.invType) {
            case 0:
                return R.string.asset_type_texture;
            case 1:
                return R.string.asset_type_sound;
            case 2:
                return R.string.asset_type_calling_card;
            case 3:
                return R.string.asset_type_landmark;
            case 4:
                return R.string.asset_type_script;
            case 5:
                return R.string.asset_type_clothing;
            case 6:
                return R.string.asset_type_object;
            case 7:
                return R.string.asset_type_notecard;
            case 8:
                return R.string.asset_type_folder;
            case 9:
                return R.string.asset_type_root_folder;
            case 10:
                return R.string.asset_type_lsl;
            case 11:
                return R.string.asset_type_lsl_bytecode;
            case 12:
                return R.string.asset_type_texture_tga;
            case 13:
                return R.string.asset_type_bodypart;
            case 14:
                return R.string.asset_type_trash;
            case 15:
                return R.string.asset_type_snapshot;
            case 16:
                return R.string.asset_type_lost_and_found;
            case 17:
                return R.string.asset_type_attachment;
            case 18:
                return R.string.asset_type_wearable;
            case 19:
                return R.string.asset_type_animation;
            case 20:
                return R.string.asset_type_gesture;
            default:
                return R.string.asset_type_unknown;
        }
    }

    public boolean isAnimation() {
        if (this.assetType == SLAssetType.AT_ANIMATION.getTypeCode()) {
            return true;
        }
        return this.assetType == SLAssetType.AT_LINK.getTypeCode() && this.invType == 19;
    }

    public boolean isCopyable() {
        return ((this.ownerMask & this.baseMask) & 32768) != 0;
    }

    public boolean isFolderOrFolderLink() {
        return this.isFolder || this.assetType == SLAssetType.AT_LINK_FOLDER.getTypeCode();
    }

    public boolean isLink() {
        return this.assetType == SLAssetType.AT_LINK.getTypeCode() || this.assetType == SLAssetType.AT_LINK_FOLDER.getTypeCode();
    }

    public boolean isWearable() {
        if (this.assetType == SLAssetType.AT_BODYPART.getTypeCode() || this.assetType == SLAssetType.AT_CLOTHING.getTypeCode()) {
            return true;
        }
        return this.assetType == SLAssetType.AT_LINK.getTypeCode() && this.invType == SLInventoryType.IT_WEARABLE.getTypeCode();
    }

    public void updateOrInsert(SQLiteDatabase sqLiteDatabase) throws DBObject.DatabaseBindingException {
        super.updateOrInsert(sqLiteDatabase, "uuid_low = ? AND uuid_high = ?", new String[]{Long.toString(this.uuid.getLeastSignificantBits()), Long.toString(this.uuid.getMostSignificantBits())});
    }

    @Override
    public void updateOrInsert(SQLiteStatement sqLiteStatement, SQLiteStatement sqLiteStatement2) throws DBObject.DatabaseBindingException {
        sqLiteStatement.bindLong(19, this.uuid.getMostSignificantBits());
        sqLiteStatement.bindLong(20, this.uuid.getLeastSignificantBits());
        super.updateOrInsert(sqLiteStatement, sqLiteStatement2);
    }

    public Object whatIsItemWornOn(@Nullable ImmutableMap<UUID, String> immutableMap, @Nullable Table<SLWearableType, UUID, SLWearable> table, boolean z) {
        if (this.assetType == SLAssetType.AT_LINK.getTypeCode()) {
            if (this.invType == SLInventoryType.IT_WEARABLE.getTypeCode()) {
                if (table != null) {
                    Iterator<?> it = table.cellSet().iterator();
                    while (it.hasNext()) {
                        Table.Cell cell = (Table.Cell) it.next();
                        SLWearableType rowKey = (SLWearableType) cell.getRowKey();
                        UUID uuid = (UUID) cell.getColumnKey();
                        if (rowKey != null && uuid != null && (!z || rowKey.isBodyPart())) {
                            if (uuid.equals(this.assetUUID)) {
                                return rowKey;
                            }
                            SLWearable wearable = (SLWearable) cell.getValue();
                            if (wearable != null && wearable.itemID.equals(this.assetUUID)) {
                                return rowKey;
                            }
                        }
                    }
                }
            } else if (immutableMap != null && !z && immutableMap.containsKey(this.assetUUID)) {
                return Boolean.TRUE;
            }
        } else if (this.assetType == SLAssetType.AT_BODYPART.getTypeCode() || this.assetType == SLAssetType.AT_CLOTHING.getTypeCode()) {
            SLWearableType byCode = SLWearableType.getByCode(this.flags & 255);
            if (byCode != null && table != null && ((!z || !(!byCode.isBodyPart())) && table.contains(byCode, this.assetUUID))) {
                return byCode;
            }
        } else if (immutableMap != null && !z && (immutableMap.containsKey(this.uuid) || immutableMap.containsKey(this.assetUUID))) {
            return Boolean.TRUE;
        }
        return null;
    }
}
