use Win32::OLE qw(in with);

$excel = Win32::OLE->new("Excel.Sheet");
$fso = Win32::OLE->new("Scripting.FileSystemObject");
$cdo = Win32::OLE->new("CDO.Message");

$count = Win32::OLE->EnumAllObjects(sub {
    my $object = shift;
    printf "Object %s\n", Win32::OLE->QueryObjectType($object);
})