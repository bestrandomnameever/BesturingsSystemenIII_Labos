use Win32::OLE qw(in with);

$cdo = Win32::OLE->new("CDO.Message");
# Print type variabele ala typeof
print ref $cdo;