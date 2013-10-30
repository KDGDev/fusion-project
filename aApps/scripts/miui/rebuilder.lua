jWriteLog('Processing script...')
--print(workDir)
--print(Apk)
--print(ApkName)
--print(device)

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

if ApkName == "thememanager.apk" then
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
else
	jWriteLog('Nothing to patch.')	
end

jWriteLog('End of processing.')