use Win32::OLE qw(in with);

$cdo = Win32::OLE->new("CDO.message");
$type = Win32::OLE->QueryObjectType($cdo);
print "$type\n";