jWriteLog('Processing script...')
--print(workDir)
--print(Apk)
--print(ApkName)
--print(device)

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

if ApkName == "guardprovider.apk" then
	jWriteLog('Processing GuardProvider...')
	local fileName = Apk .. fixSep('/smali/tms/bq.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplaceSmaliFunction(fileString, [[.method public final a()Z]], [[.locals 7
		const/4 v0, 0x1
		return v0]])
		writeStringToFile(fileName, fileString)
	end
elseif ApkName == "services.jar" then
	jWriteLog('Processing Services...')
	local fileName = Apk .. fixSep('/com/android/server/pm/PackageManagerService.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplaceSmaliFunction(fileString, [[.method static compareSignatures([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)I]], [[.locals 7
		const/4 v0, 0x0
		return v0]])
		fileString = jReplaceSmaliFunction(fileString, [[.method static compareSignaturesLP([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)I]], [[.locals 7
		const/4 v0, 0x0
		return v0]])
		writeStringToFile(fileName, fileString)
	end
elseif ApkName == "framework_patch" then
	jWriteLog('Processing framework_patch...')
	local fileName = Apk .. fixSep('/miui/drm/DrmManager.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplaceSmaliFunction(fileString, [[.method public isLegal(Ljava/lang/String;Ljava/io/File;)Z]], [[.locals 7
		const/4 v0, 0x1
		return v0]])
		fileString = jReplaceSmaliFunction(fileString, [[.method public isLegal(Ljava/io/File;Ljava/io/File;)Z]], [[.locals 7
		const/4 v0, 0x1
		return v0]])
		fileString = jReplaceSmaliFunction(fileString, [[.method private isLegal(Ljava/lang/String;Lmiui/drm/DrmManager$RightObject;)Z]], [[.locals 7
		const/4 v0, 0x1
		return v0]])
		writeStringToFile(fileName, fileString)
	end

	fileName = Apk .. fixSep('/miui/provider/yellowpage/YellowPageUtils.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplaceSmaliFunction(fileString, [[.method public static isYellowPageAvailable()Z]], [[.locals 7
		const/4 v0, 0x1
		return v0]])
		writeStringToFile(fileName, fileString)
	end

	fileName = Apk .. fixSep('/com/android/internal/util/XmlUtils.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplaceSmaliFunction(fileString, [[.method public static final convertValueToInt(Ljava/lang/CharSequence;I)I]], [[.registers 6

    if-nez p0, :cond_3

    :goto_2
    return p1

    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "[^0-9\\.]"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    double-to-int p1, v1

    goto :goto_2]])
		writeStringToFile(fileName, fileString)
	end

	fileName = Apk .. fixSep('/miui/provider/yellowpage/request/HostManager.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplaceSmaliFunction(fileString, [[.method public static getYellowPageUpdateUrl()Ljava/lang/String;]], [[.locals 1
    
    .prologue

    const-string v0, "http://localhost"

    return-object v0]])
		fileString = jReplaceSmaliFunction(fileString, [[.method public static getCategoryUpdateUrl()Ljava/lang/String;]], [[.locals 1
    
    .prologue

    const-string v0, "http://localhost"

    return-object v0]])
		fileString = jReplaceSmaliFunction(fileString, [[.method public static getYellowDetail()Ljava/lang/String;]], [[.locals 1
    
    .prologue

    const-string v0, "http://localhost"

    return-object v0]])
		writeStringToFile(fileName, fileString)
	end

	fileName = Apk .. fixSep('/miui/util/HolidayUtils.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplace(fileString, [["http://api.comm.miui.com/holiday/holiday.jsp"]], [["http://cloud.romz.bz/holidays/"]])
		fileString = jReplace(fileString, [["{\"versioncode\":1,\"holiday\":[{\"year\":2013,\"workday\":[5,6,47,48,97,117,118,159,160,265,272,285],\"freeday\":[1,2,3,40,41,42,43,44,45,46,94,95,96,119,120,121,161,162,163,262,263,264,274,275,276,277,278,279,280]}]}"]], [["{\"versioncode\":1,\"holiday\":[{\"year\":2013,\"workday\":[],\"freeday\":[1,2,3,4,7,8,67,121,122,123,129,130,163,308]}]}"]])
		writeStringToFile(fileName, fileString)
	end
elseif ApkName == "thememanager.apk" then
	jWriteLog('Processing ThemeManager...')
	local fileName = Apk .. fixSep('/smali/miui/resourcebrowser/controller/online/OnlineService.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplaceSmaliFunction(fileString, [[.method public getDownloadUrl(Ljava/lang/String;Z)Lmiui/resourcebrowser/controller/online/RequestUrl;]], [[.registers 10
		const/4 v6, 0x1
		new-instance v0, Lmiui/resourcebrowser/controller/online/RequestUrl;
		const-string v1, "http://cloud.romz.bz/thm/?file=%s"
		new-array v2, v6, [Ljava/lang/Object;
		const/4 v3, 0x0
		const-string v4, "?"
		const-string v5, "&"
		invoke-virtual {p1, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
		move-result-object v4
		aput-object v4, v2, v3
		invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
		move-result-object v1
		sget-object v2, Lmiui/resourcebrowser/controller/online/RequestUrl$HostProxyType;->API_PROXY:Lmiui/resourcebrowser/controller/online/RequestUrl$HostProxyType;
		invoke-direct {v0, v1, v6, v2}, Lmiui/resourcebrowser/controller/online/RequestUrl;-><init>(Ljava/lang/String;ILmiui/resourcebrowser/controller/online/RequestUrl$HostProxyType;)V
		const-string v1, "downloadupdate"
		invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;
		move-result-object v2
		invoke-virtual {v0, v1, v2}, Lmiui/resourcebrowser/controller/online/RequestUrl;->addParameter(Ljava/lang/String;Ljava/lang/String;)V
		return-object v0]])
		writeStringToFile(fileName, fileString)
	end

	fileName = Apk .. fixSep('/smali/miui/resourcebrowser/controller/online/DrmService.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplaceSmaliFunction(fileString, [[.method public isLegal(Lmiui/resourcebrowser/model/Resource;)Z]], [[.locals 7
		const/4 v0, 0x1
		return v0]])
		writeStringToFile(fileName, fileString)
	end

	fileName = Apk .. fixSep('/smali/com/android/thememanager/view/LocalBatchOperViewHelper$2$1$1.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplaceSmaliFunction(fileString, [[.method public run()V]], [[.registers 6
    invoke-static {}, Lmiui/resourcebrowser/AppInnerContext;->getInstance()Lmiui/resourcebrowser/AppInnerContext;
    move-result-object v3
    invoke-virtual {v3}, Lmiui/resourcebrowser/AppInnerContext;->getResourceDownloadManager()Lmiui/resourcebrowser/ResourceDownloadManager;
    move-result-object v0
    iget-object v3, p0, Lcom/android/thememanager/view/LocalBatchOperViewHelper$2$1$1;->this$2:Lcom/android/thememanager/view/LocalBatchOperViewHelper$2$1;
    iget-object v3, v3, Lcom/android/thememanager/view/LocalBatchOperViewHelper$2$1;->val$updateList:Ljava/util/List;
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v1
    :cond_10
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :cond_31
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lmiui/resourcebrowser/model/Resource;
    invoke-virtual {v0, v2}, Lmiui/resourcebrowser/ResourceDownloadManager;->isDownloading(Lmiui/resourcebrowser/model/Resource;)Z
    move-result v3
    if-nez v3, :cond_10
    iget-object v3, p0, Lcom/android/thememanager/view/LocalBatchOperViewHelper$2$1$1;->this$2:Lcom/android/thememanager/view/LocalBatchOperViewHelper$2$1;
    iget-object v3, v3, Lcom/android/thememanager/view/LocalBatchOperViewHelper$2$1;->this$1:Lcom/android/thememanager/view/LocalBatchOperViewHelper$2;
    iget-object v3, v3, Lcom/android/thememanager/view/LocalBatchOperViewHelper$2;->this$0:Lcom/android/thememanager/view/LocalBatchOperViewHelper;
    #getter for: Lcom/android/thememanager/view/LocalBatchOperViewHelper;->mResContext:Lmiui/resourcebrowser/ResourceContext;
    invoke-static {v3}, Lcom/android/thememanager/view/LocalBatchOperViewHelper;->access$200(Lcom/android/thememanager/view/LocalBatchOperViewHelper;)Lmiui/resourcebrowser/ResourceContext;
    move-result-object v3
    const/4 v4, 0x1
    invoke-virtual {v0, v4}, Lmiui/resourcebrowser/ResourceDownloadManager;->setUpdate(Z)V
    const/4 v4, 0x0
    invoke-virtual {v0, v2, v3, v4}, Lmiui/resourcebrowser/ResourceDownloadManager;->downloadResource(Lmiui/resourcebrowser/model/Resource;Lmiui/resourcebrowser/ResourceContext;Z)V
    goto :goto_10
    :cond_31
    return-void]])
		writeStringToFile(fileName, fileString)
	end

	fileName = Apk .. fixSep('/smali/miui/resourcebrowser/ResourceDownloadManager.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplace(fileString, [[# instance fields]], [[# static fields
			.field private static mUpdate:Z

			# instance fields]])
		fileString = jAddMethod(fileString, [[.method public setUpdate(Z)V
    .registers 2
    sput-boolean p1, Lmiui/resourcebrowser/ResourceDownloadManager;->mUpdate:Z
    return-void
.end method]])
		fileString = jReplaceSmaliFunction(fileString, [[.method public static generateOnlinePath(Lmiui/resourcebrowser/model/Resource;Lmiui/resourcebrowser/ResourceContext;)Ljava/lang/String;]], [[.registers 8
    invoke-virtual {p0}, Lmiui/resourcebrowser/model/Resource;->getOnlinePath()Ljava/lang/String;
    move-result-object v3
    if-eqz v3, :cond_c
    invoke-virtual {p0}, Lmiui/resourcebrowser/model/Resource;->getOnlinePath()Ljava/lang/String;
    move-result-object v2
    :cond_a
    move-object v3, v2
    :goto_b
    return-object v3
    :cond_c
    invoke-virtual {p0}, Lmiui/resourcebrowser/model/Resource;->getOnlineId()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    move-result v1
    const/4 v2, 0x0
    if-nez v1, :cond_a
    new-instance v3, Lmiui/resourcebrowser/controller/online/OnlineService;
    invoke-direct {v3, p1}, Lmiui/resourcebrowser/controller/online/OnlineService;-><init>(Lmiui/resourcebrowser/ResourceContext;)V
    sget-boolean v4, Lmiui/resourcebrowser/ResourceDownloadManager;->mUpdate:Z
    invoke-virtual {v3, v0, v4}, Lmiui/resourcebrowser/controller/online/OnlineService;->getDownloadUrl(Ljava/lang/String;Z)Lmiui/resourcebrowser/controller/online/RequestUrl;
    move-result-object v3
    invoke-virtual {v3}, Lmiui/resourcebrowser/controller/online/RequestUrl;->getFinalGetUrl()Ljava/lang/String;
    move-result-object v3
    goto :goto_b]])
		writeStringToFile(fileName, fileString)
	end

	fileName = Apk .. fixSep('/smali/miui/resourcebrowser/view/ResourceOperationHandler.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplaceSmaliFunction(fileString, [[.method protected isLegal()Z]], [[.locals 7
		const/4 v0, 0x1
		return v0]])
		fileString = jReplaceSmaliFunction(fileString, [[.method public onUpdateEventPerformed()V]], [[.registers 5
    const/4 v3, 0x1
    new-instance v1, Lmiui/resourcebrowser/view/ResourceOperationHandler$DownloadRightsTask;
    invoke-direct {v1, p0, v3}, Lmiui/resourcebrowser/view/ResourceOperationHandler$DownloadRightsTask;-><init>(Lmiui/resourcebrowser/view/ResourceOperationHandler;Z)V
    const/4 v2, 0x0
    new-array v2, v2, [Ljava/lang/Void;
    invoke-virtual {v1, v2}, Lmiui/resourcebrowser/view/ResourceOperationHandler$DownloadRightsTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    invoke-static {}, Lmiui/resourcebrowser/AppInnerContext;->getInstance()Lmiui/resourcebrowser/AppInnerContext;
    move-result-object v1
    invoke-virtual {v1}, Lmiui/resourcebrowser/AppInnerContext;->getResourceDownloadManager()Lmiui/resourcebrowser/ResourceDownloadManager;
    move-result-object v0
    invoke-virtual {v0, v3}, Lmiui/resourcebrowser/ResourceDownloadManager;->setUpdate(Z)V
    iget-object v1, p0, Lmiui/resourcebrowser/view/ResourceOperationHandler;->mResource:Lmiui/resourcebrowser/model/Resource;
    iget-object v2, p0, Lmiui/resourcebrowser/view/ResourceOperationHandler;->mResContext:Lmiui/resourcebrowser/ResourceContext;
    invoke-virtual {v0, v1, v2}, Lmiui/resourcebrowser/ResourceDownloadManager;->downloadResource(Lmiui/resourcebrowser/model/Resource;Lmiui/resourcebrowser/ResourceContext;)V
    iget-object v1, p0, Lmiui/resourcebrowser/view/ResourceOperationHandler;->mOperationView:Lmiui/resourcebrowser/view/ResourceOperationView;
    invoke-virtual {v1}, Lmiui/resourcebrowser/view/ResourceOperationView;->updateStatus()V
    return-void]])
		fileString = jReplaceAll(fileString, [[(\.method protected onCheckResourceRightEventBeforeRealApply\(\)V)[\s]*?\.registers ([\w])([\w\W]*?)(\.end method)]], [[$1
		.registers $2
		const v0, 0x1
		iput-boolean v0, p0, Lmiui/resourcebrowser/view/ResourceOperationHandler;->mIsLegal:Z
	$3
	$4]])
		writeStringToFile(fileName, fileString)
	end
elseif ApkName == "miuihome.apk" then
	jWriteLog('Processing MiuiHome...')
	local fileName = Apk .. fixSep('/smali/com/miui/home/launcher/gadget/WeatherBase.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplace(fileString, '"market://details?id=com.miui.weather2"', '"http://burgerz.pro/weather-bz/"')
		fileString = jReplace(fileString, '"com.xiaomi.market"', '"com.android.browser"')
		fileString = jReplace(fileString, '"com.miui.weather2"', '"pro.burgerz.weather"')
		fileString = jReplace(fileString, '"com.miui.weather2.ActivityWeatherCycle"', '"pro.burgerz.weather.ActivityWeatherRoot"')
		fileString = jReplaceSmaliFunction(fileString, [[.method public getDate()Ljava/lang/String;]], [[.registers 5
		const-string v2, ""
		iget-object v3, p0, Lcom/miui/home/launcher/gadget/WeatherBase;->mContext:Landroid/content/Context;
		const v4, 0x7f0c007a
		invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;
		move-result-object v1
		invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
		move-result-wide v3
		invoke-static {v1, v3, v4}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;
		move-result-object v3
		invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;
		move-result-object v0
		return-object v0]])
		writeStringToFile(fileName, fileString)
	end
	fileName = Apk .. fixSep('/smali/com/miui/home/launcher/gadget/Weather_2x4_new.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplaceSmaliFunction(fileString, [[.method private paintTempView(Lcom/miui/home/launcher/gadget/Weather_2x4_new$Frame;Ljava/lang/String;)V]], [[.registers 9

    const/16 v5, 0x8

    const/4 v4, 0x0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3b

    :try_start_9
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_c
    .catch Ljava/lang/NumberFormatException; {:try_start_9 .. :try_end_c} :catch_3c

    move-result v1

    :goto_d
    if-gez v1, :cond_40

    iget-object v3, p1, Lcom/miui/home/launcher/gadget/Weather_2x4_new$Frame;->mTempNegativeImageView:Landroid/widget/ImageView;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_14
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v2

    const/16 v3, 0xa

    if-ge v2, v3, :cond_46

    iget-object v3, p1, Lcom/miui/home/launcher/gadget/Weather_2x4_new$Frame;->mTempImageView_1:Landroid/widget/ImageView;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v3, p1, Lcom/miui/home/launcher/gadget/Weather_2x4_new$Frame;->mTempImageView_2:Landroid/widget/ImageView;

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v4, p1, Lcom/miui/home/launcher/gadget/Weather_2x4_new$Frame;->mTempImageView_1:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/miui/home/launcher/gadget/Weather_2x4_new;->mTempImage:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    :cond_3b
    :goto_3b
    return-void

    :catch_3c
    move-exception v0

    const/16 v1, -0x63

    goto :goto_d

    :cond_40
    iget-object v3, p1, Lcom/miui/home/launcher/gadget/Weather_2x4_new$Frame;->mTempNegativeImageView:Landroid/widget/ImageView;

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_14

    :cond_46
    iget-object v3, p1, Lcom/miui/home/launcher/gadget/Weather_2x4_new$Frame;->mTempImageView_1:Landroid/widget/ImageView;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v3, p1, Lcom/miui/home/launcher/gadget/Weather_2x4_new$Frame;->mTempImageView_2:Landroid/widget/ImageView;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v4, p1, Lcom/miui/home/launcher/gadget/Weather_2x4_new$Frame;->mTempImageView_1:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/miui/home/launcher/gadget/Weather_2x4_new;->mTempImage:Ljava/util/HashMap;

    div-int/lit8 v5, v2, 0xa

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    iget-object v4, p1, Lcom/miui/home/launcher/gadget/Weather_2x4_new$Frame;->mTempImageView_2:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/miui/home/launcher/gadget/Weather_2x4_new;->mTempImage:Ljava/util/HashMap;

    rem-int/lit8 v5, v2, 0xa

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto :goto_3b]])
		writeStringToFile(fileName, fileString)
	end
