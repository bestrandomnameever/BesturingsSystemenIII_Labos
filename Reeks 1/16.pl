use Win32::OLE qw(in with);

$Message = Win32::OLE->new("CDO.Message");
$Configuration = Win32::OLE->new("CDO.Configuration");

foreach (in $Configuration->{Fields}) {
    printf "%s = %s\n", $_->{Name}, $_->{Value};
}
