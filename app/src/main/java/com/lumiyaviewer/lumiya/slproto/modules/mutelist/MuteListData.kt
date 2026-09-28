package com.lumiyaviewer.lumiya.slproto.modules.mutelist

import com.google.common.base.Predicate
import com.google.common.collect.FluentIterable
import com.google.common.collect.ImmutableList
import com.google.common.collect.ImmutableMap
import com.google.common.collect.Ordering
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.utils.SimpleStringParser
import java.io.BufferedReader
import java.io.ByteArrayInputStream
import java.io.IOException
import java.io.InputStreamReader
import java.util.Map
import java.util.UUID
import javax.annotation.concurrent.Immutable

@Immutable
open class MuteListData {
    @JvmStatic private var ordering: Ordering<MuteListEntry> = Ordering<MuteListEntry>() {
        fun compare(muteListEntry: MuteListEntry, muteListEntry2: MuteListEntry): Int {
            var viewOrder: Int = muteListEntry.type.getViewOrder() - muteListEntry2.type.getViewOrder()
            return if (viewOrder != 0) viewOrder else muteListEntry.name.compareToIgnoreCase(muteListEntry2.name)
        }
    }
    private var muteList: ImmutableMap<MuteListKey, MuteListEntry>? = null
    private var muteListNames: ImmutableMap<String, MuteListEntry>? = null

    constructor() {
        this.muteList = ImmutableMap.of()
        this.muteListNames = ImmutableMap.of()
    }

    constructor(map: MutableMap<MuteListKey, MuteListEntry>, map2: MutableMap<String, MuteListEntry>) {
        this.muteList = ImmutableMap.copyOf(map as Map)
        this.muteListNames = ImmutableMap.copyOf(map2 as Map)
    }

