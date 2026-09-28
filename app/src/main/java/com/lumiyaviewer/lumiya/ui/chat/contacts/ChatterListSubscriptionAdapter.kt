package com.lumiyaviewer.lumiya.ui.chat.contacts

import android.content.Context
import android.view.View
import android.view.ViewGroup
import com.google.common.base.Predicate
import com.google.common.collect.ImmutableList
import com.google.common.collect.Iterables
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.manager.ChatterDisplayData
import com.lumiyaviewer.lumiya.slproto.users.manager.ChatterListType
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.io.Closeable
import java.io.IOException

open class ChatterListSubscriptionAdapter : ChatterListSimpleAdapter(), Subscription.OnData<ImmutableList<ChatterDisplayData>>, Closeable {
    private Predicate<ChatterDisplayData> predicate
    private Subscription<ChatterListType, ImmutableList<ChatterDisplayData>> subscription

    constructor(context: Context, userManager: UserManager, chatterListType: ChatterListType) {
        super(context, userManager)
        this.predicate = null
        this.subscription = userManager.getChatterList().getChatterList().subscribe(chatterListType, UIThreadExecutor.getInstance(), (Subscription.OnData<ImmutableList<ChatterDisplayData>>) this)
    }

    constructor(context: Context, userManager: UserManager, chatterListType: ChatterListType, predicate: Predicate<ChatterDisplayData>) {
        super(context, userManager)
        this.predicate = predicate
        this.subscription = userManager.getChatterList().getChatterList().subscribe(chatterListType, UIThreadExecutor.getInstance(), (Subscription.OnData<ImmutableList<ChatterDisplayData>>) this)
    }

        return super.areAllItemsEnabled()
    }

    override fun close() {
        this.subscription.unsubscribe()
    }

        return super.getCount()
    }

        return super.getItem(i)
    }

        return super.getItemId(i)
    }

        return super.getView(i, view, viewGroup)
    }

        return super.hasStableIds()
    }

        return super.isEmpty()
    }

        return super.isEnabled(i)
    }

    override fun onData(immutableList: ImmutableList<ChatterDisplayData>) {
        if (this.predicate == null) {
            setData(immutableList)
        } else {
            setData(ImmutableList.copyOf(Iterables.filter(immutableList, this.predicate)))
        }
    }
}
