package com.lumiyaviewer.lumiya.slproto.modules.rlv

enum class RLVRestrictionType(private val ruleMatchType: RLVRestrictionType.RLVRuleMatchType) {
    detach(RLVRuleMatchType.TargetSpecifiesRestriction),
    sendchat(RLVRuleMatchType.TargetNoExceptions),
    recvchat(RLVRuleMatchType.TargetSpecifiesException),
    sendim(RLVRuleMatchType.TargetSpecifiesException),
    recvim(RLVRuleMatchType.TargetSpecifiesException),
    tplm(RLVRuleMatchType.TargetNoExceptions),
    tploc(RLVRuleMatchType.TargetNoExceptions),
    sittp(RLVRuleMatchType.TargetNoExceptions),
    tplure(RLVRuleMatchType.TargetSpecifiesException),
    accepttp(RLVRuleMatchType.TargetSpecifiesAllowance),
    showinv(RLVRuleMatchType.TargetNoExceptions),
    viewnote(RLVRuleMatchType.TargetNoExceptions),
    edit(RLVRuleMatchType.TargetSpecifiesException),
    rez(RLVRuleMatchType.TargetNoExceptions),
    unsit(RLVRuleMatchType.TargetNoExceptions),
    sit(RLVRuleMatchType.TargetNoExceptions),
    remoutfit(RLVRuleMatchType.TargetSpecifiesRestriction),
    addoutfit(RLVRuleMatchType.TargetSpecifiesRestriction),
    redirchat(RLVRuleMatchType.TargetSpecifiesRestriction),
    sendchannel(RLVRuleMatchType.TargetSpecifiesException);

    enum class RLVRuleMatchType {
        TargetSpecifiesException,
        TargetSpecifiesRestriction,
        TargetNoExceptions,
        TargetSpecifiesAllowance;

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<RLVRuleMatchType> {
            return values()
        }
    }

    /* renamed from: values, reason: to resolve conflict with enum method */
    fun valuesCustom(): Array<RLVRestrictionType> {
        return values()
    }

    fun getRuleMatchType(): RLVRuleMatchType {
        return this.ruleMatchType
    }
}
