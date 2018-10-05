use Win32::OLE qw(in with);
$fso = Win32::OLE->new("Scripting.FileSystemObject");
if ($fso->FileExists($ARGV[0])) {
    printf "Absolute path: %s\n", $fso->GetAbsolutePathName($ARGV[0]);
    printf "Type: %s\n", $fso->GetFile($ARGV[0])->Type;
}else {
    printf "File doenst exist in current directory\n";
}