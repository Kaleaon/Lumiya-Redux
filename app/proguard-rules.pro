# Release build currently runs with minifyEnabled=false; this file is kept
# as a placeholder so Gradle accepts the buildType config and so a future
# minified build has somewhere to grow into. Add -keep rules for reflection
# consumers (greenDAO entity classes, butterknife generated classes, JNI
# callbacks into com.lumiyaviewer.rawbuffers.DirectByteBuffer,
# com.lumiyaviewer.lumiya.openjpeg.*) when you flip minifyEnabled on.

-keep class com.lumiyaviewer.rawbuffers.** { *; }
-keep class com.lumiyaviewer.lumiya.openjpeg.** { *; }
-keepclasseswithmembernames class * { native <methods>; }
-keep @de.greenrobot.dao.annotation.** class * { *; }
