use Win32::OLE qw(in with);

$excel = Win32::OLE->new("Excel.Seet");
printf "%s\n", Win32::OLE->LastError();