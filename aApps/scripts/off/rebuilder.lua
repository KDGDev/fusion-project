jWriteLog('Processing script...')

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

if ApkName == "services.jar" then
	jWriteLog('Processing Services...')
	local fileName = Apk .. fixSep('/com/android/server/pm/PackageManagerService.smali')
	if file_exists(fileName) then
		local fileString = getStringFromFile(fileName)
		fileString = jReplaceAll(fileString, [[(\.method static compareSignatures\(\[Landroid/content/pm/Signature;\[Landroid/content/pm/Signature;\)I)[\w\W]*?(\.end method)]], [[$1
		.locals 7
		const/4 v0, 0x0
		return v0
	$2]])
		fileString = jReplaceAll(fileString, [[(\.method static compareSignaturesLP\(\[Landroid/content/pm/Signature;\[Landroid/content/pm/Signature;\)I)[\w\W]*?(\.end method)]], [[$1
		.locals 7
		const/4 v0, 0x0
		return v0
	$2]])
		writeStringToFile(fileName, fileString)
	end
end

jWriteLog('End of processing.')