elseif ApkName == "browser.apk" then
	jWriteLog('Processing Browser...')
	local fileName = Apk .. fixSep('/res/xml/advanced_preferences.xml')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplace(fileString, 'android:defaultValue="baidu"', 'android:defaultValue="google"')
		writeStringToFile(fileName, fileString)
	end
elseif ApkName == "browser.apk" then
	jWriteLog('Processing Browser...')
	local fileName = Apk .. fixSep('/res/xml/advanced_preferences.xml')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplace(fileString, 'android:defaultValue="baidu"', 'android:defaultValue="google"')
		writeStringToFile(fileName, fileString)
	end
elseif ApkName == "yellowpage.apk" then
	jWriteLog('Processing YellowPage...')
	local fileName = Apk .. fixSep('/smali/com/miui/yellowpage/providers/yellowpage/YellowPageDatabaseHelper.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplaceSmaliFunction(fileString, [[.method private importAntispamCategory(Landroid/database/sqlite/SQLiteDatabase;)V]], [[.locals 9
    .parameter "db"

    .prologue
    .line 384
    const/4 v4, 0x0

    .line 386
    .local v4, reader:Ljava/io/BufferedReader;
    :try_start_0
    iget-object v7, p0, Lcom/miui/yellowpage/providers/yellowpage/YellowPageDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const/high16 v8, 0x7f06

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v2

    .line 387
    .local v2, is:Ljava/io/InputStream;
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    invoke-direct {v7, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v5, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    .line 388
    .end local v4           #reader:Ljava/io/BufferedReader;
    .local v5, reader:Ljava/io/BufferedReader;
    const/4 v3, 0x0

    .line 389
    .local v3, line:Ljava/lang/String;
    :cond_0
    :goto_0
    :try_start_1
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 391
    const-string v7, "#"

    invoke-virtual {v3, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 395
    const-string v7, "::"

    invoke-virtual {v3, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 396
    .local v0, array:[Ljava/lang/String;
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 397
    .local v6, values:Landroid/content/ContentValues;
    const-string v7, "cid"

    const/4 v8, 0x0

    aget-object v8, v0, v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 398
    const-string v7, "names"

    const/4 v8, 0x1

    aget-object v8, v0, v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    const-string v7, "antispam_category"

    const/4 v8, 0x0

    invoke-virtual {p1, v7, v8, v6}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 401
    .end local v0           #array:[Ljava/lang/String;
    .end local v6           #values:Landroid/content/ContentValues;
    :catch_0
    move-exception v1

    move-object v4, v5

    .line 402
    .end local v2           #is:Ljava/io/InputStream;
    .end local v3           #line:Ljava/lang/String;
    .end local v5           #reader:Ljava/io/BufferedReader;
    .local v1, e:Ljava/lang/Exception;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    :goto_1
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 404
    if-eqz v4, :cond_1

    .line 406
    :try_start_3
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 412
    .end local v1           #e:Ljava/lang/Exception;
    :cond_1
    :goto_2
    return-void

    .line 404
    .end local v4           #reader:Ljava/io/BufferedReader;
    .restart local v2       #is:Ljava/io/InputStream;
    .restart local v3       #line:Ljava/lang/String;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    :cond_2
    if-eqz v5, :cond_4

    .line 406
    :try_start_4
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    move-object v4, v5

    .line 409
    .end local v5           #reader:Ljava/io/BufferedReader;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    goto :goto_2

    .line 407
    .end local v4           #reader:Ljava/io/BufferedReader;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    :catch_1
    move-exception v1

    .line 408
    .restart local v1       #e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    move-object v4, v5

    .line 409
    .end local v5           #reader:Ljava/io/BufferedReader;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    goto :goto_2

    .line 407
    .end local v2           #is:Ljava/io/InputStream;
    .end local v3           #line:Ljava/lang/String;
    :catch_2
    move-exception v1

    .line 408
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 404
    .end local v1           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    :goto_3
    if-eqz v4, :cond_3

    .line 406
    :try_start_5
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 409
    :cond_3
    :goto_4
    throw v7

    .line 407
    :catch_3
    move-exception v1

    .line 408
    .restart local v1       #e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_4

    .line 404
    .end local v1           #e:Ljava/lang/Exception;
    .end local v4           #reader:Ljava/io/BufferedReader;
    .restart local v2       #is:Ljava/io/InputStream;
    .restart local v3       #line:Ljava/lang/String;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    :catchall_1
    move-exception v7

    move-object v4, v5

    .end local v5           #reader:Ljava/io/BufferedReader;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    goto :goto_3

    .line 401
    .end local v2           #is:Ljava/io/InputStream;
    .end local v3           #line:Ljava/lang/String;
    :catch_4
    move-exception v1

    goto :goto_1

    .end local v4           #reader:Ljava/io/BufferedReader;
    .restart local v2       #is:Ljava/io/InputStream;
    .restart local v3       #line:Ljava/lang/String;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    :cond_4
    move-object v4, v5

    .end local v5           #reader:Ljava/io/BufferedReader;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    goto :goto_2]])
		writeStringToFile(fileName, fileString)
	end
elseif ApkName == "updater.apk" then
	jWriteLog('Processing Updater...')
	local fileName = Apk .. fixSep('/smali/com/android/updater/utils/SysUtils.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV4.php"', '"http://ota.romz.bz/update-v4.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV5.php"', '"http://ota.romz.bz/update-v4.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV6.php"', '"http://ota.romz.bz/update-v4.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV7.php"', '"http://ota.romz.bz/update-v5.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV8.php"', '"http://ota.romz.bz/update-v5.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV9.php"', '"http://ota.romz.bz/update-v5.php"')
		fileString = jReplace(fileString, '"http://www.miui.com/api.php?mod=wm', '"http://ota.romz.bz/api.php?mod=wm')
		writeStringToFile(fileName, fileString)
	end
	fileName = Apk .. fixSep('/smali/com/android/updater/b/g.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV4.php"', '"http://ota.romz.bz/update-v4.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV5.php"', '"http://ota.romz.bz/update-v4.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV6.php"', '"http://ota.romz.bz/update-v4.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV7.php"', '"http://ota.romz.bz/update-v5.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV8.php"', '"http://ota.romz.bz/update-v5.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV9.php"', '"http://ota.romz.bz/update-v5.php"')
		fileString = jReplace(fileString, '"http://www.miui.com/api.php?mod=wm', '"http://ota.romz.bz/api.php?mod=wm')
		writeStringToFile(fileName, fileString)
	end
	fileName = Apk .. fixSep('/smali/com/android/updater/b/h.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV4.php"', '"http://ota.romz.bz/update-v4.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV5.php"', '"http://ota.romz.bz/update-v4.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV6.php"', '"http://ota.romz.bz/update-v4.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV7.php"', '"http://ota.romz.bz/update-v5.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV8.php"', '"http://ota.romz.bz/update-v5.php"')
		fileString = jReplace(fileString, '"http://update.miui.com/updates/mi-updateV9.php"', '"http://ota.romz.bz/update-v5.php"')
		fileString = jReplace(fileString, '"http://www.miui.com/api.php?mod=wm', '"http://ota.romz.bz/api.php?mod=wm')
		writeStringToFile(fileName, fileString)
	end
elseif ApkName == "mms.apk" then
	jWriteLog('Processing MMS...')
	local fileName = Apk .. fixSep('/smali/com/android/mms/data/FestivalUpdater.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplace(fileString, 'http://api.comm.miui.com/miuisms/res/categories', 'http://cloud.romz.bz/miuisms/res/categories.php')
		fileString = jReplace(fileString, 'http://api.comm.miui.com/miuisms/res/messages', 'http://cloud.romz.bz/miuisms/res/messages.php')
		writeStringToFile(fileName, fileString)
	end
--[[
elseif ApkName == "contactsprovider.apk" then
	jWriteLog('Processing ContactsProvider...')
	local fileName = Apk .. fixSep('/smali/com/android/providers/contacts/t9/T9Builder.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplace(fileString, 'invoke-static {v4}, Lcom/android/providers/contacts/t9/T9Utils;->d(C)C', 'invoke-static {v4}, Lcom/android/providers/contacts/t9/T9Kdg;->formatCharToT9(C)C')
		fileString = jReplace(fileString, 'Lcom/android/providers/contacts/t9/T9Utils;->formatCharToT9(C)C', 'Lcom/android/providers/contacts/t9/T9Kdg;->formatCharToT9(C)C')
		writeStringToFile(fileName, fileString)
	end
	fileName = Apk .. fixSep('/smali/com/android/providers/contacts/t9/k.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplace(fileString, 'invoke-static {v4}, Lcom/android/providers/contacts/t9/h;->b(C)C', 'invoke-static {v4}, Lcom/android/providers/contacts/t9/T9Kdg;->formatCharToT9(C)C')
		writeStringToFile(fileName, fileString)
	end
	fileName = Apk .. fixSep('/smali/com/android/providers/contacts/t9/r.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplace(fileString, 'invoke-static {v4}, Lcom/android/providers/contacts/t9/f;->b(C)C', 'invoke-static {v4}, Lcom/android/providers/contacts/t9/T9Kdg;->formatCharToT9(C)C')
		writeStringToFile(fileName, fileString)
	end
--]]
else
	jWriteLog('Nothing to patch.')	
end

jWriteLog('End of processing.')