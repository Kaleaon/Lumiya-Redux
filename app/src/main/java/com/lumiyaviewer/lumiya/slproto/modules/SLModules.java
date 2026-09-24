package com.lumiyaviewer.lumiya.slproto.modules;

import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.SLGridConnection;
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps;
import com.lumiyaviewer.lumiya.slproto.dispnames.SLDisplayNameFetcher;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory;
import com.lumiyaviewer.lumiya.slproto.modules.finance.SLFinancialInfo;
import com.lumiyaviewer.lumiya.slproto.modules.groups.SLGroupManager;
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.SLMuteList;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController;
import com.lumiyaviewer.lumiya.slproto.modules.search.SLSearch;
import com.lumiyaviewer.lumiya.slproto.modules.texfetcher.SLTextureFetcher;
import com.lumiyaviewer.lumiya.slproto.modules.texuploader.SLTextureUploader;
import com.lumiyaviewer.lumiya.slproto.modules.transfer.SLTransferManager;
import com.lumiyaviewer.lumiya.slproto.modules.voice.SLVoice;
import com.lumiyaviewer.lumiya.slproto.modules.xfer.SLXferManager;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nonnull;

public class SLModules {

    @Nonnull
    public final SLAvatarAppearance avatarAppearance;

    @Nonnull
    public final SLAvatarControl avatarControl;

    @Nonnull
    public final SLDisplayNameFetcher displayNameFetcher;

    @Nonnull
    public final SLDrawDistance drawDistance;

    @Nonnull
    public final SLFinancialInfo financialInfo;

    @Nonnull
    public final SLSearch gridSearch;

    @Nonnull
    public final SLGroupManager groupManager;

    @Nonnull
    public final SLInventory inventory;

    @Nonnull
    public final SLMinimap minimap;
    private final List<SLModule> modules = new ArrayList();

    @Nonnull
    public final SLMuteList muteList;

    @Nonnull
    public final RLVController rlvController;

    @Nonnull
    public final SLTaskInventories taskInventories;

    @Nonnull
    public final SLTextureFetcher textureFetcher;

    @Nonnull
    public final SLTextureUploader textureUploader;

    @Nonnull
    public final SLTransferManager transferManager;

    @Nonnull
    public final SLUserNameFetcher userNameFetcher;

    @Nonnull
    public final SLUserProfiles userProfiles;

    @Nonnull
    public final SLVoice voice;

    @Nonnull
    public final SLWorldMap worldMap;

    @Nonnull
    public final SLXferManager xferManager;

    public SLModules(SLAgentCircuit agentCircuit, SLCaps caps, SLGridConnection gridConnection) {
        List<SLModule> list = this.modules;
        SLUserNameFetcher userNameFetcher = new SLUserNameFetcher(agentCircuit, caps);
        this.userNameFetcher = userNameFetcher;
        list.add(userNameFetcher);
        List<SLModule> modules = this.modules;
        SLSearch search = new SLSearch(agentCircuit);
        this.gridSearch = search;
        modules.add(search);
        List<SLModule> modules2 = this.modules;
        SLMinimap minimap = new SLMinimap(agentCircuit);
        this.minimap = minimap;
        modules2.add(minimap);
        List<SLModule> modules3 = this.modules;
        SLAvatarControl avatarControl = new SLAvatarControl(agentCircuit);
        this.avatarControl = avatarControl;
        modules3.add(avatarControl);
        List<SLModule> modules4 = this.modules;
        SLDrawDistance drawDistance = new SLDrawDistance(agentCircuit);
        this.drawDistance = drawDistance;
        modules4.add(drawDistance);
        List<SLModule> modules5 = this.modules;
        SLInventory inventory = new SLInventory(agentCircuit, caps);
        this.inventory = inventory;
        modules5.add(inventory);
        List<SLModule> modules6 = this.modules;
        SLWorldMap worldMap = new SLWorldMap(agentCircuit);
        this.worldMap = worldMap;
        modules6.add(worldMap);
        List<SLModule> modules7 = this.modules;
        SLTransferManager transferManager = new SLTransferManager(agentCircuit);
        this.transferManager = transferManager;
        modules7.add(transferManager);
        List<SLModule> modules8 = this.modules;
        SLTextureFetcher textureFetcher = new SLTextureFetcher(agentCircuit, caps, gridConnection.authReply.agentAppearanceService);
        this.textureFetcher = textureFetcher;
        modules8.add(textureFetcher);
        List<SLModule> modules9 = this.modules;
        SLTextureUploader textureUploader = new SLTextureUploader(agentCircuit, caps);
        this.textureUploader = textureUploader;
        modules9.add(textureUploader);
        List<SLModule> list11 = this.modules;
        SLAvatarAppearance avatarAppearance = new SLAvatarAppearance(agentCircuit, this.inventory, caps);
        this.avatarAppearance = avatarAppearance;
        list11.add(avatarAppearance);
        List<SLModule> list12 = this.modules;
        RLVController rlvController = new RLVController(agentCircuit);
        this.rlvController = rlvController;
        list12.add(rlvController);
        List<SLModule> list13 = this.modules;
        SLXferManager xferManager = new SLXferManager(agentCircuit);
        this.xferManager = xferManager;
        list13.add(xferManager);
        List<SLModule> list14 = this.modules;
        SLTaskInventories taskInventories = new SLTaskInventories(agentCircuit);
        this.taskInventories = taskInventories;
        list14.add(taskInventories);
        List<SLModule> list15 = this.modules;
        SLMuteList muteList = new SLMuteList(agentCircuit);
        this.muteList = muteList;
        list15.add(muteList);
        List<SLModule> list16 = this.modules;
        SLFinancialInfo financialInfo = new SLFinancialInfo(agentCircuit);
        this.financialInfo = financialInfo;
        list16.add(financialInfo);
        List<SLModule> list17 = this.modules;
        SLGroupManager groupManager = new SLGroupManager(agentCircuit);
        this.groupManager = groupManager;
        list17.add(groupManager);
        List<SLModule> list18 = this.modules;
        SLUserProfiles userProfiles = new SLUserProfiles(agentCircuit, caps);
        this.userProfiles = userProfiles;
        list18.add(userProfiles);
        List<SLModule> list19 = this.modules;
        SLDisplayNameFetcher displayNameFetcher = new SLDisplayNameFetcher(agentCircuit, caps);
        this.displayNameFetcher = displayNameFetcher;
        list19.add(displayNameFetcher);
        List<SLModule> list20 = this.modules;
        SLVoice voice = new SLVoice(agentCircuit, caps);
        this.voice = voice;
        list20.add(voice);
    }

    public void HandleCircuitReady() {
        Iterator<SLModule> it = this.modules.iterator();
        while (it.hasNext()) {
            ((SLModule) it.next()).HandleCircuitReady();
        }
    }

    public void HandleCloseCircuit() {
        Iterator<SLModule> it = this.modules.iterator();
        while (it.hasNext()) {
            ((SLModule) it.next()).HandleCloseCircuit();
        }
    }

    public void HandleGlobalOptionsChange() {
        Iterator<SLModule> it = this.modules.iterator();
        while (it.hasNext()) {
            ((SLModule) it.next()).HandleGlobalOptionsChange();
        }
    }
}
