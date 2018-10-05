use Win32::OLE qw(in with);
# $excelLib = Win32::OLE::Const=>Load()
Win32::OLE->Option(Warn => 3);

$fso = Win32::OLE->new("Scripting.FileSystemObject");
foreach $file (in $fso->GetFolder('.')->Files()) {
    if($file->Type =~ /Excel/) {
        printf "%s\n", $file->Name
    }
}