    constructor(bytes: ByteArray) {
        var intToken2: Int = 0
        var builder: ImmutableMap.Builder = ImmutableMap.builder()
        var builder2: ImmutableMap.Builder = ImmutableMap.builder()
        if (bytes != null) {
            try {
                var bufferedReader: BufferedReader = BufferedReader(InputStreamReader(ByteArrayInputStream(bytes)))
                while (true) {
                    var readLine: String = bufferedReader.readLine()
                    if (readLine == null) {

                    }
                    var simpleStringParser: SimpleStringParser = SimpleStringParser(readLine.trim(), " ")
                    try {
                        var intToken: Int = simpleStringParser.getIntToken(" ")
                        var nextToken: String = simpleStringParser.nextToken(" ")
                        simpleStringParser.skipAllDelimiters(" ")
                        var nextToken2: String = simpleStringParser.nextToken("|")
                        simpleStringParser.skipAllDelimiters("|")
                        try {
                            intToken2 = simpleStringParser.getIntToken(" ")
                        } catch (e: SimpleStringParser.StringParsingException) {
                            intToken2 = 0
                        }
                        Debug.Printf("MuteList: line '%s' type %d idstring '%s' name '%s' flags %d", readLine.trim(), intToken, nextToken, nextToken2, intToken2)
                        if (intToken >= 0 && intToken < MuteType.values().length) {
                            var muteType: MuteType = MuteType.values()[intToken]
                            var muteListEntry: MuteListEntry = MuteListEntry(muteType, UUID.fromString(nextToken), nextToken2, intToken2)
                            if (muteType == MuteType.BY_NAME) {
                                builder2.put(nextToken2, muteListEntry)
                            } else {
                                builder.put(MuteListKey(muteListEntry), muteListEntry)
                            }
                        }
                    } catch (e2: SimpleStringParser.StringParsingException) {
                        Debug.Warning(e2)
                    }
                }
            } catch (e3: IOException) {
                Debug.Warning(e3)
            }
        }
        this.muteList = builder.build()
        this.muteListNames = builder2.build()
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_modules_mutelist_MuteListData_3795, reason: not valid java name */
    static /* synthetic */ boolean m236x1ef0929e(MuteListEntry muteListEntry, Map.Entry entry) {
        if (entry != null) {
            return !(entry as String.getKey()).equals(muteListEntry.name)
        }
        return false
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_modules_mutelist_MuteListData_4217, reason: not valid java name */
    static /* synthetic */ boolean m237x1ef0f342(MuteListKey muteListKey, Map.Entry entry) {
        if (entry != null) {
            return !(entry as MuteListKey.getKey()).equals(muteListKey)
        }
        return false
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_modules_mutelist_MuteListData_4795, reason: not valid java name */
    static /* synthetic */ boolean m238x1ef106fd(MuteListEntry muteListEntry, Map.Entry entry) {
        if (entry != null) {
            return !(entry as String.getKey()).equals(muteListEntry.name)
        }
        return false
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_modules_mutelist_MuteListData_5273, reason: not valid java name */
    static /* synthetic */ boolean m239x1ef16857(MuteListKey muteListKey, Map.Entry entry) {
        if (entry != null) {
            return !(entry as MuteListKey.getKey()).equals(muteListKey)
        }
        return false
    }

    fun Block(muteListEntry: final MuteListEntry): MuteListData {
        var muteListKey: MuteListKey = MuteListKey(muteListEntry)
        if (muteListKey.muteType == MuteType.BY_NAME) {
            var builder: ImmutableMap.Builder = ImmutableMap.builder()
            builder.putAll(FluentIterable.from(this.muteListNames.entrySet()).filter(Predicate() {
                private /* synthetic */ boolean $m$0(Object obj) {
                    return MuteListData.m238x1ef106fd(muteListEntry as MuteListEntry, (Map.Entry) obj)
                }
                fun apply(obj: Any): Boolean {
                    return $m$0(obj)
                }
            }))
            builder.put(muteListEntry.name, muteListEntry)
            return MuteListData(this.muteList, builder.build())
        }
        var builder2: ImmutableMap.Builder = ImmutableMap.builder()
        builder2.putAll(FluentIterable.from(this.muteList.entrySet()).filter(Predicate() {
            private /* synthetic */ boolean $m$0(Object obj) {
                return MuteListData.m239x1ef16857(muteListKey as MuteListKey, (Map.Entry) obj)
            }
            fun apply(obj: Any): Boolean {
                return $m$0(obj)
            }
        }))
        builder2.put(muteListKey, muteListEntry)
        return MuteListData(builder2.build(), this.muteListNames)
    }

    fun Unblock(muteListEntry: final MuteListEntry): MuteListData {
        var muteListKey: MuteListKey = MuteListKey(muteListEntry)
        if (muteListKey.muteType == MuteType.BY_NAME) {
            var builder: ImmutableMap.Builder = ImmutableMap.builder()
            builder.putAll(FluentIterable.from(this.muteListNames.entrySet()).filter(Predicate() {
                private /* synthetic */ boolean $m$0(Object obj) {
                    return MuteListData.m236x1ef0929e(muteListEntry as MuteListEntry, (Map.Entry) obj)
                }
                fun apply(obj: Any): Boolean {
                    return $m$0(obj)
                }
            }))
            return MuteListData(this.muteList, builder.build())
        }
        var builder2: ImmutableMap.Builder = ImmutableMap.builder()
        builder2.putAll(FluentIterable.from(this.muteList.entrySet()).filter(Predicate() {
            private /* synthetic */ boolean $m$0(Object obj) {
                return MuteListData.m237x1ef0f342(muteListKey as MuteListKey, (Map.Entry) obj)
            }
            fun apply(obj: Any): Boolean {
                return $m$0(obj)
            }
        }))
        return MuteListData(builder2.build(), this.muteListNames)
    }

    fun getMuteList(): ImmutableList<MuteListEntry> {
        var builder: ImmutableList.Builder = ImmutableList.builder()
        builder.addAll(this as Iterable.muteList.values())
        builder.addAll(this as Iterable.muteListNames.values())
        return ordering.immutableSortedCopy(builder.build())
    }

    fun isMuted(uuid: UUID, muteType: MuteType): Boolean {
        return this.muteList.containsKey(MuteListKey(muteType, uuid))
    }

    fun isMutedByName(str: String): Boolean {
        return this.muteListNames.containsKey(str)
    }
}
