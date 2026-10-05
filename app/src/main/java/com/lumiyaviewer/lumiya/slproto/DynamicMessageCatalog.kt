package com.lumiyaviewer.lumiya.slproto

import com.lumiyaviewer.lumiya.slproto.template.MessageTemplateParser
import com.lumiyaviewer.lumiya.slproto.template.MessageTemplateSchema
import java.io.File
import java.io.InputStream
import java.util.Collections

object DynamicMessageCatalog {

    private const val MAX_CACHE_SIZE = 1000

    // Thread-safe bounded LRU cache capped at 1,000 active message entries
    private val schemaCache: MutableMap<Int, MessageTemplateSchema> = Collections.synchronizedMap(
        object : LinkedHashMap<Int, MessageTemplateSchema>(128, 0.75f, true) {
            override fun removeEldestEntry(eldest: MutableMap.MutableEntry<Int, MessageTemplateSchema>?): Boolean {
                return size > MAX_CACHE_SIZE
            }
        }
    )

    private val nameToSchemaMap: MutableMap<String, MessageTemplateSchema> = HashMap()
    private val idToSchemaMap: MutableMap<Int, MessageTemplateSchema> = HashMap()
    private var isMasterCatalogLoaded = false

    @Synchronized
    fun loadMasterCatalog(inputStream: InputStream) {
        if (isMasterCatalogLoaded) return
        val schemas = MessageTemplateParser.parseStream(inputStream)
        for (schema in schemas) {
            nameToSchemaMap[schema.name] = schema
            idToSchemaMap[schema.messageID] = schema
        }
        isMasterCatalogLoaded = true
    }

    @Synchronized
    fun registerTemplate(schema: MessageTemplateSchema) {
        nameToSchemaMap[schema.name] = schema
        idToSchemaMap[schema.messageID] = schema
        schemaCache[schema.messageID] = schema
    }

    fun getDynamicMessage(messageID: Int): DynamicSLMessage? {
        val schema = getSchema(messageID) ?: return null
        return DynamicSLMessage(schema)
    }

    fun getSchema(messageID: Int): MessageTemplateSchema? {
        // 1. Check thread-safe bounded LRU cache
        var schema = schemaCache[messageID]
        if (schema != null) {
            return schema
        }

        // 2. Check loaded master catalog
        synchronized(this) {
            schema = idToSchemaMap[messageID]
            if (schema != null) {
                schemaCache[messageID] = schema!!
                return schema
            }
        }

        // 3. Auto-load from reference message_template.msg file if available and not yet loaded
        if (!isMasterCatalogLoaded) {
            synchronized(this) {
                if (!isMasterCatalogLoaded) {
                    val refFile = File("recovered/reference/message_template.msg")
                    if (refFile.exists()) {
                        refFile.inputStream().use { loadMasterCatalog(it) }
                        schema = idToSchemaMap[messageID]
                        if (schema != null) {
                            schemaCache[messageID] = schema!!
                            return schema
                        }
                    }
                }
            }
        }

        return null
    }

    @Synchronized
    fun clearCache() {
        schemaCache.clear()
    }

    fun cacheSize(): Int = schemaCache.size
}
