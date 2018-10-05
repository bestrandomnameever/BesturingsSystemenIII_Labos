use Win32::OLE qw(in with);

foreach (keys %INC) {
	print ($_, "\n");
}