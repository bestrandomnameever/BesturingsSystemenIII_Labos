use Win32::OLE::Const;

$const = Win32::OLE::Const->Load("^Microsoft CDO for Windows 2000 Library");
print "\ncdoSendUsingPort : ",cdoSendUsingPort;