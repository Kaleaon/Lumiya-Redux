package com.lumiyaviewer.lumiya.ui.render.filament

import com.google.android.filament.Engine
import com.google.android.filament.EntityManager
import com.google.android.filament.Scene
import com.google.android.filament.gltfio.AssetLoader
import com.google.android.filament.gltfio.FilamentAsset
import com.google.android.filament.gltfio.ResourceLoader
import com.google.android.filament.gltfio.UbershaderProvider
import com.lumiyaviewer.lumiya.render.gltf.GlbContainer
import java.nio.ByteBuffer

/** Engine-thread owner for Filament gltfio assets and their embedded textures. */
internal class FilamentGlbAssets(
    engine: Engine,
    private val scene: Scene,
) {
    private val materials = UbershaderProvider(engine)
    private val assetLoader = AssetLoader(engine, materials, EntityManager.get())
    private val resources = ResourceLoader(engine, true)
    private val assets = LinkedHashSet<FilamentAsset>()

    /**
     * Loads one self-contained GLB, including PNG, JPEG, WebP or KTX2 images
     * embedded in its BIN chunk. External URIs are rejected deliberately: SL
     * asset fetches must not let model-authored paths bypass the viewer cache.
     */
    fun load(source: ByteBuffer): FilamentAsset {
        val nativeBuffer = GlbContainer.directCopy(source)
        val asset = requireNotNull(assetLoader.createAsset(nativeBuffer)) { "gltfio rejected GLB payload" }
        try {
            require(asset.resourceUris.isEmpty()) {
                "GLB references external resources: ${asset.resourceUris.joinToString()}"
            }
            resources.loadResources(asset)
            asset.releaseSourceData()
            scene.addEntities(asset.entities)
            assets += asset
            return asset
        } catch (failure: Throwable) {
            assetLoader.destroyAsset(asset)
            throw failure
        }
    }

    fun remove(asset: FilamentAsset) {
        if (!assets.remove(asset)) return
        scene.removeEntities(asset.entities)
        assetLoader.destroyAsset(asset)
    }

    fun destroy() {
        assets.toList().forEach(::remove)
        resources.destroy()
        assetLoader.destroy()
        materials.destroyMaterials()
        materials.destroy()
    }
}
