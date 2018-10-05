use Win32::OLE qw(in with);

# Stop script at error and print
Win32::OLE->Option(Warn => 3);
# Of alternatief Win32::OLE::Warn = 3;

Win32::OLE->new("Excel.Seet");