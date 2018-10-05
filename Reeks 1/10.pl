use Win32::OLE::Const;

$excel = Win32::OLE->new("Excel.Sheet");
$fso = Win32::OLE->new("Scripting.FileSystemObject");
$cdo = Win32::OLE->new("CDO.Message");

$excelConsts = Win32::OLE::Const->Load($excel);
$fsoConsts = Win32::OLE::Const->Load($fso);
$cdoConsts = Win32::OLE::Const->Load($cdo);

print "Excel constants: \n";
while(($key, $value) = each %{$excelConsts}) {
    print "%s: %s\n", $key, $value;
}
print "\n";
print "FileSystemObject constants: \n";
while(($key, $value) = each %{$fsoConsts}) {
    print "%s: %s\n", $key, $value;
}
print "\n";
print "CDO.Message constants: \n";
while(($key, $value) = each %{$cdoConsts}) {
    print "%s: %s\n", $key, $value;
}
print "\n";